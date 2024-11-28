<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Pesquisa</title>
    </head>
    <body>
        <h2>Pesquisa de Satisfação - Registros</h2>
        <form name="frmPesq" method="post" action="comsjsp">
            Nome: <input type="text" name="nome"> <p>
            E-mail: <input type="email" name="email"> <p>
            <br>
                  <img src="../imagem/imagem.png" alt=""/>        <br><br>
                      
        </form>
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
            // Criando instância de PesquisaDAO
           PesquisaDAO pesqDAO = new PesquisaDAO();
            
            // Obtendo a lista de registros
            List<Pesquisa> lista = pesqDAO.consPesqLista();
            int n_reg = 0;

            // Exibindo registros
            if (lista != null && !lista.isEmpty()) {
                for (int i = 0; i < lista.size(); i++) {            
                    out.println("<br><br> #: " + (i + 1));   
                    out.println("<br> ID: " + lista.get(i).getId());
                    out.println("<br> Data: " + lista.get(i).getDt_pesq());
                    out.println("<br> <b>Nome:</b> " + lista.get(i).getNome());
                    out.println("<br> E-mail: " + lista.get(i).getEmail());
                    out.println("<br> Questão 1: " + lista.get(i).getQ1());
                    out.println("<br> Questão 2: " + lista.get(i).getQ2());
                    out.println("<br> Questão 3: " + lista.get(i).getQ3());
                    out.println("<br> Questão 4: " + lista.get(i).getQ4());
                    n_reg++;
                }
                out.println("<br><br> <b>Total de Registros:</b> " + n_reg);
            } else {
                out.println("<br><br><b>Nenhum registro encontrado.</b>");
            }
        %>

        <br><br>
       
        <br>
        
    </body>
</html>
