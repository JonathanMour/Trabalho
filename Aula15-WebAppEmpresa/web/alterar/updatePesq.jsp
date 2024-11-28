<%-- 
    Document   : pesquisa
    Created on : 30 de out. de 2024, 19:42:37
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar (Consulta)</title>
    </head>
    <body>
        
        <h1>Pesquisa - Alteração</h1>
        
        <%
            
            //Entrada
            int id = Integer.parseInt( request.getParameter("id") );
            String nome = request.getParameter("nome");            
            String email = request.getParameter("email");
            int r1 = Integer.parseInt( request.getParameter("r1") );
            int r2 = Integer.parseInt( request.getParameter("r2") );
            int r3 = Integer.parseInt( request.getParameter("r3") );
            int r4 = Integer.parseInt( request.getParameter("r4") ); 
            String dt_pesq = request.getParameter("dt_pesq");

            // Instância do objeto e atrib. de dados
            Pesquisa pesq = new Pesquisa();
            pesq.setId(id);
            pesq.setNome(nome);
            pesq.setEmail(email);
            pesq.setQ1(r1);
            pesq.setQ2(r2);
            pesq.setQ3(r3);
            pesq.setQ4(r4);         
            pesq.setDt_pesq(dt_pesq); 
            
            PesquisaDAO pesqDAO = new PesquisaDAO();
            
            if (pesqDAO.altPesq(pesq)){    
                //Acesso Permitido
                out.println("Pesquisa Alterada com sucesso!!!");
            }else{
                //Acesso Negado
                out.println("Pesquisa Não Alterada!!!");
            }          
        %>
        
        
    </body>
</html>
