/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.ejb.AdministradorFacadeLocal;
import com.ejb.ClienteFacadeLocal;
import com.ejb.VehiculoFacadeLocal;
import com.ejb.VentaFacadeLocal;
import com.modelo.Administrador;
import com.modelo.Cliente;
import com.modelo.Vehiculo;
import com.modelo.Venta;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 *
 * @author jdavid.sanchez, sebastian.gomez, mario.ramirez
 */
@MultipartConfig
@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"}, loadOnStartup = 1)

public class Servlet extends HttpServlet {

    @EJB
    private VentaFacadeLocal ventaFacade;

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private AdministradorFacadeLocal administradorFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String action = request.getParameter("action");
            String url = "index.jsp";
            if ("listClientes".equals(action)) {
                try {
                    List<Cliente> findClientes = clienteFacade.findAll();
                    request.getSession().setAttribute("clientes", findClientes);
                    url = "listaClientes.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("login".equals(action)) {
                try {
                    String u = request.getParameter("username");
                    String p = request.getParameter("password");
                    boolean checklogin = administradorFacade.checkLogin(u, p);
                    if (checklogin) {
                        request.getSession().setAttribute("login", u);
                        url = "manager.jsp";
                    } else {
                        url = "login.jsp?error=1";
                    }
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("registroA".equals(action)) {
                try {
                    Administrador a = new Administrador();
                    a.setId(request.getParameter("id"));
                    a.setNombre(request.getParameter("nombre"));
                    a.setApellido(request.getParameter("apellidos"));
                    a.setUsername(request.getParameter("username"));
                    a.setPassword(request.getParameter("password"));
                    administradorFacade.create(a);
                    url = "login.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("registroCts".equals(action)) {
                try {
                    Cliente c = new Cliente();
                    c.setId(request.getParameter("id"));
                    c.setNombre(request.getParameter("nombre"));
                    c.setApellido(request.getParameter("apellidos"));
                    c.setEmail(request.getParameter("email"));
                    c.setTelefono(request.getParameter("tel"));
                    clienteFacade.create(c);
                    url = "Servlet?action=list";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("logout".equals(action)) {
                try {
                    request.getSession().removeAttribute("login");
                    url = "login.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("listarVehiculos".equals(action)) {
                try {
                    List<Vehiculo> findVehiculos = vehiculoFacade.findAll();
                    ArrayList<String> images = new ArrayList<String>();
                    for (int i = 0; i < findVehiculos.size(); i++) {
                        InputStream is = new ByteArrayInputStream(findVehiculos.get(i).getImagen());
                        BufferedImage bi = ImageIO.read(is);
                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        ImageIO.write(bi, "jpg", baos);
                        baos.flush();
                        byte[] imageInByteArray = baos.toByteArray();
                        baos.close();
                        String img = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
                        images.add(img);
                    }
                    request.getSession().setAttribute("vehiculos", findVehiculos);
                    request.getSession().setAttribute("imagenes", images);
                    url = "listaVehiculos.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("nuevoVehiculo".equals(action)) {
                try {
                    Vehiculo v = new Vehiculo();
                    v.setMatricula(request.getParameter("matricula"));
                    v.setMarca(request.getParameter("marca"));
                    v.setModelo(request.getParameter("modelo"));
                    v.setTipo(request.getParameter("tipo"));
                    v.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    BufferedImage bufferedImage = ImageIO.read(request.getPart("imagen").getInputStream());
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(bufferedImage, "jpg", baos);
                    baos.flush();
                    byte[] image = baos.toByteArray();
                    baos.close();
                    v.setImagen(image);
                    vehiculoFacade.create(v);
                    url = "index.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("eliminarVehiculo".equals(action)) {
                try {
                    String matricula = request.getParameter("matriculaDelete");
                    Vehiculo v = vehiculoFacade.find(matricula);
                    vehiculoFacade.remove(v);
                    url = "vehiculos.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("eliminarCliente".equals(action)) {
                try {
                    String id = request.getParameter("idDelete");
                    Cliente c = clienteFacade.find(id);
                    clienteFacade.remove(c);
                    url = "clientes.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("insertarVenta".equals(action)) {
                try {
                    Venta ve = new Venta();
                    Cliente c = clienteFacade.find(request.getParameter("id"));
                    Vehiculo v = vehiculoFacade.find(request.getParameter("matricula"));
                    Administrador a = administradorFacade.find(request.getParameter("idAdmi"));
                    ve.setComprador(c);
                    Date d = new Date();
                    ve.setFecha(d);
                    ve.setIdVenta(Integer.parseInt(request.getParameter("idVenta")));
                    ve.setMatricula(v);
                    ve.setVendedor(a);
                    ve.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    ventaFacade.create(ve);
                    vehiculoFacade.remove(v);
                    url = "index.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("buscarCliente".equals(action)) {
                try {
                    String id = request.getParameter("idSearch");
                    Cliente c = clienteFacade.find(id);
                    request.getSession().setAttribute("cliente", c);
                    url = "clientes.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            } else if ("buscarVehiculo".equals(action)) {
                try {
                    String matricula = request.getParameter("matriculaSearch");
                    Vehiculo v = vehiculoFacade.find(matricula);
                    request.getSession().setAttribute("vehiculo", v);
                    url = "vehiculos.jsp";
                } catch (Exception e) {
                    url = "index.jsp?error=" + e;
                }
            }
            response.sendRedirect(url);
        } catch (Exception e) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
