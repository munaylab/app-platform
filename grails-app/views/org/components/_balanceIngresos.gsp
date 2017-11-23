<script type="text/javascript">
$(function() {
  var datosIngresosMensuales = [
    {tiempo: '2017-02',monto: 120},
    {tiempo: '2017-05',monto: 105},
    {tiempo: '2017-06',monto: 115},
    {tiempo: '2017-09',monto: 109},
    {tiempo: '2017-10',monto: 110},
    {tiempo: '2017-11',monto: 107}];
  var datosIngresosAnuales = [
    {tiempo: '2015', monto: 19022},
    {tiempo: '2016', monto: 17299},
    {tiempo: '2017', monto: 20421},
    {tiempo: '2018', monto: 28443}];

  var graficoIngresos = Morris.Area({
    element: 'ingreso-chart',
    data: datosIngresosMensuales,
    xkey: 'tiempo',
    ykeys: ['monto'],
    labels: ["${g.message(code: 'balance.ingreso.label')}"],
    hideHover: 'auto',
    resize: true,
    lineColors: ['blue']
  });

  document.getElementById('balanceIngresosAnual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.anual')}";
    graficoIngresos.setData(datosIngresosAnuales);
  }
  document.getElementById('balanceIngresosMensual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.mensual')}";
    graficoIngresos.setData(datosIngresosMensuales);
  }
});
</script>

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
    <div id="ingreso-chart"></div>
  </div>
</div>
