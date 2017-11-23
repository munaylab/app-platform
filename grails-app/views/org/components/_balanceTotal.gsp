<script type="text/javascript">
$(function() {
  var datosBalanceMensual = [
    {y: '2017-01', a: 922, b: 144},
    {y: '2017-02', a: 430, b: 315},
    {y: '2017-03', a: 633, b: 232},
    {y: '2017-04', a: 632, b: 322},
    {y: '2017-05', a: 612, b: 440},
    {y: '2017-06', a: 730, b: 225},
    {y: '2017-07', a: 500, b: 212}];
  var datosBalanceAnual = [
    {y: '2006', a: 13922, b: 3444},
    {y: '2007', a: 13230, b: 5015},
    {y: '2008', a: 16033, b: 3632},
    {y: '2009', a: 19332, b: 7922},
    {y: '2010', a: 20012, b: 8240},
    {y: '2011', a: 17230, b: 6025},
    {y: '2012', a: 8500, b: 10012}];
  var graficoBalance = Morris.Line({
    element: 'state-panel-chart',
    data: datosBalanceAnual,
    xkey: 'y',
    ykeys: ['a', 'b'],
    labels: ['Series A', 'Series B'],
    hideHover: 'auto',
    resize: true,
    lineColors: ['red', 'blue']
  });
  document.getElementById('balanceAnual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.anual')}";
    graficoBalance.setData(datosBalanceAnual);
  }
  document.getElementById('balanceMensual').onclick = function (e) {
    e.preventDefault();
    document.getElementById(this.dataset.titulo).innerHTML="${g.message(code: 'balance.mensual')}";
    graficoBalance.setData(datosBalanceMensual);
  }
});
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i>
    <span id="tituloGraficoBalance">
      <g:message code="balance.anual"/>
    </span>
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          <g:message code="label.filtro"/> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li>
            <a href="#" id="balanceAnual" data-titulo="tituloGraficoBalance">
              <g:message code="label.anual"/>
            </a>
          </li>
          <li>
            <a href="#" id="balanceMensual" data-titulo="tituloGraficoBalance">
              <g:message code="label.mensual"/>
            </a>
          </li>
        </ul>
      </div>
    </div>
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
              <tr>
                <td>3326</td>
                <td>10/21/2013</td>
                <td>3:29 PM</td>
                <td>$321.33</td>
              </tr>
              <tr>
                <td>3325</td>
                <td>10/21/2013</td>
                <td>3:20 PM</td>
                <td>$234.34</td>
              </tr>
              <tr>
                <td>3324</td>
                <td>10/21/2013</td>
                <td>3:03 PM</td>
                <td>$724.17</td>
              </tr>
              <tr>
                <td>3323</td>
                <td>10/21/2013</td>
                <td>3:00 PM</td>
                <td>$23.71</td>
              </tr>
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
