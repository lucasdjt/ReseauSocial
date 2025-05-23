<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List, modele.dto.User, java.util.Map"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Réactions - Dwidder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<% 
Integer User_ID = (Integer) session.getAttribute("me_uid");
List<Integer> listFollowUser = (List<Integer>) session.getAttribute("me_listFollow");
List<Integer> listFollowersUser = (List<Integer>) session.getAttribute("me_listFollowers");
Map<User, String> reactions = (Map<User, String>) session.getAttribute("listeDesReactions");
Integer pid = (Integer) session.getAttribute("pidReaction");
%>

<jsp:include page="include_header.jsp" />

<main class="container mt-4">
        <h2 class="text-primary">Liste de compte</h2>
        <jsp:include page="include_popUp.jsp" />
        <ul class="list-group">
            <%
                if (reactions != null) {
                    for (Map.Entry<User, String> e : reactions.entrySet()) {
                        User u = e.getKey();
            %>
            <li class="border list-group-item d-flex align-items-center" id="user_<%= u.getIdPseudo()%>">
                <img src="${pageContext.request.contextPath}/<%= u.getPdp() %>" alt="<%= u.getPdp() %>" class="rounded-circle me-2" width="40">
                <div>
                    <a href="${pageContext.request.contextPath}/user/<%= u.getIdPseudo() %>" class="text-decoration-none text-white"><h6 class="mb-0"><%= u.getPseudo() %></h6></a>
                    <small class="text-muted">@<%= u.getIdPseudo() %>
                    <% if (listFollowersUser.contains(u.getUid())) { %>
                            <span class="text-success"> - Cette personne vous suit</span>
                    <% } %>
                    </small>
                    <p class="mb-1"><%= u.getBio() %></p>
                </div>
                <div class="ms-auto">
                        <a href="${pageContext.request.contextPath}/reaction/delete?pid=<%= pid %>&uid=<%= u.getUid() %>" class="btn btn-outline-danger btn-sm">
                            <%= e.getValue() %>
                        </a>
                        <% if(u.getUid() != User_ID){ %>
                        <% if (!listFollowUser.contains(u.getUid())) { %>
                            <a href="${pageContext.request.contextPath}/follow/addFollow/<%= u.getUid() %>" class="btn btn-sm btn-outline-success">+ Suivre</a>
                        <% } else { %>
                            <a href="${pageContext.request.contextPath}/follow/addFollow/<%= u.getUid() %>" class="btn btn-sm btn-outline-danger">Ne plus suivre</a>
                        <% } %>
                        <% } %>
                </div>
            </li>
            <% }} %>
        </ul>
</main>

<jsp:include page="include_footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
session.removeAttribute("pidReaction");
%>
<input type="hidden" name="author" value="Lucas DE JESUS TEIXEIRA">
<input type="hidden" name="github" value="https://github.com/lucasdjt">