<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>

	<title>Lista de Mediciones</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
		tfoot input {
                width: 100%;
                padding: 3px;
                box-sizing: border-box;
            }
	</style>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Spring pagination using data tables</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.3/css/jquery.dataTables.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.3/js/jquery.dataTables.js"></script>
    <script type="text/javascript">

    $(document).ready(function() {

        // Setup - add a text input to each footer cell
        $('#example tfoot th').each( function () {
            var title = $('#example thead th').eq( $(this).index() ).text();
            $(this).html( '<input type="text" style="width: 100px;" placeholder="'+title+'" />' );
        } );

        $("#example").dataTable( {
            "bProcessing": false,
            "bServerSide": false,
            "sort": "id",
            "sAjaxSource": "dataJson",
            "aoColumns": [
                { "mData": "id" },
                { "mData": "anio" },
                { "mData": "mes" },
                { "mData": "dia" },
                { "mData": "hora" },
                { "mData": "minuto" },
                { "mData": "segundo" },
                { "mData": "sensor" },
                { "mData": "valor" }

            ]
        } );

        // DataTable
        var table = $('#example').DataTable();

        // Apply the search
        table.columns().eq( 0 ).each( function ( colIdx ) {
            $( 'input', table.column( colIdx ).footer() ).on( 'keyup change', function () {
                table
                    .column( colIdx )
                    .search( this.value )
                    .draw();
            } );
        } );


     function getNetState() {

          var netState = "http://localhost:8080/TP-IngProtocolo/netState";
          $.getJSON( netState, {
            tags: "mount rainier",
            tagmode: "any",
            format: "json"
          })
            .done(function( data ) {

              if(data.acumulador.state) {

                  $( "table#estado tbody tr th div#divac" ).css("border","medium solid blue");
                  $( "table#estado tbody tr th div#divac p div#estado" ).add("Activo");
                  $( "table#estado tbody tr th div#divac p div#ip" ).add(data.acumulador.ip);
                  $( "table#estado tbody tr th div#divac p div#puerto" ).add(data.acumulador.port);

                  $.each( data.sensors, function( i, item ) {

                    selector = "table#estado tbody tr th div#div" + i;
                    if (item.state) {
                        $( selector ).css("border","medium solid blue");
                        $( selector + " div#estado" ).text("Estado: Activo");
                        $( selector + " div#ip" ).text("IP: " + item.ip);
                        $( selector + " div#puerto" ).text("Puerto: " + item.port);
                    } else {
                        $( selector ).css("border","medium solid red");
                        $( selector + " div#estado" ).text("Estato: Inactivo");
                    }

                  });

              } else {

              }

            });
     }

     getNetState();

     setInterval( getNetState, 3000 );

    } );



    </script>

</head>
<body>

<!-- Modulo Estado Sensores -->

    <h2 >Estado de la Red<br></h2>
   <table width="100%" style="border: 3px;background: rgb(243, 244, 248);"><tr><td>
           <table id="estado" class="display" cellspacing="0" width="100%">
               <thead>
                   <tr>
                       <th>Acumulador</th>
                       <th>Sensor 1</th>
                       <th>Sensor 2</th>
                       <th>Sensor 3</th>
                       <th>Sensor 4</th>
                       <th>Sensor 5</th>
                   </tr>
               </thead>


               <tbody>
                   <tr>
                       <th>
                            <div id="divAc" style="text-align: left; border: medium solid red;">
                                <br/>
                                <div id="estado">Estado:</div>
                                <br/>
                                <div id="ip">IP:</div>
                                <br/>
                                <div id="puerto">Puerto:</div>
                            </div>
                       </th>
                       <th>
                            <div id="div0" style="text-align: left; border: medium solid red;">
                                <br/>
                                <div id="estado">Estado:</div>
                                <br/>
                                <div id="ip">IP:</div>
                                <br/>
                                <div id="puerto">Puerto:</div>
                            </div>
                       </th>
                       <th>
                            <div id="div1" style="text-align: left; border: medium solid red;">
                                <br/>
                                <div id="estado">Estado:</div>
                                <br/>
                                <div id="ip">IP:</div>
                                <br/>
                                <div id="puerto">Puerto:</div>
                            </div>
                       </th>
                       <th>
                            <div id="div2" style="text-align: left; border: medium solid red;">
                                <br/>
                                <div id="estado">Estado:</div>
                                <br/>
                                <div id="ip">IP:</div>
                                <br/>
                                <div id="puerto">Puerto:</div>
                           </div>
                       </th>
                       <th>
                           <div id="div3" style="text-align: left; border: medium solid red;">
                                <br/>
                                <div id="estado">Estado:</div>
                                <br/>
                                <div id="ip">IP:</div>
                                <br/>
                                <div id="puerto">Puerto:</div>
                           </div>
                       </th>
                       <th>
                           <div id="div4" style="text-align: left; border: medium solid red;">
                                <br/>
                                <div id="estado">Estado:</div>
                                <br/>
                                <div id="ip">IP:</div>
                                <br/>
                                <div id="puerto">Puerto:</div>
                           </div>
                       </th>
                   </tr>
               <tbody>

           </table>
           </td></tr></table>


<!-- Modulo Lista Dinamica -->

    <form:form action="" method="GET">
    <h2 >Lista de Mediciones<br></h2>
    <table width="100%" style="border: 3px;background: rgb(243, 244, 248);"><tr><td>
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ANIO</th>
                    <th>MES</th>
                    <th>DIA</th>
                    <th>HORA</th>
                    <th>MINUTO</th>
                    <th>SEGUNDOS</th>
                    <th>SENSOR</th>
                    <th>VALOR</th>
                </tr>
            </thead>

            <tfoot>
                <tr>
                    <th>ID</th>
                    <th>ANIO</th>
                    <th>MES</th>
                    <th>DIA</th>
                    <th>HORA</th>
                    <th>MINUTO</th>
                    <th>SEGUNDOS</th>
                    <th>SENSOR</th>
                    <th>VALOR</th>
                </tr>
            </tfoot>

        </table>
        </td></tr></table>
    </form:form>


<!-- Modulo Add Measurement -->
<!--
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

-->


<!-- Modulo Lista vieja -->
<!--

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
-->


</body>
</html>
