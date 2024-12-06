<%-- 
    Document   : ordenes_entregables
    Created on : 08-nov-2024, 14:59:41
    Author     : fredi
--%>

<%@page import="models.EntregablesModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordenes entregables (Mesero, Móvil)</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%@include file="../../components/headerAdmin.jsp" %>


        <style>
            .border-right {
                border-right: 1px solid black;
                padding-right: 10px;
                align-content: center;
            }

            .text-start {
                text-align: start;
                align-content: center;
            }

            .padded {
                padding-left: 10px;
                padding-right: 10px;
                align-content: center;
            }

            .finalizado-btn {
                border-radius: 10px;
                background-color: rgba(236, 55, 24, 1);
                color: white;
                font-size: 18px;
                padding: 10px 20px;
                width: 130px;
                height: 50px; 
            }
        </style>
        <script>
            function eliminarOrden(id) {
                console.log(`eliminarOrden?id=` + id);
                if (confirm("¿Estás seguro de que quieres finalizar?")) {
                    fetch(`orden?id=` + id, {
                        method: 'DELETE'
                    }).then(response => {
                        if (response.ok) {
                            alert('Orden eliminada exitosamente');
                            location.reload();
                        } else {
                            alert('Error al finalizar');
                        }
                    }).catch(error => console.error('Error:', error));
                }
            }
        </script>
        <!-- Contenido de la página -->
        <div style="margin-left: 100px; padding: 20px;">
            <%
                ArrayList<EntregablesModel> listaEntregables = (ArrayList<EntregablesModel>) request.getAttribute("ordenes");

                if (listaEntregables != null && !listaEntregables.isEmpty()) {
                    for (EntregablesModel orden : listaEntregables) {
                        orden.toString();
            %>
            <div class="container text-center">
                <div class="row">
                    <div class="col border-right">
                        <h4>No. <%= orden.getId()%></h4>
                    </div>
                    <div class="col text-start">
                        <b><%= orden.getNombre()%></b>
                        <br>
                    </div>
                    <div class="col padded">
                        <h4><%= orden.getCliente()%></h4>
                        <button onclick="eliminarOrden(<%= orden.getId()%>)" class="finalizado-btn">Finalizado</button>
                    </div>
                </div>
            </div>
            <br><br><br>
            <%
                }
            } else {
            %>
            <div class="container text-center">
                <h4 colspan="7">Sin ordenes</h4>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
