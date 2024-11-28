<%-- 
    Document   : consultaReg
    Created on : 30 de out. de 2024, 21:25:47
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        //Entrada/Receber
        String nome = request.getParameter("nome");
            
        // Instância e atrib de valor
        Pesquisa pesq = new Pesquisa();
        pesq.setNome(nome); 
        
         //Select
        PesquisaDAO pesqDAO = new PesquisaDAO();
        if(pesqDAO.consPesqReg(pesq) != null){
                out.println("<br> <b> Pesquisa de Satisfação</b> <br>");
                out.println("<br> ID: " + pesq.getId());
                out.println("<br> Data: " + pesq.getDt_pesq());
                out.println("<br> Nome: " + pesq.getNome());
                out.println("<br> E-mail: " + pesq.getEmail());
                out.println("<br> Questão 1: " + pesq.getQ1());
                out.println("<br> Questão 2: " + pesq.getQ2());
                out.println("<br> Questão 3: " + pesq.getQ3());
                out.println("<br> Questão 4: " + pesq.getQ4());                             
               out.println("<br><br> <b>Legenda:</b> <br> <img src='../imagem/imagem.png' alt=''/>");                             
        }else{
               out.println("Registro não encontrado!!!");
        }
        
        
        %>
    </body>
</html>
