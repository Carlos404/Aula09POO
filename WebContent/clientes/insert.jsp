<%@page import="br.gov.sp.fatecpg.config.Cliente"%>
<%@page import="br.gov.sp.fatecpg.config.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String error = null;

	if (request.getParameter("add") != null) {
		Cliente cli = new Cliente();
		cli.setNome(request.getParameter("nome"));
		cli.setCpf(request.getParameter("cpf"));
		cli.setRg(request.getParameter("rg"));
		cli.setEmail(request.getParameter("email"));
		cli.setTelefone(request.getParameter("telefone"));
		cli.setEndereco(request.getParameter("endereco"));
		Db.getClientes().add(cli);
		response.sendRedirect(request.getRequestURI());

	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inserir Cliente</title>
</head>
<body>
	<h1>Inserir Cliente</h1>
	<h2>
		<a href="show.jsp">Todos Clientes</a>
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
		<label>CPF:</label><br /> <input type="text" name="cpf" /><br />
		<label>RG:</label><br /> <input type="text" name="rg" /><br />
		<label>E-mail:</label><br /> <input type="text" name="email" /><br />
		<label>Telefone:</label><br /> <input type="text" name="telefone" /><br />
		<label>Endereço:</label><br /> <input type="text" name="endereco" /><br />

		<br /> <input type="submit" name="add" value="Inserir" /><br />

	</form>
</body>
</html>
