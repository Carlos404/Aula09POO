<%@page import="br.gov.sp.fatecpg.config.Fornecedor"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Fornecedores</title>
    </head>
    <body>
        <a href="../index.jsp">Inicio</a>
        <h3>Lista de Fornecedores</h3>
        <h4><a href="insert.jsp">Inserir Fornecedor</a></h4>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Razão Social</th>
                <th>CNPJ</th>
                <th>E-Mail</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Ações</th>
            </tr>
            <%for(Fornecedor forn: Db.getFornecedores()){%>
            <tr>
                <td><%=cli.getNome()%></td>
                <td><%=cli.getRazaosocial()%></td>
                <td><%=cli.getCnpj()%></td>
                <td><%=cli.getEmail()%></td>
                <td><%=cli.getTelefone()%></td>
                <td><%=cli.getEndereco()%></td>
                <td>
                    <% int i = Db.getFornecedores().indexOf(forn);%>
                    <a href="edit.jsp?i=<%=i%>">Editar</a>
                </td>
                <td><a href="delete.jsp?i=<%=i%>">Excluir</a></td>
            </tr>
            <%}%>
        </table>
</html>
