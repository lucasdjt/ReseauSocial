<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List, java.util.Map, java.util.HashMap, java.util.Map.Entry, modele.dto.User, modele.dto.Message" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages - Dwidder</title>
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
            <h2 class="text-primary">Messages</h2>
            <ul class="list-group">
                <%
                Map<Integer, User> list = (HashMap<Integer, User>) request.getAttribute("listUser");
                if (list != null) {
                    for(Entry<Integer, User> e : list.entrySet()){
                        User u = e.getValue();
                %>
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="${pageContext.request.contextPath}/<%= u.getPdp() %>" alt="<%= u.getPdp() %>" class="rounded-circle me-2" width="40">
                    <a href="${pageContext.request.contextPath}/messages/<%= e.getKey() %>" class="stretched-link text-decoration-none text-white"><%= u.getPseudo() %></a>
                </li>
                <%}}%>
            </ul>
        </aside>

        <section class="col-md-8 d-flex flex-column">
            <header class="card d-flex align-items-center p-3 border">
                <%
                User user = (User) request.getAttribute("user");
                if (user != null) {
                %>
                <img src="${pageContext.request.contextPath}/<%= user.getPdp() %>" alt="<%= user.getPdp() %>" class="rounded-circle me-3" width="50">
                <div>
                    <h4><a href="${pageContext.request.contextPath}/user/<%= user.getIdPseudo() %>" class="text-decoration-none text-white"><%= user.getPseudo() %></a></h4>
                    <p class="text-muted mb-0"><%= user.getBio() %></p>
                    <small class="text-secondary">Utilisateur créée le <%= user.getDinscAsDate() %></small>
                </div>
                <%}%>
            </header>
            <div class="card flex-grow-1 d-flex flex-column">
                <div class="card-body overflow-auto" id="conversation" style="height: 400px;">
                    <div class="d-flex flex-column">
                        <%
                        List<Message> listMess = (List<Message>) request.getAttribute("listMess");
                        if (listMess != null) {
                            for(Message m : listMess){
                                if(m.getUid() != uidSet){
                        %>
                        <small class="text-muted align-self-start"><%= m.getDmessAsDate() %></small>
                        <p class="bg-secondary p-2 rounded align-self-start"><%= m.getCorps() %></p>
                        <%} else {
                        %>
                        <small class="text-muted align-self-end"><%= m.getDmessAsDate() %></small>
                        <p class="bg-primary text-white p-2 rounded align-self-end"><%= m.getCorps() %></p>
                        <%}}}%>
                    </div>
                </div>
                <div class="card-footer">
                    <form class="d-flex" action="messages" method="post">
                        <input type="text" class="form-control me-2" name="corps" placeholder="Écrire un message...">
                        <input type="hidden" name="uid" value="<%= uidSet %>">
                        <input type="hidden" name="cid" value="<%= request.getAttribute("cid") %>">
                        <button class="btn btn-primary">Envoyer</button>
                    </form>
                    <% 
                    String success = request.getParameter("success");
                    if ("0".equals(success)) {
                    %>
                        <p style="color:red;">Erreur lors de l'envoi du message.</p>
                    <%
                    }
                    %>
                </div>
            </div>
        </section>

    </div>
</main>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="script/main.js"></script>
</body>
</html>