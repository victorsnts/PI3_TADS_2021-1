package com.pi.systeminstruverso.servlet.fornecedor;

import com.pi.systeminstruverso.servlet.cliente.ClienteServlet;
import com.pi.systeminstruverso.dao.FornecedorDAO;
import com.pi.systeminstruverso.entidade.Fornecedor;
import com.pi.systeminstruverso.entidade.Usuario;
import com.pi.systeminstruverso.utils.Data;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author victor
 */
public class FornecedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Usuario usuario_logado = (Usuario) session.getAttribute("usuario_logado");
            
            if (usuario_logado.getPerfil().equals("BACKOFFICE")){
                List<Fornecedor> listaFornecedores = FornecedorDAO.getFornecedores(usuario_logado.getFilial());
            
                request.setAttribute("listaFornecedores", listaFornecedores);
                request.getRequestDispatcher("/protegido/backoffice/fornecedores/listar.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/retornos/erro_auth.jsp");

            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
