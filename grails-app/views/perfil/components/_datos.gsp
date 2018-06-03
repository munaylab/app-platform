<g:hasErrors bean="${org}">
  <div class="alert alert-danger" role="alert">
    <g:renderErrors bean="${org}" />
  </div>
</g:hasErrors>

<g:form controller="perfil" action="guardar" method="POST" useToken="true">
  <g:hiddenField name="id" value="${org.id}"/>

  <div class="panel panel-default">
    <div class="panel-heading"><g:message code="perfil.datos.titulo"/></div>

    <div class="panel-body">

      <div class="form-group">
        <label for="nombre"><g:message code="perfil.nombre.label"/>*</label>
        <input id="nombre" name="nombre" type="text" class="form-control" required pattern=".{3,200}"
            value="${command?.nombre ?: org.nombre}"
            placeholder="${g.message(code: 'perfil.nombre.placeholder')}"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.denominacion.size.error')}">
      </div>

      <div class="form-group">
        <label for="fecha"><g:message code="perfil.fecha.constitucion.label"/></label>
        <input id="fecha" name="fechaConstitucion" type="date" class="form-control"
            value="${command?.fechaConstitucion?.format('YYYY-MM-dd') ?: org.fechaConstitucion?.format('YYYY-MM-dd')}"
            placeholder="${g.message(code: 'perfil.fecha.constitucion.placeholder')}">
      </div>

      <div class="form-group">
        <label for="descripcion"><g:message code="perfil.descripcion.label"/>*</label>
        <input id="descripcion" name="descripcion" type="text" class="form-control"
            value="${command?.descripcion ?: org.descripcion}" required pattern=".{10,1000}"
            placeholder="${g.message(code: 'perfil.descripcion.placeholder')}"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.denominacion.size.error')}">
      </div>

      <div class="form-group">
        <label for="tipo"><g:message code="perfil.tipo.label"/></label>
        <select id="tipo" name="tipo" class="form-control">
          <option value="FUNDACION" ${command?.tipo?.value == 'FUNDACION' || org?.tipo?.value == 'FUNDACION' ? 'checked' : ''}>
            FUNDACION
          </option>
          <option value="ASOCIACION_CIVIL" ${command?.tipo?.value == 'ASOCIACION_CIVIL' || org?.tipo?.value == 'ASOCIACION_CIVIL' ? 'checked' : ''}>
            ASOCIACION CIVIL
          </option>
          <option value="ASOCIACION_SIMPLE" ${command?.tipo?.value == 'ASOCIACION_SIMPLE' || org?.tipo?.value == 'ASOCIACION_SIMPLE' ? 'checked' : ''}>
            ASOCIACION SIMPLE
          </option>
        </select>
      </div>

      <div class="form-group">
        <label for="objeto"><g:message code="perfil.objeto.label"/>*</label>
        <textarea id="objeto" name="objeto" rows="3" class="form-control" required pattern=".{10,5000}" maxlength="5000"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.objeto.size.error')}">${command?.objeto ?: org.objeto}</textarea>
      </div>

      <div class="form-group">
        <div class="col-lg-3 col-md-3 col-xs-6">
          <label for="calle"><g:message code="perfil.calle.label"/>*</label>
          <input id="calle" name="domicilio.calle" class="form-control" type="text" pattern=".{3,100}" required
              value="${command?.domicilio?.calle ?: org?.domicilio?.calle}">
        </div>

        <div class="col-lg-2 col-md-3 col-xs-6">
          <label for="numero"><g:message code="perfil.numero.label"/>*</label>
          <input id="numero" name="domicilio.numero" class="form-control" type="text" pattern=".{1,5}" required
              value="${command?.domicilio?.numero ?: org?.domicilio?.numero}">
        </div>

        <div class="col-lg-2 col-md-3 col-xs-6">
          <label for="piso"><g:message code="perfil.piso.label"/></label>
          <input id="piso" name="domicilio.piso" class="form-control" type="number"
              value="${command?.domicilio?.piso ?: org?.domicilio?.piso}">
        </div>

        <div class="col-lg-2 col-md-3 col-xs-6">
          <label for="departamento" class="visible-xs-block">
            <g:message code="perfil.departamento.label"/></label>
          <label for="departamento" class="hidden-xs">
            <g:message code="perfil.departamento.full.label"/>
          </label>
          <input id="departamento" name="domicilio.departamento" class="form-control" type="text" pattern=".{1}"
              value="${command?.domicilio?.departamento ?: org?.domicilio?.departamento}">
        </div>

        <div class="col-lg-3 col-md-3 col-sm-6">
          <label for="barrio"><g:message code="perfil.barrio.label"/>*</label>
          <input id="barrio" name="domicilio.barrio" class="form-control" type="text" pattern=".{3,100}" required
              value="${command?.domicilio?.barrio ?: org?.domicilio?.barrio}">
        </div>

        <div class="col-lg-3 col-md-3 col-sm-6">
          <label for="distrito"><g:message code="perfil.distrito.label"/></label>
          <input id="distrito" name="domicilio.distrito" class="form-control" type="text" pattern=".{3,100}"
              value="${command?.domicilio?.distrito ?: org?.domicilio?.distrito}">
        </div>

        <div class="col-lg-3 col-md-6">
          <label for="localidad"><g:message code="perfil.localidad.label"/>*</label>
          <input id="localidad" name="domicilio.localidad" class="form-control" type="text" pattern=".{3,100}" required
              value="${command?.domicilio?.localidad ?: org?.domicilio?.localidad}">
        </div>

        <div class="col-lg-3 col-md-6">
          <label for="provincia"><g:message code="perfil.provincia.label"/>*</label>
          <input id="provincia" name="domicilio.provincia" class="form-control" type="text" pattern=".{3,100}" required
              value="${command?.domicilio?.provincia ?: org?.domicilio?.provincia}">
        </div>

        <div class="col-lg-3 col-md-6">
          <label for="pais"><g:message code="perfil.pais.label"/>*</label>
          <input id="pais" name="domicilio.pais" class="form-control" type="text" pattern=".{3,100}" required
              value="${command?.domicilio?.pais ?: org?.domicilio?.pais}">
        </div>

      </div>
    </div>

    <div class="panel-footer text-right">
      <button type="submit" class="btn btn-primary"><g:message code="label.guardar"/></button>
    </div>

  </div>
</g:form>
