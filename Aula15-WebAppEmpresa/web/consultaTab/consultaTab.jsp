<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
            PesquisaDAO pesqDAO = new PesquisaDAO();
            List<Pesquisa> lista = pesqDAO.consPesqLista(); // Obtem a lista
            
            int n_reg = 0;
            
           
            out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
            out.println("<br><br><b> # | Data | Nome | E-mail </b> <br>");
            
            if (lista != null && !lista.isEmpty()) { // Verifica se a lista não é nula e não está vazia
                for (int i = 0; i < lista.size(); i++) {            
                    out.println(i + " - " + lista.get(i).getDt_pesq() + " - " + lista.get(i).getNome() + " - " + lista.get(i).getEmail() + "<br>");
                    n_reg++;
                }
            } else {
                out.println("<br><br> Nenhum registro encontrado.");
            }
            
            out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b>Legenda:</b> <br> <img src='../imagem/imagem.png' alt=''/>");
        %>
    </body>
</html>
