<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin"/>
  <title>${org.nombre} - <g:message code="contenido.cabecera"/></title>
</head>
<body>
  <br>

  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <div class="col-lg-12">

      <div class="panel panel-default">
        <div class="panel-heading">
          <i class="fa fa-list fa-fw"></i> <g:message code="contenido.cabecera.lista"/>
        </div>

        <div class="panel-body">
          <g:if test="${menu}">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th><g:message code="contenido.cabecera.nombre"/></th>
                  <th><g:message code="contenido.cabecera.prioridad"/></th>
                  <th><g:message code="contenido.cabecera.titulo"/></th>
                  <th><g:message code="contenido.cabecera.articulo"/></th>
                </tr>
              </thead>
              <tbody>
                <g:each var="item" in="${menu}" status="row">
                  <tr>
                    <th scope="row">${(row + 1)}</th>
                    <td>
                      <a href="${createLink(action: 'menu', id: item.id)}">${item.nombre}</a>
                    </td>
                    <td>${item.prioridad}</td>
                    <td>${item.nombre}</td>
                    <g:if test="${item.link}">
                      <td>${item.link}</td>
                    </g:if>
                    <g:else>
                      <td>${item.articulo.titulo}</td>
                    </g:else>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </g:if>
          <g:else>
            <div class="text-center">
              <i class="fa fa-list fa-3x" aria-hidden="true"></i>
              <p><i><g:message code="label.sindatos"/></i></p>
            </div>
          </g:else>
        </div>
      </div>

    </div>
    <div class="col-lg-4">
      <!-- <g:render template="/components/panel_notificaciones"/> -->
      <!-- <g:render template="/components/panel_mensajes"/> -->
    </div>
  </div>
</body>
</html>
