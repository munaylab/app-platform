<script type="text/javascript">
$(function() {
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
  var graficoClasificacionIngresos = Morris.Donut({
    element: 'ingreso-donut',
    data: datosClasificacionIngresosAnuales,
    resize: true,
    colors: ['blue']
  });
  document.getElementById('clasificacionIngresosAnual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.anual')}";
    graficoClasificacionIngresos.setData(datosClasificacionIngresosAnuales);
  }
  document.getElementById('clasificacionIngresosMensual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.ingreso.mensual')}";
    graficoClasificacionIngresos.setData(datosClasificacionIngresosMensuales);
  }
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoClasificacionIngresos">
      <g:message code="balance.ingreso.anual"/>
    </span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          <g:message code="label.filtro"/> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li>
            <a href="#" id="clasificacionIngresosMensual" data-titulo="tituloGraficoClasificacionIngresos">
              <g:message code="label.mensual"/>
            </a>
          </li>
          <li>
            <a href="#" id="clasificacionIngresosAnual" data-titulo="tituloGraficoClasificacionIngresos">
              <g:message code="label.anual"/>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="ingreso-donut"></div>
  </div>
</div>
