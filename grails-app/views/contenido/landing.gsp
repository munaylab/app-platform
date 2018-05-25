<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>

  <g:render template="/components/forms/imagen_form"/>
  <g:render template="/components/forms/imagen_upload"/>
</head>
<body>
  <br>

  <g:render template="/components/panel_resumen"/>

  <g:hasErrors bean="${command}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${command}" />
    </div>
  </g:hasErrors>

  <g:hasErrors bean="${landing}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${landing}" />
    </div>
  </g:hasErrors>

  <div class="row">
    <div class="col-lg-12">

      <div class="panel panel-default">
        <div class="panel-heading">
          <h4><g:message code="contenido.landing.modificar"/></h4>
        </div>

        <g:form name="landing" action="guardarLanding" useToken="true" enctype="multipart/form-data">
        <g:hiddenField name="orgId" value="${org.id}" />
          <g:hiddenField name="id" value="${landing?.id ?: command?.id}" />

          <div class="panel-body">

            <div class="form-group">
              <label for="titulo"> <g:message code="contenido.landing.titulo"/>* </label>
              <input type="text" class="form-control" name="titulo" required
                  value="${command?.titulo ?: landing?.titulo}"
                  placeholder="${g.message(code:'contenido.landing.titulo')}">
            </div>

            <div class="form-group">
              <label for="imagen">
                <g:message code="contenido.landing.imagen"/>
              </label>
              <imagen-form link="${command?.imagenLink ?: landing?.imagenLink}">
                <div slot="link">
                  <input type="hidden" name="imagen.accion" value="none">
                  <input type="url" class="form-control" name="imagenLink"
                      value="${command?.imagenLink ?: landing?.imagenLink}"
                      placeholder="${g.message(code:'contenido.landing.imagenLink')}">
                </div>
                <div slot="archivo">
                  <imagen id="${landing?.imagen?.id}" name="imagen" value="${landing?.imagen?.nombre}"
                      link="${g.fileLink(file: landing?.imagen)}"></imagen>
                </div>
              </imagen-form>
            </div>

            <div class="form-group">
              <label> <g:message code="contenido.landing.articulo"/> </label>
              <g:selectArticulos name="contenidoId" class="form-control"
                  noitem="${g.message(code:'contenido.landing.articulo.select')}"
                  org="${org}" value="${command?.contenidoId ?: landing?.contenido?.id}"/>
            </div>
          </div>

          <div class="panel-footer text-right">
              <button type="submit" class="btn btn-primary">
                <g:message code="label.aceptar"/>
              </button>
              <g:link controller="menu" class="btn btn-default">
                <g:message code="label.cancelar"/>
              </g:link>
          </div>

        </g:form>

      </div>
    </div>
  </div>

</body>
</html>
