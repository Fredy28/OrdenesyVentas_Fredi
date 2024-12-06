<%-- 
    Document   : VentasDiariasCajero
    Created on : 07-nov-2024, 19:48:27
    Author     : fredi
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="models.VentasModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas Diarias (Cajero)</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%@include file="../../components/headerAdmin.jsp" %>
        <%@include file="../../components/sidebarAdmin.jsp" %>

        <!-- Contenido de la página -->
        <div style="margin-left: 100px; padding: 20px;">
            <h1>Bill</h1>
            <%
                LocalDate fechaActual = LocalDate.now();
                DateTimeFormatter formato = DateTimeFormatter.ofPattern("d 'de' MMMM yyyy", new java.util.Locale("es", "ES"));
                String fechaFormateada = fechaActual.format(formato);
            %>
            <b>Date: </b><p><%= fechaFormateada %></p>
            <b>Número: </b><p>#2002</p>
        </div>

        <script>
            // Función para abrir/cerrar el sidebar
            function toggleSidebar() {
                document.getElementById("mySidebar").classList.toggle("open");
            }
        </script>


        <div style="margin-left: 100px; padding: 20px;">

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">Folio</th>
                        <th scope="col">Nombre del cliente</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<VentasModel> listaVentas = (ArrayList<VentasModel>) request.getAttribute("ventas");

                        if (listaVentas != null && !listaVentas.isEmpty()) {
                            for (VentasModel venta : listaVentas) {
                                venta.toString();
                    %>
                    <tr>
                        <th scope="row"><%= venta.getId()%></th>
                        <td><%= venta.getFolio()%></td> 
                        <td>
                            <a href="ventaExtendida.jsp?id=<%= venta.getId()%>">
                                <%= venta.getCliente()%>
                            </a>
                        </td>

                        <td><%= venta.getFecha()%></td>
                        <td><%= venta.getTotal()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7">No hay ventas</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
