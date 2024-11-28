<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%        
            PesquisaDAO pesqDAO = new PesquisaDAO();
            List<Pesquisa> lista = pesqDAO.consPesqLista(); // Obtem a lista
            
            int n_reg = 0;
            
            
            out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
        %>   
        <table border="1">
            <tr>
                <th>#</th>
                <th>Id.</th>
                <th>Data</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Resp. 1</th>
                <th>Resp. 2</th>
                <th>Resp. 3</th>
                <th>Resp. 4</th>
            </tr>
            <%
            if (lista != null && !lista.isEmpty()) { // Verifica se a lista não é nula e não está vazia
                for (int i = 0; i < lista.size(); i++) {  
            %>                                                         
            <tr>
                <td><%= i + 1 %></td>
                <td><%= lista.get(i).getId() %></td>
                <td><%= lista.get(i).getDt_pesq() %></td>
                <td><%= lista.get(i).getNome() %></td>
                <td><%= lista.get(i).getEmail() %></td>
                <td><%= lista.get(i).getQ1() %></td>
                <td><%= lista.get(i).getQ2() %></td>
                <td><%= lista.get(i).getQ3() %></td>
                <td><%= lista.get(i).getQ4() %></td>
            </tr>
            <%
                    n_reg++;
                }
            } else {
            %>
            <tr>
                <td colspan="9">Nenhum registro encontrado.</td>
            </tr>
            <%
            }
            %>
        </table>
        <%
            out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
             out.println("<br><br> <b>Legenda:</b> <br> <img src='../imagem/imagem.png' alt=''/>");
        %>
    </body>
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
   
</html>
