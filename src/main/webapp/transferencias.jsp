<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transferencias</title>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="codigos.DBconnection" %>
<%


if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null){
	System.out.println("Comienza creacion de la transferencia");	
	
	String rutCliente = request.getParameter("rutCliente");
	String idCuenta = request.getParameter("idCuenta");
	String montoTransferencia = request.getParameter("montoTransferencia");
	String cuentaTransferencia = request.getParameter("cuentaTransferencia");
	String tipoCuenta = request.getParameter("tipoCuenta");
	
	
	String sql = "INSERT INTO transferencias(rutCliente, idCuenta, montoTransferencia, cuentaTransferencia, tipoCuenta) VALUES('" + rutCliente + "', " + idCuenta + ", " + montoTransferencia + ",  '" + cuentaTransferencia + "', '" + tipoCuenta + "')";
	try(Connection conn = DBconnection.createNewDBconnection()){
		System.out.println("Se abre conexion correctamente");
		Statement stmt = conn.createStatement();
		boolean resultadoOk = stmt.execute(sql);
		 if(resultadoOk) {
			 System.out.println("Transferencia insertada correctamente");
			 response.sendRedirect("transferencia_ok.jsp");
		 }
		 else {
			 response.sendRedirect("transferencia_error.jsp");
		 }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally {
		System.out.println("Fin insert de la transferencia");
	}	
}

%>

</head>
<body>
<h2>Transferencias</h2>

<button onclick="window.history.back();">Volver</button>
</body>
</html>