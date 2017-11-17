<div class="panel panel-default">
  <div class="panel-heading">
    <span class="visible-xs-block">Consejo</span>
    <span class="hidden-xs">Consejo de Administración</span>
    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#agregarConsejo">
      <i class="fa fa-user-plus" aria-hidden="true"></i>
      Agregar
    </button>
  </div>
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
          <tr>
            <td>Nombre Apellido</td>
            <td>-</td>
            <td>
              <a href="#">
                <i class="fa fa-trash" aria-hidden="true"></i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<div class="modal fade" id="agregarConsejo" tabindex="-1" role="dialog" aria-labelledby="consejoLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="consejoLabel">
          Agregar Miembro al Consejo Administrativo
        </h4>
      </div>

      <div class="modal-body">
        <div class="panel panel-default">
          <div class="panel-heading">Agregar Miembro Existente</div>
          <div class="panel-body">

            <div class="input-group">
              <input type="text" class="form-control" placeholder="Ingrese nombre, apellido o email" aria-describedby="buscarConsejoLabel">
              <span class="input-group-btn" id="buscarConsejoLabel">
                <button type="button" name="button" class="btn btn-default">
                  <i class="fa fa-search" aria-hidden="true"></i>
                  Buscar
                </button>
              </span>
            </div>

          </div>
          <div class="panel-footer text-right">
            <button type="button" class="btn btn-primary">Agregar</button>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">Agregar Miembro Nuevo</div>
          <div class="panel-body">

            <div class="form-group">
              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="nombre">Nombre</label>
                <input id="nombre" type="text" class="form-control">
              </div>
              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="apellido">Apellido</label>
                <input id="apellido" type="text" class="form-control">
              </div>
              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="email">Email</label>
                <input id="email" type="text" class="form-control">
              </div>
            </div>

          </div>
          <div class="panel-footer text-right">
            <button type="button" class="btn btn-primary">Agregar e invitar</button>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
