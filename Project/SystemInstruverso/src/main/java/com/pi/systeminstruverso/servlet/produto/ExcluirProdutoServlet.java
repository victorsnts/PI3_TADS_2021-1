/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pi.systeminstruverso.servlet.produto;

import com.pi.systeminstruverso.dao.ProdutoDAO;
import com.pi.systeminstruverso.entidade.Usuario;
import com.pi.systeminstruverso.utils.Convert;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author victor
 */
public class ExcluirProdutoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Usuario usuario_logado = (Usuario) session.getAttribute("usuario_logado");
        
        if (usuario_logado.getPerfil().equals("BACKOFFICE")) {
            // Recuperar os parametros
            int cod = Convert.ToInt(request.getParameter("cod"));

            // deleatr o cliente no BD
            boolean ok = ProdutoDAO.deletar(cod);

            // Redirecionar para sucesso/erro
            if (ok) {
                response.sendRedirect("retornos/sucesso.jsp");
            }
            else {
                String msgErro = "Não foi possivel realizar o exclusao desse produto.";
                request.setAttribute("msgErro", msgErro);
                request.getRequestDispatcher("retornos/erro.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/retornos/erro_auth.jsp");
        }
        
    }

}
