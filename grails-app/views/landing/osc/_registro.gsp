<%@ page import="org.munaylab.osc.TipoOrganizacion" %>

<section id="registro" class="bg-primary">

  <div class="container">
    <div class="row text-center">
      <div class="col-lg-12">
        <h2 class="section-heading">
          <g:message code="main.org.registro.full"/>
        </h2>
        <hr class="light">
      </div>
      <p><g:message code="main.org.registro.descripcion"/></p>
    </div>
  </div>

  <div class="container">
    <g:form controller="org" action="registro" method="POST" useToken="true">
      <g:hasErrors bean="${obj}">
        <div class="alert alert-danger" role="alert">
          <g:eachError>
            <p>&times; <g:message error="${it}"/></p>
          </g:eachError>
        </div>
      </g:hasErrors>
      <g:if test="${error}">
        <div class="alert alert-danger" role="alert">
          <label>&times; <g:message code="${error}"/></label>
        </div>
      </g:if>

      <div class="form-group ${hasErrors(bean:obj, field:'denominacion', 'has-error')}">
        <label for="denominacion">
          <g:message code="main.org.registro.nombre.label"/>:
        </label>
        <input id="denominacion" name="denominacion" class="form-control" type="text" required
            pattern=".{3,200}" value="${obj?.denominacion}"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.denominacion.size.error')}"
            placeholder="${g.message(code:'main.org.registro.nombre.placeholder')}"/>
      </div>

      <div class="form-group ${hasErrors(bean:obj, field:'tipo', 'has-error')}">
        <label for="tipo">
          <g:message code="main.org.registro.tipo.label"/>:
        </label>
        <select id="tipo" name="tipo" class="form-control" required>
          <option value="" selected disabled>Seleccionar</option>
          <option value="FUNDACION" ${obj?.tipo == TipoOrganizacion.FUNDACION ? 'selected' : ''}>
            <g:message code="main.org.registro.tipo.valor1"/>
          </option>
          <option value="ASOCIACION_CIVIL" ${obj?.tipo == TipoOrganizacion.ASOCIACION_CIVIL ? 'selected' : ''}>
            <g:message code="main.org.registro.tipo.valor2"/>
          </option>
          <option value="ASOCIACION_SIMPLE" ${obj?.tipo == TipoOrganizacion.ASOCIACION_SIMPLE ? 'selected' : ''}>
            <g:message code="main.org.registro.tipo.valor3"/>
          </option>
        </select>
      </div>

      <div class="form-group ${hasErrors(bean:obj, field:'objeto', 'has-error')}">
        <label for="objeto">
          <g:message code="main.org.registro.objeto.label"/>:
        </label>
        <textarea id="objeto" name="objeto" rows="3" class="form-control" required pattern=".{10,500}" maxlength="500"
            title="${g.message(code: 'org.munaylab.osc.RegistroCommand.objeto.size.error')}">${obj?.objeto}</textarea>
      </div>

      <div class="form-group">
        <label for="nombre">
          <g:message code="main.org.registro.representante.label"/>:
        </label>
        <div class="row">
          <div class="col-sm-6 ${hasErrors(bean:obj, field:'nombre', 'has-error')}">
            <input id="nombre" name="nombre" class="form-control" type="text" required
                value="${obj?.nombre}" pattern=".{3,50}"
                title="${g.message(code: 'org.munaylab.osc.RegistroCommand.nombre.size.error')}"
                placeholder="${g.message(code: 'main.org.registro.representante.nombre')}"/>
          </div>
          <div class="col-sm-6 ${hasErrors(bean:obj, field:'apellido', 'has-error')}">
            <input id="apellido" name="apellido" class="form-control" type="text" required
                value="${obj?.apellido}" pattern=".{3,30}"
                title="${g.message(code: 'org.munaylab.osc.RegistroCommand.apellido.size.error')}"
                placeholder="${g.message(code: 'main.org.registro.representante.apellido')}"/>
          </div>
        </div>
      </div>

      <div class="form-group">
        <div class="row">
          <div class="col-sm-6 ${hasErrors(bean:obj, field:'email', 'has-error')}">
            <input id="email" name="email" class="form-control" type="email" required
                value="${obj?.email}" placeholder="${g.message(code: 'main.org.registro.representante.email')}"/>
          </div>
          <div class="col-sm-6 ${hasErrors(bean:obj, field:'telefono', 'has-error')}">
            <input id="telefono" name="telefono" class="form-control" type="text" required
                value="${obj?.telefono}" pattern=".{3,15}"
                title="${g.message(code: 'org.munaylab.osc.RegistroCommand.telefono.size.error')}"
                placeholder="${g.message(code: 'main.org.registro.representante.telefono')}"/>
          </div>
        </div>
      </div>

      <div class="form-group">
        <button type="submit" class="btn btn-default btn-xl page-scroll pull-right">
          <g:message code="main.org.registro.boton"/>
        </button>
      </div>

    </g:form>
  </div>

</section>
