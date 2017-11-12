<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="main"/>

  <asset:javascript src="landing.min.js"/>
  <asset:stylesheet src="css/landing.min.css"/>
  <title><g:message code="label.plataforma.full"/></title>
</head>
<body>

  <g:render template="/landing/osc/nav"/>

  <header>
    <div class="header-content">
      <div class="header-content-inner">

        <div class="row">
          <div class="col-sm-12">
            <div class="col-sm-12">
              <h2><g:message code="confirmacion.titulo"/></h2>
              <hr class="left">
              <p><g:message code="confirmacion.descripcion"/></p>
            </div>
          </div>

          <g:form name="name" action="action">
            <div class="col-sm-12">
              <div class="col-sm-4 col-sm-offset-4">
                  <div class="form-group">
                    <input id="codigo" name="codigo" class="form-control" type="text" required
                        placeholder="${g.message(code: 'confirmacion.placeholder')}"/>
                  </div>
                  <br>
              </div>
            </div>

            <div class="col-sm-12 text-center">
              <button type="submit" name="button" class="btn btn-primary btn-xl">
                <g:message code="confirmacion.boton"/>
              </button>
            </div>
          </g:form>

        </div>

      </div>
    </div>
  </header>

  <g:render template="/landing/osc/beneficios"/>
  <g:render template="/landing/osc/registro"/>
  <g:render template="/landing/login"/>

</body>
</html>
