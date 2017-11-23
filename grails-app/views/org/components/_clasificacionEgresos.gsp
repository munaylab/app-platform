<script type="text/javascript">
$(function() {
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
  var graficoClasificacionEgresos = Morris.Donut({
    element: 'egreso-donut',
    data: datosClasificacionEgresosAnuales,
    resize: true,
    colors: ['red', 'blue', 'green', 'yellow']
  });
  document.getElementById('clasificacionEgresosAnual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.egreso.anual')}";
    graficoClasificacionEgresos.setData(datosClasificacionEgresosAnuales);
  };
  document.getElementById('clasificacionEgresosMensual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.egreso.mensual')}";
    graficoClasificacionEgresos.setData(datosClasificacionEgresosMensuales);
  };
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoClasificacionEgresos">
      <g:message code="balance.egreso.anual"/>
    </span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          <g:message code="label.filtro"/> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li>
            <a href="#" id="clasificacionEgresosMensual" data-titulo="tituloGraficoClasificacionEgresos">
              <g:message code="label.mensual"/>
            </a>
          </li>
          <li>
            <a href="#" id="clasificacionEgresosAnual" data-titulo="tituloGraficoClasificacionEgresos">
              <g:message code="label.anual"/>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
    <div id="egreso-donut"></div>
  </div>
</div>
