<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-desktop"></i> <g:message code="contenido.landing"/>
  </div>

  <div class="panel-body">
    <form class="form-horizontal">
      <div class="form-group">
        <label class="col-sm-3 control-label">
          <g:message code="contenido.landing.titulo"/>
        </label>
        <div class="col-sm-9">
          <p class="form-control-static">
            ${landing.titulo}
          </p>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">
          <g:message code="contenido.landing.articulo"/>
        </label>
        <div class="col-sm-9">
          <p class="form-control-static">
            ${landing.contenido?.titulo}
          </p>
        </div>
      </div>
      <a class="btn btn-primary btn-block" href="${g.createLink(url: '/admin/contenido/landing')}">
        <g:message code="default.button.edit.label"/>
      </a>
    </form>
  </div>
</div>
