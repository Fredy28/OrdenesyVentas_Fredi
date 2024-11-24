<%-- 
    Document   : ventas
    Created on : 7/11/2024, 05:46:15 PM
    Author     : CruzF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body>
        <%@include file="../../components/sidebarAdmin.jsp" %>

        <!-- Contenido de la página -->
        <div style="margin-left: 100px; padding: 20px;">
            <h1>Hello World!</h1>
            <p>Esta es la página de ventas.</p>
        </div>

        <script>
            // Función para abrir/cerrar el sidebar
            function toggleSidebar() {
                document.getElementById("mySidebar").classList.toggle("open");
            }
        </script>
    </body>
</html>
