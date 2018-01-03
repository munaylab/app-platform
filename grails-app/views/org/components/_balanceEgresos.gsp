<g:set var="informeAnual" value="" />
<g:each in="${datosEgresoAnual}">
  <g:set var="informeAnual" value="${informeAnual +
    "{ tiempo: '" + it.fecha.format('yyyy') + "', monto: " + it.monto + "},"}" />
</g:each>

<g:set var="informeMensual" value="" />
<g:each in="${datosEgresoMensual}">
  <g:set var="informeMensual" value="${informeMensual +
    "{ tiempo: '" + it.fecha.format('yyyy-MM') + "', monto: " + it.monto + "},"}" />
</g:each>

<g:set var="informeSemanal" value="" />
<g:each in="${datosEgresoSemanal}">
  <g:set var="informeSemanal" value="${informeSemanal +
    "{ tiempo: '" + it.fecha.format('yyyy-MM-dd') + "', monto: " + it.monto + "},"}" />
</g:each>

<script type="text/javascript">
$(function() {
  var datosEgresosAnuales = [${raw(informeAnual)}];
  var datosEgresosMensuales = [${raw(informeMensual)}];
  var datosEgresosSemanales = [${raw(informeSemanal)}];
  var graficoEgresos = Morris.Area({
    element: 'egreso-chart',
    data: datosEgresosMensuales,
    xkey: 'tiempo',
    ykeys: ['monto'],
    labels: ["${g.message(code: 'balance.egreso.label')}"],
    xLabels: 'month',
    hideHover: 'auto',
    resize: true,
    lineColors: ['red']
  });
  document.getElementById('balanceEgresosSemanal').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.egreso.semanal')}";
    graficoEgresos.options.xLabels = 'week';
    graficoEgresos.setData(datosEgresosSemanales);
  };
  document.getElementById('balanceEgresosMensual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.egreso.mensual')}";
    graficoEgresos.options.xLabels = 'month';
    graficoEgresos.setData(datosEgresosMensuales);
  };
  document.getElementById('balanceEgresosAnual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.egreso.anual')}";
    graficoEgresos.options.xLabels = 'year';
    graficoEgresos.setData(datosEgresosAnuales);
  };
});
</script>

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
            <a href="#" id="balanceEgresosSemanal" data-titulo="tituloGraficoEgresos">
              <g:message code="label.semanal"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceEgresosMensual" data-titulo="tituloGraficoEgresos">
              <g:message code="label.mensual"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceEgresosAnual" data-titulo="tituloGraficoEgresos">
              <g:message code="label.anual"/>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="egreso-chart"></div>
  </div>
</div>
