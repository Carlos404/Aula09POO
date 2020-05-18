<%@page import="br.gov.sp.fatecpg.config.Cliente"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Cliente cliente = null;
    int i = -1;
    if(request.getParameter("i") != null){
        i = Integer.parseInt(request.getParameter("i"));
        cliente = Db.getClientes().get(i);
        if(cliente == null){
            error = "Índice inválido!";
        }else{
            if(request.getParameter("delete")!=null){      
                Db.getClientes().remove(i);
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
        <title>Remover Cliente</title>
    </head>
    <body>
        <h1>Cliente</h1>
        <h3><a href="../index.jsp">Início</a></h3>
        <h3><a href="../fornecedores/show.jsp">Clientes</a></h3>
        <h3>Excluir</h3>
        <%if(error!=null){%>
        <div style="color:red"><%=error%></div>
        <%}else{%>
        <br/>
        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome:<br/>
            <b><%=cliente.getNome()%></b><br/>
            
            CPF:<br/>
            <b><%=cliente.getCpf()%></b><br/>
            
            RG:<br/>
            <b><%=cliente.getRg()%></b><br/>

            E-mail: <br/>
            <b><%=cliente.getEmail()%></b><br/>
            
            Telefone: <br/>
            <b><%=cliente.getTelefone()%>"</b><br/>
            
            Endereço:<br/>
            <b><%=cliente.getEndereco()%></b><br/>
            <br/>
            
            <input type="submit" name="delete" value="Excluir"><br/>

        </form>
        <%}%>
    </body>
</html>
