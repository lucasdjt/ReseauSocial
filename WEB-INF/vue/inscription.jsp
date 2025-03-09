<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - Dwidder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="img/logo.ico">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="text-center py-3">
    <img src="img/TexteLogo.png" alt="Dwidder" class="mx-auto d-block" width="140">
</header>

<main class="container d-flex justify-content-center align-items-center py-5">
    <div class="card bg-dark text-white p-4" style="max-width: 500px; width: 100%; overflow-y: auto;">
        <h2 class="text-center text-white">Inscription</h2>
        <form>
            <div class="mb-3">
                <label for="idPseudo" class="form-label">Identifiant (3-15 caractères) *</label>
                <input type="text" class="form-control bg-dark text-white" id="idPseudo" minlength="3" maxlength="15" required>
            </div>
            <div class="mb-3">
                <label for="pseudo" class="form-label">Pseudo *</label>
                <input type="text" class="form-control bg-dark text-white" id="pseudo" maxlength="20" required>
            </div>
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" class="form-control bg-dark text-white" id="prenom" maxlength="20">
            </div>
            <div class="mb-3">
                <label for="nomUser" class="form-label">Nom</label>
                <input type="text" class="form-control bg-dark text-white" id="nomUser" maxlength="50">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email *</label>
                <input type="email" class="form-control bg-dark text-white" id="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mot de passe *</label>
                <div class="input-group">
                    <input type="password" class="form-control bg-dark text-white" id="password" required>
                    <button class="btn btn-outline-light" type="button" id="togglePassword">👁️</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirmer le mot de passe *</label>
                <div class="input-group">
                    <input type="password" class="form-control bg-dark text-white" id="confirmPassword" required>
                    <button class="btn btn-outline-light" type="button" id="toggleConfirmedPassword">👁️</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="bio" class="form-label">Bio (200 caractères max)</label>
                <textarea class="form-control bg-dark text-white" id="bio" maxlength="200"></textarea>
            </div>
            <div class="mb-3">
                <label for="pdp" class="form-label">Photo de profil</label>
                <input type="file" class="form-control bg-dark text-white" id="pdp">
            </div>
            <div class="mb-3">
                <label for="dnaiss" class="form-label">Date de naissance</label>
                <input type="date" class="form-control bg-dark text-white" id="dnaiss">
            </div>
            <div class="mb-3">
                <label for="loca" class="form-label">Localisation</label>
                <input type="text" class="form-control bg-dark text-white" id="loca" maxlength="200">
            </div>
            <div class="mb-3">
                <label class="form-label">Sexe *</label>
                <select class="form-select bg-dark text-white" id="sexe" required>
                    <option value="M">Homme</option>
                    <option value="F">Femme</option>
                    <option value="O">Autre</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="tel" class="form-label">Téléphone</label>
                <input type="tel" class="form-control bg-dark text-white" id="tel" maxlength="30">
            </div>
            <div class="mb-3">
                <label class="form-label">Langue *</label>
                <select class="form-select bg-dark text-white" id="langue" required>
                    <option value="FR">Français</option>
                    <option value="EN">Anglais</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">S'inscrire</button>
        </form>
        <div class="text-center mt-3">
            <a href="connexion.html" class="text-decoration-none text-light">Déjà un compte ? Connectez-vous</a>
        </div>
    </div>
</main>

<script src="script/main.js"></script>

</body>
</html>