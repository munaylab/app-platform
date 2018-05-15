<g:set var="nuevo" value="${!articulo?.id}" />
<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i>
    <g:if test="${nuevo}">
      Nuevo Articulo
    </g:if>
    <g:else>
      Modificar Articulo #${articulo.id}
    </g:else>
  </div>

  <div class="panel-body">
    <g:form name="articulo" action="update" useToken="true">
      <g:if test="${nuevo}">
        <g:hiddenField name="id" value="${articulo.id}" />
        <g:hiddenField name="autorId" value="${articulo.autor.id}" />
        <g:hiddenField name="orgId" value="${articulo.organizacion.id}" />
      </g:if>

      <div class="form-group">
        <label for="titulo">Titulo</label>
        <input type="text" class="form-control" id="titulo" placeholder="Titulo">
      </div>
      <div class="form-group">
        <label for="contenido">Contenido</label>
        <input type="text" class="form-control" id="contenido" placeholder="Contenido">
      </div>
      <div class="form-group">
        <label for="imagen">Imagen</label>
        <input type="text" class="form-control" id="imagen" placeholder="Imagen">
      </div>
      <div class="form-group">
        <label for="etiquetas">Etiquetas</label>
        <input type="text" class="form-control" id="etiquetas" placeholder="Etiquetas">
      </div>
      <div class="form-group">
        <label for="descripcion">Descripción</label>
        <input type="text" class="form-control" id="descripcion" placeholder="Descripcion">
      </div>
      <div class="checkbox">
        <label>
          <input type="checkbox"> Publicar
        </label>
      </div>
    </g:form>
  </div>
</div>
