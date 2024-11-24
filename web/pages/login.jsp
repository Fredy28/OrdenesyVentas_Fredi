<%-- 
    Document   : login
    Created on : 7/11/2024, 01:29:46 PM
    Author     : CruzF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .login-container {
                display: flex;
                justify-content: center;
                height: 87dvh;
                background-color: #fff;
            }
            .login-form {
                background-color: white;
                padding: 2rem;
                width: 100%;
                max-width: 500px;
            }
            .login-form h2 {
                color: #EC3718;
                text-align: center;
                margin-bottom: 1.5rem;
            }
            .form-control {
                border: 1px solid #EC3718;
                border-radius: 5px;
                width: 100%;
            }
            .form-control:focus {
                border-color: #E58A56;
                box-shadow: 0 0 0 0.2rem rgba(229, 138, 86, 0.25);
                width: 100%;
            }
            .btn-orange {
                background-color: #E58A56;
                color: white;
                border: none;
                padding: 0.75rem;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s ease;
                width: 40%;
            }
            .btn-orange:hover {
                background-color: #d97a4b;
            }
            .button-container {
                display: flex;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <div class="login-container">
            <form>
                <div style="text-align: center">
                    <img src="../assets/FoodFlow Logo.png" style="width: 350px; height: 200px; margin-bottom: 15px" class="logo" alt="LOGO">
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="username" placeholder="Ingresa tu usuario">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="password" placeholder="Ingresa tu contraseña">
                </div>
                <div class="button-container">
                    <button onclick="redirigir(event)" class="btn btn-orange" style="background-color: #EC3718; color: white;">Iniciar Sesión</button>
                </div>

            </form>
        </div>
    </body>

    <script>
        function redirigir(event) {
            event.preventDefault();
            window.location.href = "./admin/ventas.jsp";
        }
    </script>

</html>
