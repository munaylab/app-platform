<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="empty"/>
  <title><g:message code="label.plataforma.full"/></title>
</head>
<body>

  <header>
    <div class="header-content">
      <div class="header-content-inner">

        <div class="row login-form">
          <div class="col-sm-12">
            <div class="col-sm-12">
              <h2><g:message code="confirmacion.titulo"/></h2>
              <hr class="left">
              <p><g:message code="confirmacion.descripcion"/></p>
              <g:hasErrors bean="${obj}">
                <div class="alert alert-danger" role="alert">
                  <g:eachError>
                    <span>&times; <g:message error="${it}"/></span><br>
                  </g:eachError>
                </div>
              </g:hasErrors>
              <g:if test="${error}">
                <div class="alert alert-danger" role="alert">
                  <label>&times; <g:message code="${error}"/></label>
                </div>
              </g:if>
            </div>
          </div>

          <g:form controller="org" action="confirmacion" method="POST" useToken="true" autocomplete="off">
            <input type="hidden" name="refId" value="${adminId}">
            <div class="col-sm-12">
              <div class="col-sm-4 col-sm-offset-4">
                  <div class="form-group">
                    <input id="codigo" name="codigo" class="form-control" type="text" required
                        placeholder="${g.message(code: 'confirmacion.placeholder')}"/>
                  </div>
                  <br>
              </div>
            </div>

            <div class="col-sm-12">
              <div class="col-sm-12">
                <p><g:message code="confirmacion.password.titulo"/></p>
              </div>
              <div class="col-sm-4 col-sm-offset-4">
                  <div class="form-group">
                    <input name="password1" class="form-control" type="password" required
                        placeholder="${g.message(code:'confirmacion.password.1')}"/>
                  </div>
                  <div class="form-group">
                    <input name="password2" class="form-control" type="password" required
                        placeholder="${g.message(code:'confirmacion.password.2')}"/>
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

</body>
</html>
