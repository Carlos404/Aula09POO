<%@page import="br.gov.sp.fatecpg.config.Fornecedor"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String error = null;

	if (request.getParameter("add") != null) {
		Fornecedor forn = new Fornecedor();
		forn.setNome(request.getParameter("nome"));
		forn.setRazaosocial(request.getParameter("razaosocial"));
		forn.setCnpj(request.getParameter("cnpj"));
		forn.setEmail(request.getParameter("email"));
		forn.setTelefone(request.getParameter("telefone"));
		forn.setEndereco(request.getParameter("endereco"));
		Db.getFornecedores().add(forn);
		response.sendRedirect(request.getRequestURI());

	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inserir Fornecedor</title>
</head>
<body>
	<h1>Inserir Fornecedor</h1>
	<h2>
		<a href="show.jsp">Todos Fornecedores</a>
	</h2>
	<h3>Novo</h3>

	<%
		if (error != null) {
	%>
	<div style="color: red"><%=error%></div>
	<%
		}
	%>

	<form method="post">
		<label>Nome:</label><br /> <input type="text" name="nome" /><br />
		<label>Razão Social:</label><br /> <input type="text" name="razaosocial" /><br />
		<label>CNPJ:</label><br /> <input type="text" name="cnpj" /><br />
		<label>E-mail:</label><br /> <input type="text" name="email" /><br />
		<label>Telefone:</label><br /> <input type="text" name="telefone" /><br />
		<label>Endereço:</label><br /> <input type="text" name="endereco" /><br />

		<br /> <input type="submit" name="add" value="Inserir" /><br />

	</form>
</body>
</html>
