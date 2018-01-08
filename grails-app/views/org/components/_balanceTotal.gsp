<g:if test="${balanceAnual}">
  <g:set var="datosBalanceAnual" value="" />
  <g:each in="${balanceAnual}" var="registro">
    <g:set var="datosBalanceAnual" value="${datosBalanceAnual + "{anio: '${registro.key}', egreso: ${registro.value.egreso}, ingreso: ${registro.value.ingreso}},"}" />
  </g:each>

  <script type="text/javascript">
  $(function() {
    var datosBalanceAnual = [${raw(datosBalanceAnual)}];
    var graficoBalance = Morris.Bar({
      element: 'state-panel-chart',
      data: datosBalanceAnual,
      xkey: 'anio',
      ykeys: ['egreso', 'ingreso'],
      labels: ['Egreso', 'Ingreso'],
      hideHover: 'auto',
      resize: true,
      barColors: ['#F44336', '#2196F3']
    });
  });
  </script>
</g:if>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <g:message code="balance.anual"/>
  </div>
  <div class="panel-body">
    <div id="state-panel-chart"></div>
  </div>
</div>
