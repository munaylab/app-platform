
<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <g:message code="balance.ultimosMovimientos"/>
  </div>
  <div class="panel-body">
    <div class="table-responsive">
      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th><g:message code="label.detale"/></th>
            <th><g:message code="label.fecha"/></th>
            <th><g:message code="label.importe"/></th>
          </tr>
        </thead>
        <tbody>
          <g:each in="${ultimosMovimientos}" var="registro">
            <tr style="background-color:${registro.tipo.toString() == 'EGRESO' ? 'rgba(239, 83, 80, 0.6)' : 'rgba(33, 150, 243, 0.6)'}">
              <td>${registro.id}</td>
              <td>${registro.detalle.size() > 27 ? registro.detalle.substring(0, 25) + '...' : registro.detalle}</td>
              <td>${registro.fecha.format('dd-MM-yyyy HH:mm')}</td>
              <td>${registro.monto}</td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
  </div>
</div>
