<g:if test="${!datosIngresoAnual.empty || !datosIngresoMensual.empty || !datosIngresoSemanal.empty}">
  <g:set var="datosAnual" value="" />
  <g:set var="datosMensual" value="" />
  <g:set var="datosSemanal" value="" />
  <g:each in="${datosIngresoAnual}">
    <g:set var="datosAnual" value="${datosAnual + it.getBalanceData('yyyy')}"/>
  </g:each>
  <g:each in="${datosIngresoMensual}">
    <g:set var="datosMensual" value="${datosMensual + it.getBalanceData('yyyy-MM')}"/>
  </g:each>
  <g:each in="${datosIngresoSemanal}">
    <g:set var="datosSemanal" value="${datosSemanal + it.getBalanceData('yyyy-MM-dd')}"/>
  </g:each>

  <script type="text/javascript">
  $(function() {
    var datosIngresos = {
      week: [${raw(datosSemanal)}],
      month: [${raw(datosMensual)}],
      year: [${raw(datosAnual)}]
    };
    var graficoIngresos = Morris.Area({
      element: 'ingreso-chart',
      data: datosIngresos.month,
      xkey: 'tiempo',
      ykeys: ['monto'],
      labels: ["${g.message(code: 'balance.ingreso.label')}"],
      xLabels: 'month',
      hideHover: 'auto',
      resize: true,
      lineColors: ['blue']
    });
    function cambiarDatosDelGrafico(e) {
      document.getElementById('tituloGraficoIngresos').innerHTML = this.dataset.titulo;
      graficoIngresos.options.xLabels = this.dataset.value;
      graficoIngresos.setData(datosIngresos[this.dataset.value]);
    }
    document.getElementById('balanceIngresosAnual').onclick = cambiarDatosDelGrafico;
    document.getElementById('balanceIngresosMensual').onclick = cambiarDatosDelGrafico;
    document.getElementById('balanceIngresosSemanal').onclick = cambiarDatosDelGrafico;
  });
  </script>
</g:if>
<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoIngresos">
      <g:message code="balance.ingreso.mensual"/>
    </span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          <g:message code="label.filtro"/> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li>
            <a href="#" id="balanceIngresosSemanal" data-value="week"
                data-titulo="${g.message(code: 'balance.ingreso.semanal')}">
              <g:message code="label.semanal"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceIngresosMensual" data-value="month"
                data-titulo="${g.message(code: 'balance.ingreso.mensual')}">
              <g:message code="label.mensual"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceIngresosAnual" data-value="year"
                data-titulo="${g.message(code: 'balance.ingreso.anual')}">
              <g:message code="label.anual"/>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <g:if test="${!datosIngresoAnual.empty || !datosIngresoMensual.empty || !datosIngresoSemanal.empty}">
      <div id="ingreso-chart"></div>
    </g:if>
    <g:else>
      <div class="chart-none text-center">
        <i class="fa fa-bar-chart-o fa-3x"></i>
        <p><i>No hay datos para mostrar.</i></p>
      </div>
    </g:else>
  </div>
</div>
