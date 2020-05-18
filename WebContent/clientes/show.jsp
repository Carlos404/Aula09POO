<%@page import="br.gov.sp.fatecpg.config.Cliente"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Clientes</title>
    </head>
    <body>
        <a href="../index.jsp">Inicio</a>
        <h3>Lista de Clientes</h3>
        <h4><a href="insert.jsp">Inserir Cliente</a></h4>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>RG</th>
                <th>E-Mail</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Ações</th>
            </tr>
            <%for(Cliente cli: Db.getClientes()){%>
            <tr>
                <td><%=cli.getNome()%></td>
                <td><%=cli.getCpf()%></td>
                <td><%=cli.getRg()%></td>
                <td><%=cli.getEmail()%></td>
                <td><%=cli.getTelefone()%></td>
                <td><%=cli.getEndereco()%></td>
                <td>
                    <% int i = Db.getClientes().indexOf(cli);%>
                    <a href="edit.jsp?i=<%=i%>">Editar</a>
                </td>
                <td><a href="delete.jsp?i=<%=i%>">Excluir</a></td>
            </tr>
            <%}%>
        </table>
</html>
