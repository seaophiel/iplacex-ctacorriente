<html>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="codigos.DBconnection" %>

<%


if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null){
	System.out.println("Comienza validacion datos de login");	
	
	
	boolean loginOk = false;
	
	String usr = request.getParameter("usuario");
	String pass = request.getParameter("password");
	
	
	String sql = "Select * From usuario where nombreUsuario='" + usr + "' AND password='" + pass + "'";
	try(Connection conn = DBconnection.createNewDBconnection()){
		System.out.println("Se abre conexion correctamente");
		System.out.println("Se buscara login para credenciales usuario=" + usr + " y password=" + pass);
		Statement stmt = conn.createStatement();
		ResultSet results = stmt.executeQuery(sql);
		

		 while (results.next()) {
			 loginOk = true;
			 System.out.println("Se encontraron datos:");
			 Integer id = Integer.valueOf(results.getString("id"));
			 String user = String.valueOf(results.getString("nombreUsuario"));
			 String password = String.valueOf(results.getString("password"));
			 String nombre = String.valueOf(results.getString("nombre"));
			 System.out.println("id: " + id);
			 System.out.println("user: " + user);
			 System.out.println("password: " + password);
			 System.out.println("nombre: " + nombre);
		 }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally {
		System.out.println("Fin del proceso login");
	}
	
	if (loginOk) {
		System.out.println("LOGIN OK!");
		response.sendRedirect("home.jsp");	
	}
	else {
		System.out.println("credenciales no coinciden!");
		response.sendRedirect("error.jsp");	
	}
	
	
	/*
	if (usr.equalsIgnoreCase("seba") && pass.equalsIgnoreCase("123")){
		System.out.println("LOGIN OK!");
		response.sendRedirect("transferencias.jsp");
	}
	else {
		System.out.println("credenciales no coinciden!");
		response.sendRedirect("error.jsp");
	}
	*/
	
		
}

%>

<body>
<h2>Bienvenido al sistema de cuenta bancaria</h2>
<h4>Por favor ingrese sus credenciales</h4>
<form action="" method="post">
<table width="500">
	<tr>
		<th>Usuario</th>
		<td><input type="text" name="usuario" /></td>
	</tr>
	<tr>
		<th>Password</th>
		<td><input type="password" name="password" /></td>
	</tr>
	<tr>
		<td colspan="2">
		<button type="submit" name="submit">Ingresar</button>
		</td>
	</tr>
</table>

</form>
</body>
</html>
