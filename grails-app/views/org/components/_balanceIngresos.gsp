<g:if test="${!datosIngresoAnual.empty || !datosIngresoMensual.empty || !datosIngresoSemanal.empty}">

  <g:set var="informeAnual" value="" />
  <g:each in="${datosIngresoAnual}">
    <g:set var="informeAnual" value="${informeAnual + it.getBalanceData('yyyy')}"/>
  </g:each>
  <g:set var="informeMensual" value="" />
  <g:each in="${datosIngresoMensual}">
    <g:set var="informeMensual" value="${informeMensual + it.getBalanceData('yyyy-MM')}"/>
  </g:each>
  <g:set var="informeSemanal" value="" />
  <g:each in="${datosIngresoSemanal}">
    <g:set var="informeSemanal" value="${informeSemanal + it.getBalanceData('yyyy-MM-dd')}"/>
  </g:each>

  <script type="text/javascript">
  $(function() {
    var datosIngresosAnuales = [${raw(informeAnual)}];
    var datosIngresosMensuales = [${raw(informeMensual)}];
    var datosIngresosSemanales = [${raw(informeSemanal)}];

    var graficoIngresos = Morris.Area({
      element: 'ingreso-chart',
      data: datosIngresosMensuales,
      xkey: 'tiempo',
      ykeys: ['monto'],
      labels: ["${g.message(code: 'balance.ingreso.label')}"],
      xLabels: 'month',
      hideHover: 'auto',
      resize: true,
      lineColors: ['blue']
    });

    document.getElementById('balanceIngresosAnual').onclick = function (e) {
      e.preventDefault();
      document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.anual')}";
      graficoIngresos.options.xLabels = 'year';
      graficoIngresos.setData(datosIngresosAnuales);
    };
    document.getElementById('balanceIngresosMensual').onclick = function (e) {
      e.preventDefault();
      document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.mensual')}";
      graficoIngresos.options.xLabels = 'month';
      graficoIngresos.setData(datosIngresosMensuales);
    };
    document.getElementById('balanceIngresosSemanal').onclick = function (e) {
      e.preventDefault();
      document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.semanal')}";
      graficoIngresos.options.xLabels = 'week';
      graficoIngresos.setData(datosIngresosSemanales);
    };
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
            <a href="#" id="balanceIngresosSemanal" data-titulo="tituloGraficoIngresos">
              <g:message code="label.semanal"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceIngresosMensual" data-titulo="tituloGraficoIngresos">
              <g:message code="label.mensual"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceIngresosAnual" data-titulo="tituloGraficoIngresos">
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
    <div id="ingreso-chart-none" class="chart-none text-center">
      <i class="fa fa-bar-chart-o fa-3x"></i>
      <p><i>No hay datos para mostrar.</i></p>
    </div>
    </g:else>
  </div>
</div>
