<g:if test="${balanceAnual}">
  <g:set var="datosBalanceAnual" value="" />
  <g:each in="${balanceAnual}" var="registro">
    <g:set var="datosBalanceAnual" value="${datosBalanceAnual + "{anio: '${registro.key}', egreso: ${registro.value.egreso}, ingreso: ${registro.value.ingreso}},"}" />
  </g:each>

  <script type="text/javascript">
  $(function() {
    var datosBalanceAnual = [${raw(datosBalanceAnual)}];
    var graficoBalance = Morris.Line({
      element: 'state-panel-chart',
      data: datosBalanceAnual,
      xkey: 'anio',
      ykeys: ['egreso', 'ingreso'],
      labels: ['Egreso', 'Ingreso'],
      hideHover: 'auto',
      resize: true,
      lineColors: ['red', 'blue']
    });
  });
  </script>
</g:if>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <g:message code="balance.anual"/>
  </div>
  <div class="panel-body">
    <div class="row">
      <div class="col-lg-6">
        <div class="table-responsive">
          <table class="table table-bordered table-hover table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th><g:message code="label.fecha"/></th>
                <th><g:message code="label.hora"/></th>
                <th><g:message code="label.importe"/></th>
              </tr>
            </thead>
            <tbody>
              <g:each in="${detalleBalanceAnual}" var="registro">
                <tr class="${registro.tipo.toString() == 'EGRESO' ? 'danger' : 'success'}">
                  <td>${registro.id}</td>
                  <td>${registro.fecha.format('dd-MM-yyyy')}</td>
                  <td>${registro.fecha.format('HH:mm')}</td>
                  <td>${registro.monto}</td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-lg-6">
          <div id="state-panel-chart"></div>
      </div>
    </div>
  </div>
</div>
