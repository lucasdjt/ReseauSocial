package controleur;

import java.io.IOException;

import modele.dao.PostsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delPost/*")
public class DeletePostServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("uid") == null || session.getAttribute("pseudo") == null) {
            res.sendRedirect(req.getContextPath() + "/connexion");
            return;
        }
        res.setContentType("text/html; charset=UTF-8");
        res.setCharacterEncoding("UTF-8");
        String pathInfo = req.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid");
            return;
        }
        String[] pathParts = pathInfo.split("/");
        if (pathParts.length < 2) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid PID format");
            return;
        }
        try {
            String pidStr = pathParts[1];
            int pid = Integer.parseInt(pidStr);
            PostsDAO pDAO = new PostsDAO();
            pDAO.delete(pid);
            res.sendRedirect(req.getContextPath() + "/accueil");
        } catch (NumberFormatException e) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid");
        }
    }
}