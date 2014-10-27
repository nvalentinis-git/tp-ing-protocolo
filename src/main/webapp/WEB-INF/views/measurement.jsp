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

         table#estado thead tr th {
            border: medium solid;
         }

         table#estado tbody tr th {
             background: rgb(247,251,252); /* Old browsers */
             background: -moz-linear-gradient(-45deg,  rgba(247,251,252,1) 0%, rgba(217,237,242,1) 40%, rgba(173,217,228,1) 100%); /* FF3.6+ */
             background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,rgba(247,251,252,1)), color-stop(40%,rgba(217,237,242,1)), color-stop(100%,rgba(173,217,228,1))); /* Chrome,Safari4+ */
             background: -webkit-linear-gradient(-45deg,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* Chrome10+,Safari5.1+ */
             background: -o-linear-gradient(-45deg,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* Opera 11.10+ */
             background: -ms-linear-gradient(-45deg,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* IE10+ */
             background: linear-gradient(135deg,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* W3C */
             filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7fbfc', endColorstr='#add9e4',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
          }

          .incative {
                background: rgb(245,246,246); /* Old browsers */
                background: -moz-linear-gradient(-45deg,  rgba(245,246,246,1) 0%, rgba(219,220,226,1) 21%, rgba(184,186,198,1) 49%, rgba(221,223,227,1) 80%, rgba(245,246,246,1) 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,rgba(245,246,246,1)), color-stop(21%,rgba(219,220,226,1)), color-stop(49%,rgba(184,186,198,1)), color-stop(80%,rgba(221,223,227,1)), color-stop(100%,rgba(245,246,246,1))); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(-45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(-45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* Opera 11.10+ */
                background: -ms-linear-gradient(-45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* IE10+ */
                background: linear-gradient(135deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f5f6f6', endColorstr='#f5f6f6',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
          }

          body {
            background: rgb(226,226,226); /* Old browsers */
            background: -moz-linear-gradient(45deg,  rgba(226,226,226,1) 0%, rgba(219,219,219,1) 50%, rgba(209,209,209,1) 51%, rgba(254,254,254,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,rgba(226,226,226,1)), color-stop(50%,rgba(219,219,219,1)), color-stop(51%,rgba(209,209,209,1)), color-stop(100%,rgba(254,254,254,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(45deg,  rgba(226,226,226,1) 0%,rgba(219,219,219,1) 50%,rgba(209,209,209,1) 51%,rgba(254,254,254,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(45deg,  rgba(226,226,226,1) 0%,rgba(219,219,219,1) 50%,rgba(209,209,209,1) 51%,rgba(254,254,254,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(45deg,  rgba(226,226,226,1) 0%,rgba(219,219,219,1) 50%,rgba(209,209,209,1) 51%,rgba(254,254,254,1) 100%); /* IE10+ */
            background: linear-gradient(45deg,  rgba(226,226,226,1) 0%,rgba(219,219,219,1) 50%,rgba(209,209,209,1) 51%,rgba(254,254,254,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e2e2e2', endColorstr='#fefefe',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
          }
	</style>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <link rel="stylesheet" type="text/css" href="/TP-IngProtocolo/resources/assets//jquery.dataTables.css">
    <script type="text/javascript" src="/TP-IngProtocolo/resources/assets/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/TP-IngProtocolo/resources/assets/jquery.dataTables.js"></script>

<!--
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.3/css/jquery.dataTables.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.3/js/jquery.dataTables.js"></script>
-->

    <script type="text/javascript">

    $(document).ready(function() {

        // Setup - add a text input to each footer cell
        $('#example tfoot th').each( function () {
            var title = $('#example thead th').eq( $(this).index() ).text();
            $(this).html( '<input type="text" style="width: 100px;" placeholder="'+title+'" />' );
        } );

        $("#example").dataTable( {
            "language": {
                        "url": "/TP-IngProtocolo/resources/assets/Spanish.json"
                    },
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
        table = $('table table#example').DataTable();

        // Apply the search
        table.columns().eq( 0 ).each( function ( colIdx ) {
            $( 'input', table.column( colIdx ).footer() ).on( 'keyup change', function () {
                table
                    .column( colIdx )
                    .search( this.value )
                    .draw();
            } );
        } );

     // Funcion para actualizar el estadado de los Sensores
     function getNetState() {

          var netState = "http://localhost:8080/TP-IngProtocolo/netState";
          $.getJSON( netState, {
            tags: "mount rainier",
            tagmode: "any",
            format: "json"
          })
            .done(function( data ) {

              if(data.acumulador.state) {

                  $( "table#estado tbody tr th div#divac" ).css("border","medium solid green");
                  $( "table#estado tbody tr th div#divac p div#estado" ).add("Activo");
                  $( "table#estado tbody tr th div#divac p div#ip" ).add(data.acumulador.ip);
                  $( "table#estado tbody tr th div#divac p div#puerto" ).add(data.acumulador.port);

                  $.each( data.sensors, function( i, item ) {

                    selector = "table#estado tbody tr th div#div" + i;
                    if (item.state) {
                        $( selector ).css("border","medium solid green");
                        $( selector + " div#estado" ).text("Estado: Activo");
                        $( selector + " div#ip" ).text("IP: " + item.ip);
                        $( selector + " div#puerto" ).text("Puerto: " + item.port);
                    } else {
                        $( selector ).css("border","medium solid red").addClass("incative");
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

    <br/>
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
