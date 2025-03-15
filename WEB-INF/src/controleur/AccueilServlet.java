package controleur;

import java.io.IOException;

import modele.dao.PostsDAO;
import modele.dao.UsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/accueil")
public class AccueilServlet extends HttpServlet {
    private static final String REPERTORY = "/WEB-INF/vue/";

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("uid") == null || session.getAttribute("pseudo") == null) {
            res.sendRedirect(req.getContextPath() + "/connexion");
            return;
        }
        res.setContentType("text/html; charset=UTF-8");
        res.setCharacterEncoding("UTF-8");
        PostsDAO postsDAO = new PostsDAO();
        UsersDAO usersDAO = new UsersDAO();
        req.setAttribute("posts", postsDAO.selectAllPublic(true));
        req.setAttribute("users", usersDAO.selectAll());
        req.getRequestDispatcher(REPERTORY + "accueil.jsp").forward(req, res);
    }
}
