<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Measurement Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Measurement
</h1>

<c:url var="addAction" value="/measurement/add" ></c:url>

<form:form action="${addAction}" commandName="measurement">
<table>
	<c:if test="${!empty measurement.anio}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="anio">
				<spring:message text="Anio"/>
			</form:label>
		</td>
		<td>
			<form:input path="anio" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="mes">
				<spring:message text="Mes"/>
			</form:label>
		</td>
		<td>
			<form:input path="mes" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty measurement.anio}">
				<input type="submit"
					value="<spring:message text="Edit Measurement"/>" />
			</c:if>
			<c:if test="${empty measurement.anio}">
				<input type="submit"
					value="<spring:message text="Add Measurement"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Lista de Mediciones</h3>
<c:if test="${!empty listMeasurements}">
	<table class="tg">
	<tr>
		<th width="80">ID</th>
		<th width="120">ANIO</th>
		<th width="120">MES</th>
		<th width="120">DIA</th>
		<th width="120">HORA</th>
		<th width="120">MINUTO</th>
		<th width="120">SEGUNDOS</th>
		<th width="120">SENSOR</th>
		<th width="120">VALOR</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listMeasurements}" var="measurement">
		<tr>
			<td>${measurement.id}</td>
			<td>${measurement.anio}</td>
			<td>${measurement.mes}</td>
			<td>${measurement.dia}</td>
			<td>${measurement.hora}</td>
			<td>${measurement.minuto}</td>
			<td>${measurement.segundo}</td>
			<td>${measurement.sensor}</td>
			<td>${measurement.valor}</td>
			<td><a href="<c:url value='/edit/${measurement.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${measurement.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
