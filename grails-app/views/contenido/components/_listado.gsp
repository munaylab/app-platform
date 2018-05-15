<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i>
    Listado de Articulos
  </div>

  <div class="panel-body">
    <g:if test="${articulos}">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Titulo</th>
            <th>Autor</th>
            <th>Creado</th>
            <th>Modificado</th>
            <th>Estado</th>
          </tr>
        </thead>
        <tbody>
          <g:each var="articulo" in="${articulos}" status="row">
            <tr>
              <th scope="row">${(row + 1)}</th>
              <td>
                <a href="${createLink(action: 'show', id: articulo.id)}">${articulo.titulo}</a>
              </td>
              <td>${articulo.autor.username}</td>
              <td>${articulo.dateCreated.format('dd/MM/yyyy HH:mm')}</td>
              <td>${articulo.lastUpdated.format('dd/MM/yyyy HH:mm')}</td>
              <td>
                <g:if test="${articulo.publicado}">
                  <span class="label label-success">Publicado</span>
                </g:if>
                <g:else>
                  <span class="label label-warning">Borrador</span>
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
