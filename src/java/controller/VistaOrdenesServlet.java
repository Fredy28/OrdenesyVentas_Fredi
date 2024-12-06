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
import models.OrdenesModel;

/**
 *
 * @author fredi
 */
@WebServlet(urlPatterns = {"/vista_ordenes_servlet"})
public class VistaOrdenesServlet extends HttpServlet {

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
            out.println("<title>Servlet VistaOrdenesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VistaOrdenesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<OrdenesModel> listaOrdenes = new ArrayList<>();
        String sql = "SELECT o.id AS id, GROUP_CONCAT(p.nombre SEPARATOR ', ') AS nombre, o.notas AS notas FROM ordenes o JOIN ordenes_detalle od ON o.id = od.orden_id JOIN platillos p ON od.platillo_id = p.id GROUP BY o.id, o.notas;";

        try {
            conn = conexion.getConnectionBD();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrdenesModel orden = new OrdenesModel();
                orden.setId(rs.getInt("id"));
                orden.setNombre(rs.getString("nombre"));
                orden.setNotas(rs.getString("notas"));
                listaOrdenes.add(orden);
            }

            
            request.setAttribute("ordenes", listaOrdenes);
            request.getRequestDispatcher("/pages/admin/vista_ordenes.jsp").forward(request, response);

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
