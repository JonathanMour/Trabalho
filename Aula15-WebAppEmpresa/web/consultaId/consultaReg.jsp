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
        <style>
            body {
                background-color: #f0f0f0;
                height: 100vh;
                font-family: Arial, sans-serif;
            }
            .user-box input:focus ~ label,
            .user-box input:valid ~ label {
                top: -20px;
                left: 10px;
                font-size: 12px;
                color: #03a9f4;
            }
            input[type="submit"] {
                background: #03a9f4;
                border: none;
                padding: 10px 20px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                width: 10%;
            }
            a {
                display: block;
                margin-top: 20px;
                color: #03a9f4;
                text-decoration: none;
            }
            a:hover {
                color: #039be5;
            }
        </style>
        <%
        //Entrada/Receber
        String email = request.getParameter("email");
            
        // Instância e atrib de valor
        Pesquisa pesq = new Pesquisa();
        pesq.setEmail(email);
        
         //Select
        PesquisaDAO pesqDAO = new PesquisaDAO();
        if(pesqDAO.consPesqRegId(pesq) != null){
                out.println("<br> <b>Pesquisa de Satisfação</b> <br>");
                out.println("<br> ID: " + pesq.getId());
                out.println("<br> Data: " + pesq.getDt_pesq());
                out.println("<br> Nome: " + pesq.getNome());
                out.println("<br> E-mail: " + pesq.getEmail());
                out.println("<br> Questão 1: " + pesq.getQ1());
                out.println("<br> Questão 2: " + pesq.getQ2());
                out.println("<br> Questão 3: " + pesq.getQ3());
                out.println("<br> Questão 4: " + pesq.getQ4());                             
                out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagens/escala.jpg' alt=''/>");                             
        }else{
               out.println("Registro não encontrado!!!");
        }

        
        %>
    </body>
</html>
