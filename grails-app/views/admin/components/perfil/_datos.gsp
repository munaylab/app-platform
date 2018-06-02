<div class="panel panel-default">
  <div class="panel-heading">
    <g:message code="perfil.datos.titulo"/>
  </div>
  <div class="panel-body">
    <div class="form-group">
      <div class="col-lg-6">
        <label for="nombreOrg"><g:message code="perfil.nombre.label"/>*</label>
        <input id="nombreOrg" value="${org.nombre}" type="text" class="form-control" required
            pattern=".{3,200}" placeholder="${g.message(code: 'perfil.nombre.placeholder')}"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.denominacion.size.error')}">
      </div>
      <div class="col-lg-6">
        <label for="fechaOrg"><g:message code="perfil.fecha.constitucion.label"/></label>
        <input id="fechaOrg" value="${org.fechaConstitucion}" type="text" class="form-control"
            placeholder="${g.message(code: 'perfil.fecha.constitucion.placeholder')}">
      </div>
      <div class="col-lg-12">
        <label for="descripcionOrg"><g:message code="perfil.descripcion.label"/>*</label>
        <input id="descripcionOrg" value="${org.descripcion}" type="text" class="form-control" required
            pattern=".{10,1000}" placeholder="${g.message(code: 'perfil.descripcion.placeholder')}"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.denominacion.size.error')}">
      </div>
      <div class="col-lg-12">
        <label for="objetoOrg"><g:message code="perfil.objeto.label"/>*</label>
        <textarea id="objetoOrg" name="objeto" rows="3" class="form-control" required pattern=".{10,5000}" maxlength="5000"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.objeto.size.error')}">${org.objeto}</textarea>
      </div>
    </div>
  </div>
  <div class="panel-footer text-right">
    <button type="button" class="btn btn-primary">
      <g:message code="label.guardar"/>
    </button>
  </div>
</div>
