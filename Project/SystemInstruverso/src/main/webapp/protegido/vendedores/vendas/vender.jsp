<%-- 
    Document   : vender
    Created on : May 10, 2021, 11:46:36 PM
    Author     : victor
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Vender</title>
    </head>
    <body class="container">
        <c:import url="/header.jsp"/>
        <h1>Vender</h1>
        
        <label class="form-label">Numero da Venda :</label>
        <input type="text" name="num_venda" size="6" required="true" readonly="true" value=${num_venda}>
        <label class="form-label">Cliente :</label>
        <input type="text" name="nome_cliente" size="25" required="true" readonly="true" value="${nome_cliente}">
        
        <br>
        <table class="table table-bordered table-striped mb-0">
            <thead>
                <th scope="col">Cod</th>
                <th scope="col">Nome</th>
                <th scope="col">Marca</th>
                <th scope="col">Preco</th>
                <th scope="col">Estoque</th>
                <th scope="col"></th>
            </thead>
            <tbody>
                <c:forEach items="${listaProdutos}" var="produto" >
                <tr>
                    <td>${produto.cod}</td>
                    <td>${produto.nome}</td>
                    <td>${produto.marca}</td>
                    <td>R$${produto.preco}</td>
                    <td>${produto.quantidade}</td>
                    <td><a href="VendaServlet?cod=${produto.cod}&venda=${num_venda}&cliente=${cod_cliente}&status=aberta">Adicionar</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${not empty msg}">
            <h4 id="msg" style="color: red">${msg}</h4>
        </c:if>
        
        <h1>Carrinho</h1>
        
        <table class="table table-bordered table-striped mb-0">
            <thead>
                <th scope="col">Nome</th>
                <th scope="col">Preco</th>
                <th scope="col">Qtd</th>
                <th scope="col">Total Item</th>
            </thead>
            <tbody>
                <c:forEach items="${listaItem}" var="item">
                    <tr>
                        <td>${item.produto}</td>
                        <td>${item.preco_unitario}</td>
                        <td>${item.quantidade}</td>
                        <td>${item.total}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br>
        <label class="form-label">Total da Venda </label>
        <input type="text" name="total_venda" size="6" required="true" readonly="true" value=${total_venda}>

        <div class="container"> 
            <form action="FinalizarVendaServlet" method="GET">
                <label for="forma_pagamento">  Forma Pagamento: </label>
                <select name="forma_pagamento" required="true">
                    <option value="dinheiro">Dinheiro</option>
                    <option value="debito">Debito</option>
                    <option value="credito">Credito</option>
                    <option value="pix">PIX</option>
                </select>
                <label for="filial">  Filial: </label>
                <input type="text" name="filial" size="3" required="true" readonly="true" value=${usuario_logado.filial}>
                <button type="submit" name="venda" value="${num_venda}">Finalizar</button>
            </form>
        </div>
        <c:import url="/footer.jsp"/>
    </body>
</html>
