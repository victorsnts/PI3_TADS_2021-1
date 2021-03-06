package com.pi.systeminstruverso.servlet.fornecedor;

import com.pi.systeminstruverso.servlet.cliente.ClienteServlet;
import com.pi.systeminstruverso.dao.FornecedorDAO;
import com.pi.systeminstruverso.entidade.Fornecedor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author victor
 */
public class BuscarFornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String busca = request.getParameter("busca");
            
            System.out.println(busca);
            
            List<Fornecedor> listaFornecedores = FornecedorDAO.searchFornecedor(busca);
            
            request.setAttribute("listaFornecedores", listaFornecedores);
            request.getRequestDispatcher("protegido/backoffice/fornecedores/listar.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
