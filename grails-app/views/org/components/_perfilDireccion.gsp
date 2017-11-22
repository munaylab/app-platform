<div class="panel panel-default">
  <div class="panel-heading"><g:message code="perfil.direccion.titulo"/></div>
  <div class="panel-body">
    <div class="form-group">

      <div class="col-lg-3 col-md-3 col-xs-6">
        <label for="calle">
          <g:message code="perfil.calle.label"/>*
        </label>
        <input id="calle" class="form-control" type="text"
            value="${org?.domicilio?.calle}" pattern=".{3,50}" required>
      </div>

      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="numero">
          <g:message code="perfil.numero.label"/>*
        </label>
        <input id="numero" class="form-control" type="text"
            value="${org?.domicilio?.numero}" pattern=".{1,5}" required>
      </div>

      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="piso">
          <g:message code="perfil.piso.label"/>
        </label>
        <input id="piso" class="form-control" type="number"
            value="${org?.domicilio?.piso}"  required>
      </div>

      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="departamento" class="visible-xs-block">
          <g:message code="perfil.departamento.label"/>
        </label>
        <label for="departamento" class="hidden-xs">
          <g:message code="perfil.departamento.full.label"/>
        </label>
        <input id="departamento" class="form-control" type="text"
            value="${org?.domicilio?.departamento}" pattern=".{1}">
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6">
        <label for="barrio">
          <g:message code="perfil.barrio.label"/>*
        </label>
        <input id="barrio" class="form-control" type="text"
            value="${org?.domicilio?.barrio}" pattern=".{3,50}" required>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6">
        <label for="distrito">
          <g:message code="perfil.distrito.label"/>
        </label>
        <input id="distrito" class="form-control" type="text"
            value="${org?.domicilio?.distrito}" pattern=".{3,50}">
      </div>

      <div class="col-lg-3 col-md-6">
        <label for="localidad">
          <g:message code="perfil.localidad.label"/>*
        </label>
        <input id="localidad" class="form-control" type="text"
            value="${org?.domicilio?.localidad}" pattern=".{3,20}" required>
      </div>

      <div class="col-lg-3 col-md-6">
        <label for="provincia">
          <g:message code="perfil.provincia.label"/>*
        </label>
        <input id="provincia" class="form-control" type="text"
            value="${org?.domicilio?.provincia}" pattern=".{3,20}" required>
      </div>

      <div class="col-lg-3 col-md-6">
        <label for="pais">
          <g:message code="perfil.pais.label"/>*
        </label>
        <input id="pais" class="form-control" type="text"
            value="${org?.domicilio?.pais}" pattern=".{3,20}" required>
      </div>

    </div>
  </div>

  <div class="panel-footer text-right">
    <button type="button" class="btn btn-primary">
      <g:message code="label.guardar"/>
    </button>
  </div>

</div>
