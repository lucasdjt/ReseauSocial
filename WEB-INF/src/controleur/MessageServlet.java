package controleur;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.dao.ConversationsDAO;
import modele.dao.MessagesDAO;
import modele.dao.UsersDAO;
import modele.dto.Conversation;
import modele.dto.Message;
import modele.dto.User;

@WebServlet("/messages/*")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class MessageServlet extends HttpServlet {
    private static final String REPERTORY = "/WEB-INF/vue/";

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("uid") == null || session.getAttribute("pseudo") == null) {
                res.sendRedirect(req.getContextPath() + "/connexion");
                return;
            }
        int uid = (int) session.getAttribute("uid");
        res.setContentType("text/html; charset=UTF-8");
        res.setCharacterEncoding("UTF-8");
        String pathInfo = req.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            try {
                UsersDAO uDao = new UsersDAO();
                List<Conversation> l = uDao.getUserConversations(uid);
                Map<Integer, User> listUser = new HashMap<>();
                for(Conversation c : l){
                    if(c.getUidEnvoyeur() == uid){
                        listUser.put(c.getCid(), uDao.findByUid(c.getUidReceveur()));
                    } else {
                        listUser.put(c.getCid(), uDao.findByUid(c.getUidEnvoyeur()));
                    }
                }
                List<User> follows = uDao.getUserFollows(uid);
                follows.removeAll(listUser.values());
                req.setAttribute("follows", follows);
                req.setAttribute("listUser", listUser);
                req.getRequestDispatcher(REPERTORY + "messages.jsp").forward(req, res);
            } catch (NumberFormatException e) {
                res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid");
            }
            return;
        }

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length < 2) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid CID format");
            return;
        }
        String cidStr = pathParts[1];
        UsersDAO uDao = new UsersDAO();
        ConversationsDAO dao = new ConversationsDAO();
        try {
            Integer.parseInt(cidStr);
        } catch (NumberFormatException e) {
            try {
                User user = uDao.findByIdPseudo(cidStr);
                if (user == null) {
                    res.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
                    return;
                    
                }
                if(uid > user.getUid()){
                    dao.insert(new Conversation(0, uid, user.getUid()));
                } else {
                    dao.insert(new Conversation(0, user.getUid(), uid));
                }
                List<Conversation> l = uDao.getUserConversations(uid);
                int cid = 0;
                for(Conversation c : l){
                    if(c.getUidEnvoyeur() == uid && c.getUidReceveur() == user.getUid()){
                        cid = c.getCid();
                    }
                }
                res.sendRedirect(req.getContextPath() + "/messages/" + cid);
            } catch (Exception ex) {
                res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating conversation");
            }
            return;
        }
        try {
            int cid = Integer.parseInt(cidStr);
            Conversation conv = dao.findByCid(cid);
            if (conv == null) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND, "Conversation not found");
            return;
            }
            int idReceveur = conv.getUidReceveur();
            if(idReceveur == uid){
                idReceveur = conv.getUidEnvoyeur();
            }
            List<Conversation> l = uDao.getUserConversations(uid);
            Map<Integer, User> listUser = new HashMap<>();
            for(Conversation c : l){
                if(c.getUidEnvoyeur() == uid){
                    listUser.put(c.getCid(), uDao.findByUid(c.getUidReceveur()));
                } else {
                    listUser.put(c.getCid(), uDao.findByUid(c.getUidEnvoyeur()));
                }
            }
            req.setAttribute("user", uDao.findByUid(idReceveur));
            req.setAttribute("listMess", dao.getMessageConv(cid));
            req.setAttribute("listUser", listUser);
            req.setAttribute("cid", cid);
            req.getRequestDispatcher(REPERTORY + "messages.jsp").forward(req, res);
        } catch (NumberFormatException e) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int uid = Integer.parseInt(req.getParameter("uid"));
        int cid = Integer.parseInt(req.getParameter("cid"));
        String corps = req.getParameter("corps");
        LocalDateTime dmess = LocalDateTime.now();
        MessagesDAO dao = new MessagesDAO();
        String referer = req.getHeader("Referer");
        if (referer != null && referer.contains("?")) {
            referer = referer.substring(0, referer.indexOf("?"));
        }
        try {
            dao.insert(new Message(0, cid, uid, corps, dmess));
            res.sendRedirect(referer);
        } catch (Exception e) {
            res.sendRedirect(referer + "?success=0");
        }
    }
}
