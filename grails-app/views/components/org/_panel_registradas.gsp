<script type="text/javascript">
  $(function() {
    Morris.Area({
      element: 'registradas-panel-chart',
      data: [
        <g:each in="${registradas}">
          {
            period: "${it.fecha.format('yyyy-MM-dd')}",
            registradas: ${it.total}
          }
          <g:if test="${it != registradas.last()}"> ,</g:if>
        </g:each>
      ],
      xkey: 'period',
      ykeys: ['registradas'],
      labels: ['Registradas'],
      pointSize: 2,
      hideHover: 'auto',
      resize: true
    });
  });
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i> Registradas
  </div>
  <div class="panel-body">
      <div id="registradas-panel-chart"></div>
  </div>
</div>
