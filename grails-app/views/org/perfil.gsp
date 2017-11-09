<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="org"/>
    <title>Perfil</title>

</head>
<body>
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
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">Dirección</div>
      <div class="panel-body">
        <div class="form-group">
          <div class="col-lg-2 col-md-3 col-sm-6">
            <label for="calle">Calle</label>
            <input id="calle" value="${org?.domicilio?.calle}" type="text" class="form-control">
          </div>
          <div class="col-lg-2 col-md-3 col-sm-6">
            <label for="numero">Numero</label>
            <input id="numero" value="${org?.domicilio?.numero}" type="text" class="form-control">
          </div>
          <div class="col-lg-2 col-md-3 col-sm-6">
            <label for="barrio">Barrio</label>
            <input id="barrio" value="${org?.domicilio?.barrio}" type="text" class="form-control">
          </div>
          <div class="col-lg-2 col-md-3 col-sm-6">
            <label for="distrito">Distrito</label>
            <input id="distrito" value="${org?.domicilio?.distrito}" type="text" class="form-control">
          </div>
          <div class="col-lg-2 col-md-6">
            <label for="localidad">Localidad</label>
            <input id="localidad" value="${org?.domicilio?.localidad}" type="text" class="form-control">
          </div>
          <div class="col-lg-2 col-md-6">
            <label for="provincia">Provincia</label>
            <input id="provincia" value="${org?.domicilio?.provincia}" type="text" class="form-control">
          </div>
        </div>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">Comisión</div>
      <div class="panel-body">
        <div class="table-responsive">
          <table class="table table-hover table-striped">
            <thead>
              <tr>
                <th>Nombre y Apellido</th>
                <th>Cargo</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <g:each in="${org.miembros}">
                <tr>
                  <td>${it.nombre} ${it.apellido}</td>
                  <td>${it.cargo}</td>
                  <td>-</td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </g:form>
</body>
</html>
