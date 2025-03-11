<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Users - Dwidder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main class="container mt-4">
        <h2 class="text-primary">Utilisateurs/Abonnements/Abonnés</h2>
        <ul class="list-group">
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur1" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 1</h6></a>
                    <small class="text-muted">@utilisateur1</small>
                    <p class="mb-1">Description de l'utilisateur 1</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur2" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 2</h6></a>
                    <small class="text-muted">@utilisateur2</small>
                    <p class="mb-1">Description de l'utilisateur 2</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">- Supprimer</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur3" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 3</h6></a>
                    <small class="text-muted">@utilisateur3</small>
                    <p class="mb-1">Description de l'utilisateur 3</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur4" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 4</h6></a>
                    <small class="text-muted">@utilisateur4</small>
                    <p class="mb-1">Description de l'utilisateur 4</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur5" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 5</h6></a>
                    <small class="text-muted">@utilisateur5</small>
                    <p class="mb-1">Description de l'utilisateur 5</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur6" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 6</h6></a>
                    <small class="text-muted">@utilisateur6</small>
                    <p class="mb-1">Description de l'utilisateur 6</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur7" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 7</h6></a>
                    <small class="text-muted">@utilisateur7</small>
                    <p class="mb-1">Description de l'utilisateur 7</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
            <li class="border list-group-item d-flex align-items-center">
                <img src="img/pdp.png" alt="Utilisateur5" class="rounded-circle me-2" width="40">
                <div>
                    <a href="user.html" class="text-decoration-none text-white"><h6 class="mb-0">Utilisateur 8</h6></a>
                    <small class="text-muted">@utilisateur8</small>
                    <p class="mb-1">Description de l'utilisateur 8</p>
                </div>
                <button class="btn btn-sm btn-outline-success ms-auto me-2">+ Suivre</button>
                <a href="user.html" class="btn btn-sm btn-outline-primary">Consulter le profil</a>
            </li>
        </ul>
</main>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
