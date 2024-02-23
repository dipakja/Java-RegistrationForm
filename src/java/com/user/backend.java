/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


/**
 *
 * @author HP
 */
@MultipartConfig
public class backend extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           try {
               
               
             String name  = request.getParameter("user_name");  
             String password  = request.getParameter("user_password");  
             String email  = request.getParameter("user_email");  
             
            Part part= request.getPart("image");
// 
String filename;
if (part != null) {
     filename = part.getSubmittedFileName();
    // Rest of your code
} else {
    out.println("Error: No file uploaded");
    return; // or handle accordingly
}
//           String filename = part.getSubmittedFileName(); 
//               
//               
               
              
               
               
               
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/reg";
    String usern = "root";
    String pass = "root";

    try (Connection conn = DriverManager.getConnection(url, usern, pass)) {
        String q = "insert into customer(name, password, email,image) values(?, ?, ?,?)";
        try (PreparedStatement pstmt = conn.prepareStatement(q)) {
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            pstmt.setString(4, filename);

            pstmt.executeUpdate();
        }

        // Upload the file
        InputStream is = part.getInputStream();
        byte[] data = new byte[is.available()];
        is.read(data);

//        ServletContext context = request.getServletContext();
//        String uploadDirectory = context.getRealPath("/") + "uploads" + File.separator;
//        File uploadDir = new File(uploadDirectory);

//        if (!uploadDir.exists()) {
//            uploadDir.mkdir();
//        }

//        String filePath = uploadDirectory + filename;
 ServletContext context = request.getServletContext();
String filePath = context.getRealPath("/")+"Images"+File.separator;

        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            fos.write(data);
        }

    
        
        out.println("done");
        
    }
}catch (Exception e) {
    e.printStackTrace();
    out.println("Error during registration: " + e.getMessage());
}

            

          
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
