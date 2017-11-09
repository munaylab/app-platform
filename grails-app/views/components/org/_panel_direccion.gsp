<script type="text/javascript">
  $(function() {
    Morris.Donut({
      element: 'direccion-organizaciones',
      data: [
        <g:each in="${direcciones}">
          {
            label: "${it.direccion}",
            value: ${it.total}
          }
          <g:if test="${it != direcciones.last()}"> ,</g:if>
        </g:each>
      ]
    });
  });
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i> Dirección
  </div>
  <div class="panel-body">
      <div id="direccion-organizaciones"></div>
  </div>
</div>
