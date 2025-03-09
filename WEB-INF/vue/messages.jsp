<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages - Dwidder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="img/logo.ico">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main class="container mt-5 pt-4">
    <div class="row">

        <aside class="col-md-4">
            <h2 class="text-primary">Messages</h2>
            <ul class="list-group">
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="img/pdp.png" alt="Utilisateur 1" class="rounded-circle me-2" width="40">
                    <a href="#" class="stretched-link text-decoration-none text-white">Utilisateur 1</a>
                </li>
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="img/pdp.png" alt="Utilisateur 2" class="rounded-circle me-2" width="40">
                    <a href="#" class="stretched-link text-decoration-none text-white">Utilisateur 2</a>
                </li>
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="img/pdp.png" alt="Utilisateur 3" class="rounded-circle me-2" width="40">
                    <a href="#" class="stretched-link text-decoration-none text-white">Utilisateur 3</a>
                </li>
            </ul>
        </aside>

        <section class="col-md-8 d-flex flex-column">
            <header class="card d-flex align-items-center p-3 border">
                <img src="img/pdp.png" alt="Photo de profil" class="rounded-circle me-3" width="50">
                <div>
                    <h4><a href="user.html" class="text-decoration-none text-white">Utilisateur 1</a></h4>
                    <p class="text-muted mb-0">Développeur passionné, amateur de café et de musique 🎵</p>
                    <small class="text-secondary">Conversation créée le 1er mars 2025</small>
                </div>
            </header>
            <div class="card flex-grow-1 d-flex flex-column">
                <div class="card-body overflow-auto" id="conversation" style="height: 400px;">
                    <div class="d-flex flex-column">
                        <small class="text-muted align-self-start">09/03/2025 10:00</small>
                        <p class="bg-secondary p-2 rounded align-self-start">Salut, comment ça va ?</p>
                        <small class="text-muted align-self-end">09/03/2025 10:01</small>
                        <p class="bg-primary text-white p-2 rounded align-self-end">Ça va et toi ?</p>
                        <small class="text-muted align-self-start">09/03/2025 10:02</small>
                        <p class="bg-secondary p-2 rounded align-self-start">Tranquille, tu fais quoi ?</p>
                        <small class="text-muted align-self-end">09/03/2025 10:05</small>
                        <p class="bg-primary text-white p-2 rounded align-self-end">Je bosse sur un projet.</p>
                        <small class="text-muted align-self-start">09/03/2025 10:07</small>
                        <p class="bg-secondary p-2 rounded align-self-start">Cool, c'est sur quoi ?</p>
                        <small class="text-muted align-self-end">09/03/2025 10:10</small>
                        <p class="bg-primary text-white p-2 rounded align-self-end">Un réseau social.</p>
                        <small class="text-muted align-self-start">09/03/2025 10:12</small>
                        <p class="bg-secondary p-2 rounded align-self-start">Ah stylé !</p>
                        <small class="text-muted align-self-end">09/03/2025 10:15</small>
                        <p class="bg-primary text-white p-2 rounded align-self-end">Merci 😎</p>
                        <small class="text-muted align-self-start">09/03/2025 10:20</small>
                        <p class="bg-secondary p-2 rounded align-self-start">Faudra que tu me montres !</p>
                        <small class="text-muted align-self-end">09/03/2025 10:25</small>
                        <p class="bg-primary text-white p-2 rounded align-self-end">Avec plaisir !</p>
                    </div>
                </div>
                <div class="card-footer">
                    <form class="d-flex">
                        <input type="text" class="form-control me-2" placeholder="Écrire un message...">
                        <button class="btn btn-primary">Envoyer</button>
                    </form>
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