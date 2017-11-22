<script type="text/javascript">
var datosClasificacionEgresosAnuales = [
    {label: "Categoria A", value: 234},
    {label: "Categoria B", value: 353},
    {label: "Categoria C", value: 223}
];
var datosClasificacionEgresosMensuales = [
  {label: "Categoria A", value: 124},
  {label: "Categoria B", value: 302},
  {label: "Categoria C", value: 260}
];
var graficoClasificacionEgresos = [];
function cambiarClasificacionEgresosAnuales() {
  document.getElementById('tituloGraficoClasificacionEgresos').innerHTML='Egresos Anuales';
  graficoClasificacionEgresos.setData(datosClasificacionEgresosAnuales);
}
function cambiarClasificacionEgresosMensuales() {
  document.getElementById('tituloGraficoClasificacionEgresos').innerHTML='Egresos Mensuales';
  graficoClasificacionEgresos.setData(datosClasificacionEgresosMensuales);
}
$(function() {
  graficoClasificacionEgresos = Morris.Donut({
    element: 'egreso-donut',
    data: datosClasificacionEgresosAnuales,
    resize: true,
    colors: ['red']
  });
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoEgresos">Egresos</span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          Filtro <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li><a href="javascript:cambiarClasificacionEgresosMensuales();">Mensual</a></li>
          <li><a href="javascript:cambiarClasificacionEgresosAnuales();">Anual</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="egreso-donut"></div>
  </div>
</div>
