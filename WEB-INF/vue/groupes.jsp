<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupes - Dwidder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="img/logo.ico">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main class="container mt-5 pt-4">
    <div class="row">
        <aside class="col-md-4">
            <h2 class="text-primary">Groupes</h2>
            <a href="creerGroupe.html" class="btn btn-outline-success mt-2 w-100">Créer un Groupe</a>
            <ul class="list-group">
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="img/pdp.png" alt="Groupe 1" class="rounded-circle me-2" width="40">
                    <a href="#" class="stretched-link text-decoration-none text-white">HardMusic Lovers</a>
                </li>
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="img/pdp.png" alt="Groupe 2" class="rounded-circle me-2" width="40">
                    <a href="#" class="stretched-link text-decoration-none text-white">Java Devs</a>
                </li>
                <li class="border list-group-item d-flex align-items-center btn-outline-success">
                    <img src="img/pdp.png" alt="Groupe 3" class="rounded-circle me-2" width="40">
                    <a href="#" class="stretched-link text-decoration-none text-white">Chess Addicts</a>
                </li>
            </ul>
        </aside>
        
        <section class="col-md-8">
            <div class="card text-center">
                <img src="img/pdp.png" alt="Photo de profil de l'utilisateur" class="card-img-top rounded-circle mx-auto mt-3" style="width: 100px; height: 100px;">
                
                <div class="card-body">
                    <h3 class="card-title">HardMusic Lovers</h3>
                    <p class="text-muted">Crée le 10/05/2005</p>
                    <div class="card p-2 border">
                        <p class="mb-0">Bio de l'utilisateur : Développeur passionné, amateur de café et de musique 🎵</p>
                    </div>
                </div>
            </div>

            <h3>Ajouter un Post au groupe</h3>
            <% 
            String sucess = request.getParameter("sucess");
            if ("1".equals(sucess)) {
            %>
                <p style="color:green;">Vous avez ajouté un Post.</p>
            <%
            } else if ("0".equals(sucess)) {
            %>
                <p style="color:red;">Erreur lors de la création du Post.</p>
            <%
            }
            %>
            <form class="mb-3" action="posts" method="post" enctype="multipart/form-data">
                <textarea class="form-control bg-dark text-white mb-2" name="contenu" rows="3" maxlength="150" placeholder="Exprimez-vous..."></textarea>
                <input type="file" class="form-control bg-dark text-white mb-2" name="image" accept="image/*">
                <label for="duration" class="form-label text-white">Durée du post</label>
                <div class="input-group mb-2">
                    <input type="number" class="form-control bg-dark text-white" name="duree" min="1" max="365" placeholder="Durée">
                    <select class="form-select bg-dark text-white" name="dureeUnite">
                        <option value="hours">Heures</option>
                        <option value="days">Jours</option>
                    </select>
                </div>
                <input type="hidden" name="uid" value="1">
                <input type="hidden" name="gid" value="1">
                <button type="submit" class="btn btn-primary w-100">Publier</button>
            </form>
            <article class="card mb-3">
                <header class="card-header d-flex align-items-center">
                    <img src="img/pdp.png" alt="Pdp" class="rounded-circle me-2" width="40">
                    <div>
                        <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">DJ</h6></a>
                        <small class="text-muted">@dj - 2h</small>
                    </div>
                </header>
                <main class="card-body">
                    <p>Nouveau set dispo sur SoundCloud ! 🔥</p>
                    <img src="img/pdp.png" alt="Image" class="rounded w-100">
                    <blockquote class="text-muted small">Il y a 2 heures</blockquote>
                </main>
                <footer class="card-footer d-flex justify-content-around">
                    <a href="listeLike.html" class="btn btn-outline-primary btn-sm">👍 132</a>
                    <a href="listeReponse.html" class="btn btn-outline-secondary btn-sm">💬 24</a>
                    <button class="btn btn-outline-warning btn-sm">⭐ Favoris</button>
                </footer>
            </article>

            <article class="card mb-3">
                <header class="card-header d-flex align-items-center">
                    <img src="img/pdp.png" alt="Pdp" class="rounded-circle me-2" width="40">
                    <div>
                        <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">QH</h6></a>
                        <small class="text-muted">@queenh - 5h</small>
                    </div>
                </header>
                <main class="card-body">
                    <p>Vos recommandations d'albums ? 👀</p>
                    <blockquote class="text-muted small">Il y a 5 heures</blockquote>
                </main>
                <footer class="card-footer d-flex justify-content-around">
                    <a href="listeLike.html" class="btn btn-outline-primary btn-sm">👍 89</a>
                    <a href="listeReponse.html" class="btn btn-outline-secondary btn-sm">💬 17</a>
                    <button class="btn btn-outline-warning btn-sm">⭐ Favoris</button>
                </footer>
            </article>
        </section>

    </div>
</main>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>