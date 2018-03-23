<div class="row">
  <g:each var="panel" in="${panels}">
    <div class="col-lg-3 col-md-6 col-sm-6">
      <div class="panel ${panel.style}">
        <div class="panel-heading">
          <div class="row">
            <div class="col-xs-3">
              <i class="fa ${panel.icon} fa-5x"></i>
            </div>
            <div class="col-xs-9 text-right">
              <div class="huge">${panel.value}</div>
              <div>${panel.name}</div>
            </div>
          </div>
        </div>
        <g:link controller="org" action="${panel.link}">
          <div class="panel-footer">
            <span class="pull-left"> <g:message code="labe.detalles"/> </span>
            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
            <div class="clearfix"></div>
          </div>
        </g:link>
      </div>
    </div>
  </g:each>
</div>
