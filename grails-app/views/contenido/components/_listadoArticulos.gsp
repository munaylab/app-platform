<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i>
    <g:message code="contenido.articulo.listado"/>
  </div>

  <div class="panel-body">
    <g:if test="${articulos}">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th><g:message code="contenido.articulo.titulo"/></th>
            <th><g:message code="contenido.articulo.autor"/></th>
            <th><g:message code="contenido.articulo.creado"/></th>
            <th><g:message code="contenido.articulo.modificado"/></th>
            <th><g:message code="contenido.articulo.estado"/></th>
          </tr>
        </thead>
        <tbody>
          <g:each var="articulo" in="${articulos}" status="row">
            <tr>
              <th scope="row">${(row + 1)}</th>
              <td>
                <a href="${createLink(action: 'articulo', id: articulo.id)}">${articulo.titulo}</a>
              </td>
              <td>${articulo.autor.username}</td>
              <td>${articulo.dateCreated.format('dd/MM/yy HH:mm')}</td>
              <td>${articulo.lastUpdated.format('dd/MM/yy HH:mm')}</td>
              <td>
                <g:if test="${articulo.publicado}">
                  <span class="label label-success">
                    <g:message code="contenido.articulo.publicado"/>
                  </span>
                </g:if>
                <g:else>
                  <span class="label label-warning">
                    <g:message code="contenido.articulo.borrador"/>
                  </span>
                </g:else>
              </td>
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
