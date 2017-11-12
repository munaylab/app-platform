<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="main"/>
  <title><g:message code="label.plataforma.full"/></title>
</head>
<body>
  <header>
    <div class="header-content">
      <div class="header-content-inner">

        <div class="row">
          <div class="col-sm-12">
            <div class="col-sm-12 login-form">
              <h2><g:message code="login.titulo"/></h2>
              <hr class="left">
              <g:if test='${flash.message}'>
                <div class="alert alert-danger" role="alert">
                  ${flash.message}
                </div>
              </g:if>
              <p><g:message code="login.descripcion"/></p>
            </div>
          </div>

          <form action="/login/authenticate" method="POST" autocomplete="off">
            <div class="col-sm-12">
              <div class="col-sm-4 col-sm-offset-4">
                <div class="form-group">
                  <label for="username">
                    <g:message code="signin.username.label" />
                  </label>
                  <input type="email" class="form-control" id="username" required name="username"
                      placeholder="${g.message(code:'signin.username.placeholder')}">
                </div>
                <div class="form-group">
                  <label for="password">
                    <g:message code="signin.password.label" />
                  </label>
                  <input type="password" class="form-control" id="password" required name="password"
                      placeholder="********">
                </div>
                <br>
              </div>
            </div>

            <div class="col-sm-12 text-center">
              <button type="submit" name="button" class="btn btn-primary btn-xl">
                <g:message code="login.boton"/>
              </button>
            </div>
          </form>

          <div class="col-sm-12 login-form">
            <br>
            <p><a href="#"><g:message code="login.recuperar"/></a></p>
          </div>
        </div>

      </div>
    </div>
  </header>
</body>
</html>
