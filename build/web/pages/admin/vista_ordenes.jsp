<%-- 
    Document   : vista_ordenes
    Created on : 08-nov-2024, 10:40:29
    Author     : fredi
--%>

<%@page import="models.OrdenesModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vista Ordenes (cocina)</title>
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

        </style>

        <!-- Contenido de la página -->
        <div style="margin-left: 100px; padding: 20px;">
            <%
                    ArrayList<OrdenesModel> listaOrdenes = (ArrayList<OrdenesModel>) request.getAttribute("ordenes");

                    if (listaOrdenes != null && !listaOrdenes.isEmpty()) {
                        for (OrdenesModel orden : listaOrdenes) {
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
                        <h4>Notas:</h4>
                        <p><%= orden.getNotas()%></p>
                    </div>
                </div>
            </div>
            <br><br>
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
