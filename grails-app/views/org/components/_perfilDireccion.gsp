<div class="panel panel-default">
  <div class="panel-heading"><g:message code="perfil.direccion.titulo"/></div>
  <div class="panel-body">
    <div class="form-group">
      <div class="col-lg-3 col-md-3 col-xs-6">
        <label for="calle"><g:message code="perfil.calle.label"/></label>
        <input id="calle" value="${org?.domicilio?.calle}" type="text" class="form-control">
      </div>
      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="numero"><g:message code="perfil.numero.label"/></label>
        <input id="numero" value="${org?.domicilio?.numero}" type="text" class="form-control">
      </div>
      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="piso"><g:message code="perfil.piso.label"/></label>
        <input id="piso" value="${org?.domicilio?.piso}" type="text" class="form-control">
      </div>
      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="departamento" class="visible-xs-block"><g:message code="perfil.departamento.label"/></label>
        <label for="departamento" class="hidden-xs"><g:message code="perfil.departamento.full.label"/></label>
        <input id="departamento" value="${org?.domicilio?.departamento}" type="text" class="form-control">
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6">
        <label for="barrio"><g:message code="perfil.barrio.label"/></label>
        <input id="barrio" value="${org?.domicilio?.barrio}" type="text" class="form-control">
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6">
        <label for="distrito"><g:message code="perfil.distrito.label"/></label>
        <input id="distrito" value="${org?.domicilio?.distrito}" type="text" class="form-control">
      </div>
      <div class="col-lg-3 col-md-6">
        <label for="localidad"><g:message code="perfil.localidad.label"/></label>
        <input id="localidad" value="${org?.domicilio?.localidad}" type="text" class="form-control">
      </div>
      <div class="col-lg-3 col-md-6">
        <label for="provincia"><g:message code="perfil.provincia.label"/></label>
        <input id="provincia" value="${org?.domicilio?.provincia}" type="text" class="form-control">
      </div>
      <div class="col-lg-3 col-md-6">
        <label for="pais"><g:message code="perfil.pais.label"/></label>
        <input id="pais" value="${org?.domicilio?.pais}" type="text" class="form-control">
      </div>
    </div>
  </div>
  <div class="panel-footer text-right">
    <button type="button" class="btn btn-primary">
      <g:message code="label.guardar"/>
    </button>
  </div>
</div>
