<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="admin-org"/>
    <title>Administración ${org.nombre}</title>
</head>
<body>
  <div class="row">
    <div class="col-lg-12">
      <!-- <span class="chat-img pull-left"><img src="http://placehold.it/40/55C1E7/fff" alt="avatar" class="img-circle" /></span> -->
      <h1 class="page-header">&nbsp;${org.nombre}</h1>
    </div>
  </div>
  <g:form name="organizacion" action="perfil" method="POST">
    <div class="panel panel-default">
      <div class="panel-heading">Datos</div>
      <div class="panel-body">
        <div class="form-group">
          <div class="col-lg-6">
            <label for="nombre">Nombre</label>
            <input id="nombre" value="${org.nombre}" type="text" class="form-control">
          </div>
          <div class="col-lg-6">
            <label for="fecha">Fecha Constitución</label>
            <input id="fecha" value="${org.fechaConstitucion}" type="text" class="form-control">
          </div>
          <div class="col-lg-12">
            <label for="objeto">Objeto</label>
            <textarea id="objeto" class="form-control" rows="3">${org.objeto}</textarea>
          </div>
        </div>
      </div>
      <div class="panel-footer text-right">
        <button type="button" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </g:form>

  <div class="panel panel-default">
    <div class="panel-heading">Dirección</div>
    <div class="panel-body">
      <div class="form-group">
        <div class="col-lg-3 col-md-3 col-xs-6">
          <label for="calle">Calle</label>
          <input id="calle" value="${org?.domicilio?.calle}" type="text" class="form-control">
        </div>
        <div class="col-lg-2 col-md-3 col-xs-6">
          <label for="numero">Numero</label>
          <input id="numero" value="${org?.domicilio?.numero}" type="text" class="form-control">
        </div>
        <div class="col-lg-2 col-md-3 col-xs-6">
          <label for="piso">Piso</label>
          <input id="piso" value="${org?.domicilio?.piso}" type="text" class="form-control">
        </div>
        <div class="col-lg-2 col-md-3 col-xs-6">
          <label for="departamento">Depto.</label>
          <input id="departamento" value="${org?.domicilio?.departamento}" type="text" class="form-control">
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
          <label for="barrio">Barrio</label>
          <input id="barrio" value="${org?.domicilio?.barrio}" type="text" class="form-control">
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
          <label for="distrito">Distrito</label>
          <input id="distrito" value="${org?.domicilio?.distrito}" type="text" class="form-control">
        </div>
        <div class="col-lg-3 col-md-6">
          <label for="localidad">Localidad</label>
          <input id="localidad" value="${org?.domicilio?.localidad}" type="text" class="form-control">
        </div>
        <div class="col-lg-3 col-md-6">
          <label for="provincia">Provincia</label>
          <input id="provincia" value="${org?.domicilio?.provincia}" type="text" class="form-control">
        </div>
        <div class="col-lg-3 col-md-6">
          <label for="pais">País</label>
          <input id="pais" value="${org?.domicilio?.pais}" type="text" class="form-control">
        </div>
      </div>
    </div>
    <div class="panel-footer text-right">
      <button type="button" class="btn btn-primary">Guardar</button>
    </div>
  </div>

  <g:render template="components/perfilContacto"/>

  <g:render template="components/perfilConsejo"/>

  <g:render template="components/perfilMiembro"/>

</body>
</html>
