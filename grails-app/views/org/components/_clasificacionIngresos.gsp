<script type="text/javascript">
var datosClasificacionIngresosAnuales = [
    {label: "Categoria A", value: 234},
    {label: "Categoria B", value: 353},
    {label: "Categoria C", value: 223}
];
var datosClasificacionIngresosMensuales = [
  {label: "Categoria A", value: 124},
  {label: "Categoria B", value: 302},
  {label: "Categoria C", value: 260}
];
var graficoClasificacionIngresos = [];
function cambiarClasificacionIngresosAnuales() {
  document.getElementById('tituloGraficoClasificacionIngresos').innerHTML='Ingresos Anuales';
  graficoClasificacionIngresos.setData(datosClasificacionIngresosAnuales);
}
function cambiarClasificacionIngresosMensuales() {
  document.getElementById('tituloGraficoClasificacionIngresos').innerHTML='Ingresos Mensuales';
  graficoClasificacionIngresos.setData(datosClasificacionIngresosMensuales);
}
$(function() {
  graficoClasificacionIngresos = Morris.Donut({
    element: 'ingreso-donut',
    data: datosClasificacionIngresosAnuales,
    resize: true,
    colors: ['blue']
  });
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoIngresos">Ingresos</span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          Filtro <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li><a href="javascript:cambiarClasificacionIngresosMensuales();">Mensual</a></li>
          <li><a href="javascript:cambiarClasificacionIngresosAnuales();">Anual</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="ingreso-donut"></div>
  </div>
</div>
