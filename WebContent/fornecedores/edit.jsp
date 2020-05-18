<%@page import="br.gov.sp.fatecpg.config.Fornecedor"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Fornecedor fornecedor = null;
    int i = -1;
     if(request.getParameter("i")!= null){
        i = Integer.parseInt(request.getParameter("i"));
        fornecedor = Db.getFornecedores().get(i);
        if(fornecedor == null){
            error = "Índice inválido!";
        }else{
            if(request.getParameter("edit")!=null){
            	Fornecedor alt = new Fornecedor();
                alt.setNome(request.getParameter("nome"));
                alt.setRazaosocial(request.getParameter("razaosocial"));
                alt.setCnpj(request.getParameter("cnpj"));
                alt.setEmail(request.getParameter("email"));
                alt.setTelefone(request.getParameter("telefone"));
                alt.setEndereco(request.getParameter("endereco"));
                
                Db.getFornecedores().set(i, alt);
            }
        }
    }else{
        error = "Índice inválido!";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Fornecedor</title>
    </head>
    <body>
        <h1>Fornecedor</h1>
        <h3><a href="../index.jsp">Início</a></h3>
        <h2><a href="show.jsp">Fornecedores</a></h2>
        <h3>Editar</h3>
        
        <%if(error!=null){%>
        <div style="color:red"><%=error%></div>
        <%}else{%>
        <br/>
        <form method="post">
            Nome:<br> <input  type="text" name="nome" value="<%= Db.getFornecedores().get(i).getNome()%>">  <br>
            Razão Social:<br> <input  type="text" name="cpf" value="<%= Db.getFornecedores().get(i).getRazaosocial()%>">  <br>
            CNPJ:<br> <input  type="text" name="rg" value="<%= Db.getFornecedores().get(i).getCnpj()%>">  <br>
            E-mail:<br> <input  type="text" name="email" value="<%= Db.getFornecedores().get(i).getEmail()%>">  <br>
            Telefone:<br> <input  type="text" name="telefone" value="<%= Db.getFornecedores().get(i).getTelefone()%>">  <br>
            Endereço:<br> <input  type="text" name="endereco" value="<%= Db.getFornecedores().get(i).getEndereco()%>">  <br>
            
            <input type="submit" name="edit" value="Editar"><br/>
        </form>
        <%}%>
    </body>
</html>
