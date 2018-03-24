<g:if test="${!egresosClasificados.empty}">
  <g:set var="egreso" value="" />
  <g:each in="${egresosClasificados}">
    <g:set var="egreso" value="${egreso + "{label:'${it[2].capitalize()}', value: ${it[0]}},"}"/>
  </g:each>
  <script type="text/javascript">
  $(function() {
    var datosClasificacionEgresosAnuales = [${raw(egreso)}];
    var graficoClasificacionEgresos = Morris.Donut({
      element: 'egreso-donut',
      data: datosClasificacionEgresosAnuales,
      resize: true,
      colors: ['#B71C1C', '#C62828', '#D32F2F', '#E53935', '#F44336', '#EF5350', '#E57373', '#EF9A9A', '#FFCDD2']
    });
  });
  </script>
</g:if>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <g:message code="balance.egreso.label"/>
  </div>
  <div class="panel-body">
    <g:if test="${!egresosClasificados.empty}">
      <div id="egreso-donut"></div>
    </g:if>
    <g:else>
      <div class="chart-none text-center">
        <i class="fa fa-pie-chart fa-3x" aria-hidden="true"></i>
        <p><i>No hay datos para mostrar.</i></p>
      </div>
    </g:else>
  </div>
</div>
