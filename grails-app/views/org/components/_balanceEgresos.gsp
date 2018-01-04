<g:if test="${!datosEgresoAnual.empty || !datosEgresoMensual.empty || !datosEgresoSemanal.empty}">
  <g:set var="datosAnual" value="" />
  <g:set var="datosMensual" value="" />
  <g:set var="datosSemanal" value="" />
  <g:each in="${datosEgresoAnual}">
    <g:set var="datosAnual" value="${datosAnual + it.getBalanceData('yyyy')}"/>
  </g:each>
  <g:each in="${datosEgresoMensual}">
    <g:set var="datosMensual" value="${datosMensual + it.getBalanceData('yyyy-MM')}"/>
  </g:each>
  <g:each in="${datosEgresoSemanal}">
    <g:set var="datosSemanal" value="${datosSemanal + it.getBalanceData('yyyy-MM-dd')}"/>
  </g:each>

  <script type="text/javascript">
  $(function() {
    var datosEgresos = {
      week: [${raw(datosSemanal)}],
      month: [${raw(datosMensual)}],
      year: [${raw(datosAnual)}]
    };
    var graficoEgresos = Morris.Area({
      element: 'egreso-chart',
      data: datosEgresos.month,
      xkey: 'tiempo',
      ykeys: ['monto'],
      labels: ["${g.message(code: 'balance.egreso.label')}"],
      xLabels: 'month',
      hideHover: 'auto',
      resize: true,
      lineColors: ['red']
    });
    function cambiarDatosDelGrafico(e) {
      document.getElementById('tituloGraficoEgresos').innerHTML = this.dataset.titulo;
      graficoEgresos.options.xLabels = this.dataset.value;
      graficoEgresos.setData(datosEgresos[this.dataset.value]);
    }
    document.getElementById('balanceEgresosSemanal').onclick = cambiarDatosDelGrafico;
    document.getElementById('balanceEgresosMensual').onclick = cambiarDatosDelGrafico;
    document.getElementById('balanceEgresosAnual').onclick = cambiarDatosDelGrafico;
  });
  </script>
</g:if>
<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoEgresos">
      <g:message code="balance.egreso.mensual"/>
    </span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          <g:message code="label.filtro"/> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li>
            <a href="#" id="balanceEgresosSemanal" data-value="week"
                data-titulo="${g.message(code: 'balance.egreso.semanal')}">
              <g:message code="label.semanal"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceEgresosMensual" data-value="month"
                data-titulo="${g.message(code: 'balance.egreso.mensual')}">
              <g:message code="label.mensual"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceEgresosAnual" data-value="year"
                data-titulo="${g.message(code: 'balance.egreso.anual')}">
              <g:message code="label.anual"/>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <g:if test="${!datosEgresoAnual.empty || !datosEgresoMensual.empty || !datosEgresoSemanal.empty}">
      <div id="egreso-chart"></div>
    </g:if>
    <g:else>
      <div class="chart-none text-center">
        <i class="fa fa-bar-chart-o fa-3x"></i>
        <p><i>No hay datos para mostrar.</i></p>
      </div>
    </g:else>
  </div>
</div>
