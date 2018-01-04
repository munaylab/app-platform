<g:if test="${!ingresosClasificados.empty}">
  <g:set var="ingreso" value="" />
  <g:each in="${ingresosClasificados}">
    <g:set var="ingreso" value="${ingreso + "{label:'${it[2].capitalize()}', value: ${it[0]}},"}"/>
  </g:each>
  <script type="text/javascript">
  $(function() {
    var datosClasificacionIngresosAnuales = [${raw(ingreso)}];
    var graficoClasificacionIngresos = Morris.Donut({
      element: 'ingreso-donut',
      data: datosClasificacionIngresosAnuales,
      resize: true,
      colors: ['#0D47A1', '#1565C0', '#1976D2', '#1E88E5', '#2196F3', '#42A5F5', '#64B5F6', '#90CAF9', '#BBDEFB', '#E3F2FD']
    });
  });
  </script>
</g:if>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <g:message code="balance.ingreso.label"/>
  </div>
  <div class="panel-body">
    <g:if test="${!ingresosClasificados.empty}">
      <div id="ingreso-donut"></div>
    </g:if>
    <g:else>
      <div class="chart-none text-center">
        <i class="fa fa-pie-chart fa-3x" aria-hidden="true"></i>
        <p><i>No hay datos para mostrar.</i></p>
      </div>
    </g:else>
  </div>
</div>
