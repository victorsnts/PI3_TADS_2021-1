/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pi.systeminstruverso.dao;

import com.pi.systeminstruverso.conexao.Conexao;
import com.pi.systeminstruverso.entidade.Produto;
import com.pi.systeminstruverso.entidade.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author victor
 */

public class ProdutoDAO {
    public static List<Produto> getProdutos() throws SQLException{
        String query = "SELECT * FROM produto";
        
        List<Produto> produtos = new ArrayList();
        
        try {
            Connection con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int cod = rs.getInt("cod");
                String nome = rs.getString("nome");
                String marca = rs.getString("marca");
                double custo = rs.getDouble("custo");
                double preco = rs.getDouble("preco");
                int quantidade = rs.getInt("quantidade");
                double comissao = rs.getDouble("comissao");

                Produto produto =  new Produto(cod, nome, marca, custo, preco, quantidade, comissao);
                produtos.add(produto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;
    }
}
