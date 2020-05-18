<%@page import="br.gov.sp.fatecpg.config.Fornecedor"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Fornecedor fornecedor = null;
    int i = -1;
    if(request.getParameter("i") != null){
        i = Integer.parseInt(request.getParameter("i"));
        fornecedor = Db.getFornecedor().get(i);
        if(fornecedor == null){
            error = "Índice inválido!";
        }else{
            if(request.getParameter("delete")!=null){      
                Db.getFornecedor().remove(i);
                response.sendRedirect("show.jsp");
            }
        }
    }else{
        error = "Índice inválido!";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover Fornecedor</title>
    </head>
    <body>
        <h1>Fornecedor</h1>
        <h3><a href="../index.jsp">Início</a></h3>
        <h3><a href="../fornecedores/show.jsp">Fornecedores</a></h3>
        <h3>Excluir</h3>
        <%if(error!=null){%>
        <div style="color:red"><%=error%></div>
        <%}else{%>
        <br/>
        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome:<br/>
            <b><%=fornecedor.getNome()%></b><br/>
            
            CPF:<br/>
            <b><%=fornecedor.getRazaosocial()%></b><br/>
            
            RG:<br/>
            <b><%=fornecedor.getCnpj()%></b><br/>

            E-mail: <br/>
            <b><%=fornecedor.getEmail()%></b><br/>
            
            Telefone: <br/>
            <b><%=fornecedor.getTelefone()%>"</b><br/>
            
            Endereço:<br/>
            <b><%=fornecedor.getEndereco()%></b><br/>
            <br/>
            
            <input type="submit" name="delete" value="Excluir"><br/>

        </form>
        <%}%>
    </body>
</html>
