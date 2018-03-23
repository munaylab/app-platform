<g:form controller="org" action="evento" method="POST" useToken="true">

  <g:if test="${object}">
    <input type="hidden" name="id" value="${object.id}">
  </g:if>
  <input type="hidden" name="orgId" value="${org.id}">

  <div class="modal-body row">

    <div class="form-group col-sm-12">
      <label for="nombreEvento">
        <g:message code="label.nombre"/>
      </label>
      <input id="nombreEvento" name="nombre" value="${object?.nombre}"
          class="form-control" type="text" required/>
    </div>

    <div class="form-group col-sm-12">
      <label for="descripcionEvento">
        <g:message code="label.descripcion"/>
      </label>
      <textarea id="descripcionEvento" name="descripcion" class="form-control"
          rows="8" cols="80" required>${object?.descripcion}</textarea>
    </div>

    <div class="form-group col-md-6">
      <label for="fechaIniEvento">
        <g:message code="evento.fecha.inicio"/>
      </label>
      <div class="row">
        <div class="col-sm-6" style="padding-right: 0px;">
          <input id="fechaIniEvento" name="fechaIni" value="${object?.fechaIni?.format('yyyy-MM-dd')}" required
              class="form-control" type="date" style="border-top-right-radius: 0;border-bottom-right-radius: 0;">
        </div>
        <div class="col-sm-6" style="padding-left: 0px;">
          <input name="horaIni" value="${object?.fechaIni?.format('HH:mm')}" required
              class="form-control" type="time" style="border-top-left-radius: 0;border-bottom-left-radius: 0;">
        </div>
      </div>
    </div>
    <div class="form-group col-md-6">
      <label for="fechaFinEvento">
        <g:message code="evento.fecha.fin"/>
      </label>
      <div class="row">
        <div class="col-sm-6" style="padding-right: 0px;">
          <input id="fechaFinEvento" name="fechaFin" value="${object?.fechaFin?.format('yyyy-MM-dd')}" required
              class="form-control" type="date" style="border-top-right-radius: 0;border-bottom-right-radius: 0;">
        </div>
        <div class="col-sm-6" style="padding-left: 0px;">
          <input name="horaFin" value="${object?.fechaFin?.format('HH:mm')}" required
              class="form-control" type="time" style="border-top-left-radius: 0;border-bottom-left-radius: 0;">
        </div>
      </div>
    </div>
    <div class="form-group col-md-4">
      <label for="fechaDifusionEvento">
        <g:message code="evento.fecha.difusion"/>
      </label>
      <input id="fechaDifusionEvento" name="fechaDifusion" class="form-control" type="date"
          value="${object?.fechaDifusion?.format('yyyy-MM-dd')}">
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <g:message code="label.direccion"/>
    </div>
    <div class="panel-body">
      <g:if test="${object?.direccion}">
        <input type="hidden" name="direccion.id" value="${object.direccion.id}">
      </g:if>

      <div class="col-lg-3 col-md-3 col-xs-6">
        <label for="calle">
          <g:message code="perfil.calle.label"/>*
        </label>
        <input id="calle" name="direccion.calle" class="form-control" type="text"
            value="${object?.direccion?.calle}" pattern=".{3,50}" required>
      </div>

      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="numero">
          <g:message code="perfil.numero.label"/>*
        </label>
        <input id="numero" name="direccion.numero" class="form-control" type="text"
            value="${object?.direccion?.numero}" pattern=".{1,5}" required>
      </div>

      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="piso">
          <g:message code="perfil.piso.label"/>
        </label>
        <input id="piso" name="direccion.piso" class="form-control" type="number"
            value="${object?.direccion?.piso}" >
      </div>

      <div class="col-lg-2 col-md-3 col-xs-6">
        <label for="departamento" class="visible-xs-block">
          <g:message code="perfil.departamento.label"/>
        </label>
        <label for="departamento" class="hidden-xs">
          <g:message code="perfil.departamento.full.label"/>
        </label>
        <input id="departamento" name="direccion.departamento" class="form-control" type="text"
            value="${object?.direccion?.departamento}" pattern=".{1}">
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6">
        <label for="barrio">
          <g:message code="perfil.barrio.label"/>*
        </label>
        <input id="barrio" name="direccion.barrio" class="form-control" type="text"
            value="${object?.direccion?.barrio}" pattern=".{3,50}" required>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6">
        <label for="distrito">
          <g:message code="perfil.distrito.label"/>
        </label>
        <input id="distrito" name="direccion.distrito" class="form-control" type="text"
            value="${object?.direccion?.distrito}" pattern=".{3,50}">
      </div>

      <div class="col-lg-3 col-md-6">
        <label for="localidad">
          <g:message code="perfil.localidad.label"/>*
        </label>
        <input id="localidad" name="direccion.localidad" class="form-control" type="text"
            value="${object?.direccion?.localidad}" pattern=".{3,50}" required>
      </div>

      <div class="col-lg-3 col-md-6">
        <label for="provincia">
          <g:message code="perfil.provincia.label"/>*
        </label>
        <input id="provincia" name="direccion.provincia" class="form-control" type="text"
            value="${object?.direccion?.provincia}" pattern=".{3,50}" required>
      </div>

    </div>
  </div>

  <br>

  <div class="modal-footer">
    <g:if test="${object}">
      <g:link base="/org" controller="borrar" action="evento"
          id="${object.id}" class="btn btn-danger pull-left">
        <g:message code="label.borrar"/>
      </g:link>
    </g:if>

    <button type="button" class="btn btn-default" data-dismiss="modal">
      <g:message code="label.cerrar"/>
    </button>

    <button type="submit" class="btn btn-primary">
      <g:message code="label.agregar"/>
    </button>
  </div>

</g:form>
