<div class="panel panel-default">
  <div class="panel-heading">
    <g:message code="perfil.datos.titulo"/>
  </div>
  <div class="panel-body">
    <div class="form-group">
      <div class="col-lg-6">
        <label for="nombre"><g:message code="perfil.nombre.label"/></label>
        <input id="nombre" value="${org.nombre}" type="text" class="form-control" placeholder="${g.message(code: 'perfil.nombre.placeholder')}">
      </div>
      <div class="col-lg-6">
        <label for="fecha"><g:message code="perfil.fecha.constitucion.label"/></label>
        <input id="fecha" value="${org.fechaConstitucion}" type="text" class="form-control" placeholder="${g.message(code: 'perfil.fecha.constitucion.placeholder')}">
      </div>
      <div class="col-lg-12">
        <label for="objeto"><g:message code="perfil.objeto.label"/></label>
        <textarea id="objeto" class="form-control" rows="3">${org.objeto}</textarea>
      </div>
    </div>
  </div>
  <div class="panel-footer text-right">
    <button type="button" class="btn btn-primary">
      <g:message code="label.guardar"/>
    </button>
  </div>
</div>
