<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List, modele.dto.PostDetails" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Réponses au post - Dwidder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%int uidSet = 1;%>
<jsp:include page="header.jsp" />

<main class="container mt-5 pt-4">
    <div class="row">
        <aside class="col-md-4">
            <%
            PostDetails p = (PostDetails) request.getAttribute("post");
            if (p != null) {
            %>
            <article class="card mb-3">
            <header class="card-header d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/<%= p.getPdp() %>" alt="<%= p.getPdp() %>" class="rounded-circle me-2" width="40">
                <div>
                <a href="${pageContext.request.contextPath}/user/<%= p.getIdPseudo() %>" class="text-decoration-none text-white"><h6 class="mb-0"><%= p.getPseudo() %></h6></a>
                <small class="text-muted">@<%= p.getIdPseudo() %> - <%= p.getDpubAsDate() %></small>
                </div>
            </header>
            <main class="card-body">
                <p><%= p.getContenu() %></p>
                <% if(p.getMedia() != null) { %>
                <img src="${pageContext.request.contextPath}/<%= p.getMedia() %>" alt="<%= p.getMedia() %>" class="rounded w-100">
                <% } %>
                <% if(p.getDuree() < 700) { %>
                <blockquote class="text-muted small">Il reste <%= p.getDuree() %>h à ce post avant d'être supprimé</blockquote>
                <% } %>
            </main>
            <footer class="card-footer d-flex justify-content-around">
                <a href="${pageContext.request.contextPath}/addLike?pid=<%= p.getPid() %>&uid=<%= p.getUid() %>" class="btn btn-outline-primary btn-sm">👍 <%= p.getNbLikes() %></a>
                <a href="${pageContext.request.contextPath}/posts/<%= p.getPid() %>" class="btn btn-outline-secondary btn-sm">💬 <%= p.getNbComm() %></a>
                <a href="${pageContext.request.contextPath}/addFavori?pid=<%= p.getPid() %>&uid=<%= p.getUid() %>" class="btn btn-outline-warning btn-sm">⭐ Favoris</a>
            </footer>
            </article>
            <%
            }
            %>
        </aside>
        
        <section class="col-md-8">
            <h3>Ajouter un post réponse</h3>
            <% 
            String success = request.getParameter("success");
            if ("1".equals(success)) {
            %>
                <p style="color:green;">Vous avez ajouté un Post.</p>
            <%
            } else if ("0".equals(success)) {
            %>
                <p style="color:red;">Erreur lors de la création du Post.</p>
            <%
            }
            %>
            <form class="mb-3" action="${pageContext.request.contextPath}/posts" method="post" enctype="multipart/form-data">
                <textarea class="form-control bg-dark text-white mb-2" name="contenu" rows="3" maxlength="150" placeholder="Exprimez-vous..." required></textarea>
                <input type="file" class="form-control bg-dark text-white mb-2" name="image" accept="image/*">
                <label for="duration" class="form-label text-white">Durée du post</label>
                <div class="input-group mb-2">
                    <input type="number" class="form-control bg-dark text-white" name="duree" min="1" max="365" placeholder="Durée">
                    <select class="form-select bg-dark text-white" name="dureeUnite">
                        <option value="hours">Heures</option>
                        <option value="days">Jours</option>
                    </select>
                </div>
                <input type="hidden" name="uid" value="<%= uidSet %>">
                <input type="hidden" name="pidParent" value="<%= p.getPid() %>">
                <button type="submit" class="btn btn-primary w-100">Publier</button>
            </form>
            <h3 class="title">Réponses au post</h3>
            <%
            List<PostDetails> list = (ArrayList<PostDetails>) request.getAttribute("responses");
            if (list != null) {
                for(PostDetails rep : list){
            %>
                <article class="card mb-3">
                <header class="card-header d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/<%= rep.getPdp() %>" alt="<%= rep.getPdp() %>" class="rounded-circle me-2" width="40">
                    <div>
                    <a href="${pageContext.request.contextPath}/user/<%= rep.getIdPseudo() %>" class="text-decoration-none text-white"><h6 class="mb-0"><%= rep.getPseudo() %></h6></a>
                    <small class="text-muted">@<%= rep.getIdPseudo() %> - <%= rep.getDpubAsDate() %></small>
                    </div>
                </header>
                <main class="card-body">
                    <p><%= rep.getContenu() %></p>
                    <% if(rep.getMedia() != null) { %>
                    <img src="${pageContext.request.contextPath}/<%= rep.getMedia() %>" alt="<%= rep.getMedia() %>" class="rounded w-100">
                    <% } %>
                    <% if(rep.getDuree() < 700) { %>
                    <blockquote class="text-muted small">Il reste <%= rep.getDuree() %>h à ce post avant d'être supprimé</blockquote>
                    <% } %>
                </main>
                <footer class="card-footer d-flex justify-content-around">
                    <a href="${pageContext.request.contextPath}/addLike?pid=<%= rep.getPid() %>&uid=<%= rep.getUid() %>" class="btn btn-outline-primary btn-sm">👍 <%= rep.getNbLikes() %></a>
                    <a href="${pageContext.request.contextPath}/posts/<%= rep.getPid() %>" class="btn btn-outline-secondary btn-sm">💬 <%= rep.getNbComm() %></a>
                    <a href="${pageContext.request.contextPath}/addFavori?pid=<%= rep.getPid() %>&uid=<%= rep.getUid() %>" class="btn btn-outline-warning btn-sm">⭐ Favoris</a>
                </footer>
                </article>
            <%
                }
            }
            %>
        </section>

    </div>
</main>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>