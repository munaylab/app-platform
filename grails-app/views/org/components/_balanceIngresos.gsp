<script type="text/javascript">
var datosIngresosMensuales = [{
    tiempo: '2017-02',
    monto: 120
}, {
    tiempo: '2017-05',
    monto: 105
}, {
    tiempo: '2017-06',
    monto: 115
}, {
    tiempo: '2017-09',
    monto: 109
}, {
    tiempo: '2017-10',
    monto: 110
}, {
    tiempo: '2017-11',
    monto: 107
}];
var datosIngresosAnuales = [{
    tiempo: '2015',
    monto: 19022
}, {
    tiempo: '2016',
    monto: 17299
}, {
    tiempo: '2017',
    monto: 20421
}, {
    tiempo: '2018',
    monto: 28443
}];
var graficoIngresos = [];
function cambiarIngresosAnuales() {
  document.getElementById('tituloGraficoIngresos').innerHTML='Ingresos Anuales';
  graficoIngresos.setData(datosIngresosAnuales);
}
function cambiarIngresosMensuales() {
  document.getElementById('tituloGraficoIngresos').innerHTML='Ingresos Mensuales';
  graficoIngresos.setData(datosIngresosMensuales);
}
$(function() {
  graficoIngresos = Morris.Area({
    element: 'ingreso-chart',
    data: datosIngresosMensuales,
    xkey: 'tiempo',
    ykeys: ['monto'],
    labels: ['Ingreso'],
    hideHover: 'auto',
    resize: true,
    lineColors: ['blue']
  });
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoIngresos">
      Ingresos Mensuales
    </span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          Filtro <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li><a href="javascript:cambiarIngresosMensuales();">Mensual</a></li>
          <li><a href="javascript:cambiarIngresosAnuales();">Anual</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="ingreso-chart"></div>
  </div>
</div>
