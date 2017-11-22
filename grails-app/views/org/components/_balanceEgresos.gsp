<script type="text/javascript">
var datosEgresosAnuales = [{
    tiempo: '2015',
    monto: 8592
}, {
    tiempo: '2016',
    monto: 12356
}, {
    tiempo: '2017',
    monto: 15677
}, {
    tiempo: '2018',
    monto: 13426
}];
var datosEgresosMensuales = [{
    tiempo: '2017-02',
    monto: 100
}, {
    tiempo: '2017-05',
    monto: 65
}, {
    tiempo: '2017-06',
    monto: 50
}, {
    tiempo: '2017-09',
    monto: 45
}, {
    tiempo: '2017-10',
    monto: 60
}, {
    tiempo: '2017-11',
    monto: 75
}];
var graficoEgresos = [];
function cambiarEgresosAnuales() {
  document.getElementById('tituloGraficoEgresos').innerHTML='Egresos Anuales';
  graficoEgresos.setData(datosEgresosAnuales);
}
function cambiarEgresosMensuales() {
  document.getElementById('tituloGraficoEgresos').innerHTML='Egresos Mensuales';
  graficoEgresos.setData(datosEgresosMensuales);
}
$(function() {
  graficoEgresos = Morris.Area({
    element: 'egreso-chart',
    data: datosEgresosMensuales,
    xkey: 'tiempo',
    ykeys: ['monto'],
    labels: ['Egreso'],
    hideHover: 'auto',
    resize: true,
    lineColors: ['red']
  });
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoEgresos">Egresos Mensuales</span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          Filtro <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li><a href="javascript:cambiarEgresosMensuales();">Mensual</a></li>
          <li><a href="javascript:cambiarEgresosAnuales();">Anual</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="egreso-chart"></div>
  </div>
</div>
