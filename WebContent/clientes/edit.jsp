<%@page import="br.gov.sp.fatecpg.config.Cliente"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Cliente cliente = null;
    int i = -1;
     if(request.getParameter("i")!= null){
        i = Integer.parseInt(request.getParameter("i"));
        cliente = Db.getClientes().get(i);
        if(cliente == null){
            error = "Índice inválido!";
        }else{
            if(request.getParameter("edit")!=null){
            	Cliente alt = new Cliente();
                alt.setNome(request.getParameter("nome"));
                alt.setCpf(request.getParameter("cpf"));
                alt.setRg(request.getParameter("rg"));
                alt.setEmail(request.getParameter("email"));
                alt.setTelefone(request.getParameter("telefone"));
                alt.setEndereco(request.getParameter("endereco"));
                
                Db.getClientes().set(i, alt);
            }
        }
    }else{
        error = "Índice inválido!";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Contato</title>
    </head>
    <body>
        <h1>Contato</h1>
        <h3><a href="../index.jsp">Início</a></h3>
        <h2><a href="show.jsp">Contatos</a></h2>
        <h3>Editar</h3>
        
        <%if(error!=null){%>
        <div style="color:red"><%=error%></div>
        <%}else{%>
        <br/>
        <form method="post">
            Nome:<br> <input  type="text" name="nome" value="<%= Db.getClientes().get(i).getNome()%>">  <br>
            Cpf:<br> <input  type="text" name="cpf" value="<%= Db.getClientes().get(i).getCpf()%>">  <br>
            Rg:<br> <input  type="text" name="rg" value="<%= Db.getClientes().get(i).getRg()%>">  <br>
            E-mail:<br> <input  type="text" name="email" value="<%= Db.getClientes().get(i).getEmail()%>">  <br>
            Telefone:<br> <input  type="text" name="telefone" value="<%= Db.getClientes().get(i).getTelefone()%>">  <br>
            Endereço:<br> <input  type="text" name="endereco" value="<%= Db.getClientes().get(i).getEndereco()%>">  <br>
            
            <input type="submit" name="edit" value="Editar"><br/>
        </form>
        <%}%>
    </body>
</html>
