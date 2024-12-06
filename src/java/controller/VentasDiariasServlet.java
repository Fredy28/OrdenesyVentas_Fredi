package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import configuration.ConnectionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.VentasModel;

/**
 *
 * @author fredi
 */
@WebServlet(urlPatterns = {"/ventas_diarias_servlet"})
public class VentasDiariasServlet extends HttpServlet {

    ConnectionBD conexion = new ConnectionBD();
    Connection conn = null;
    Statement statement = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VentasDiariasServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VentasDiariasServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<VentasModel> listaVentas = new ArrayList<>();
        String sql = "SELECT id, folio, cliente, fecha, (SELECT SUM(precio_unitario) FROM ordenes_detalle WHERE orden_id = ordenes.id) AS total FROM ordenes;";

        try {
            conn = conexion.getConnectionBD();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                VentasModel venta = new VentasModel();
                venta.setId(rs.getInt("id"));
                venta.setFolio(rs.getString("folio"));
                venta.setCliente(rs.getString("cliente"));
                venta.setFecha(rs.getTimestamp("fecha"));
                venta.setTotal(rs.getDouble("total"));
                listaVentas.add(venta);
            }

            request.setAttribute("ventas", listaVentas);
            request.getRequestDispatcher("/pages/admin/ventas_diarias_cajero.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener las órdenes");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
