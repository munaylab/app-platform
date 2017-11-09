<script type="text/javascript">
  $(function() {
    Morris.Bar({
      element: 'state-panel-chart',
      data: [{
          y: '2006',
          a: 100,
          b: 90
      }, {
          y: '2007',
          a: 75,
          b: 65
      }, {
          y: '2008',
          a: 50,
          b: 40
      }, {
          y: '2009',
          a: 75,
          b: 65
      }, {
          y: '2010',
          a: 50,
          b: 40
      }, {
          y: '2011',
          a: 75,
          b: 65
      }, {
          y: '2012',
          a: 100,
          b: 90
      }],
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Series A', 'Series B'],
      hideHover: 'auto',
      resize: true
    });
  });
</script>

<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i> Balance
    <div class="pull-right">
      <div class="btn-group">
        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
          Actions <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right" role="menu">
          <li><a href="#">Ingresos</a></li>
          <li><a href="#">Egresos</a></li>
          <li class="divider"></li>
          <li><a href="#">Total</a></li>
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
                <th>Fecha</th>
                <th>Hora</th>
                <th>Importe</th>
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
