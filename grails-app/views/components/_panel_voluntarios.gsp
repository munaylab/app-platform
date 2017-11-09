<script type="text/javascript">
  $(function() {
    Morris.Line({
      element: 'volunteers-panel-chart',
      data: [
        <g:each in="${volunteers}">
          {
            period: "${it.date.format('yyyy-MM-dd')}",
            activos: ${it.actives},
            pasivos: ${it.pasives},
            eventual: ${it.eventuals}
          }
          <g:if test="${it != volunteers.last()}"> ,</g:if>
        </g:each>
      ],
      xkey: 'period',
      ykeys: ['activos', 'pasivos', 'eventual'],
      labels: ['Activos', 'Pasivos', 'Eventuales'],
      pointSize: 2,
      hideHover: 'auto',
      resize: true
    });
  });
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i> Voluntarios
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          Actions <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
            <li><a href="#">Voluntarios Activos</a></li>
            <li><a href="#">Voluntarios Pasivos</a></li>
            <li><a href="#">Voluntarios Eventuales</a></li>
            <li class="divider"></li>
            <li><a href="#">Voluntarios Total</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="panel-body">
      <div id="volunteers-panel-chart"></div>
  </div>
</div>
