<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i> <g:message code="contenido.cabecera.lista"/>
  </div>

  <div class="panel-body">
    <g:if test="${menu}">
      <table class="table table-striped">
        <thead>
          <tr>
            <!--<th><g:message code="contenido.cabecera.prioridad"/></th>-->
            <th>#</th>
            <th><g:message code="contenido.cabecera.nombre"/></th>
            <th><g:message code="contenido.cabecera.titulo"/></th>
            <th><g:message code="contenido.cabecera.articulo"/></th>
          </tr>
        </thead>
        <tbody>
          <g:each var="item" in="${menu}" status="row">
            <tr>
              <td>${item.prioridad}</td>
              <td>
                <a href="${createLink(action: 'menu', id: item.id)}">${item.nombre}</a>
              </td>
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
