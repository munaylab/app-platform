<div class="panel panel-default">
  <div class="panel-heading">
    <span class="visible-xs-inline">
      <g:message code="perfil.consejo.titulo"/>
    </span>
    <span class="hidden-xs">
      <g:message code="perfil.consejo.full.titulo"/>
    </span>
    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#agregarConsejo">
      <i class="fa fa-user-plus" aria-hidden="true"></i>
      <g:message code="label.agregar"/>
    </button>
  </div>
  <div class="panel-body">
    <div class="table-responsive">
      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th><g:message code="perfil.nombre.apellido"/></th>
            <th><g:message code="perfil.cargo"/></th>
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
        <button type="button" class="close" data-dismiss="modal" aria-label="${g.message(code: 'label.cerrar')}">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="consejoLabel">
          <g:message code="perfil.consejo.modal.titulo"/>
        </h4>
      </div>

      <div class="modal-body">
        <div class="panel panel-default">
          <div class="panel-heading">
            <g:message code="perfil.consejo.modal.existente.titulo"/>
          </div>
          <div class="panel-body">

            <div class="input-group">
              <input type="text" class="form-control" placeholder="Ingrese nombre, apellido o email" aria-describedby="buscarConsejoLabel">
              <span class="input-group-btn" id="buscarConsejoLabel">
                <button type="button" name="button" class="btn btn-default">
                  <i class="fa fa-search" aria-hidden="true"></i>
                  <g:message code="label.buscar"/>
                </button>
              </span>
            </div>

          </div>
          <div class="panel-footer text-right">
            <button type="button" class="btn btn-primary">
              <g:message code="label.agregar"/>
            </button>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <g:message code="perfil.consejo.modal.nuevo.titulo"/>
          </div>
          <div class="panel-body">

            <div class="form-group">
              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="nombre">
                  <g:message code="perfil.consejo.modal.nombre.label"/>
                </label>
                <input id="nombre" type="text" class="form-control">
              </div>
              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="apellido">
                  <g:message code="perfil.consejo.modal.apellido.label"/>
                </label>
                <input id="apellido" type="text" class="form-control">
              </div>
              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="email">
                  <g:message code="perfil.consejo.modal.email.label"/>
                </label>
                <input id="email" type="text" class="form-control">
              </div>
            </div>

          </div>
          <div class="panel-footer text-right">
            <button type="button" class="btn btn-primary">
              <g:message code="label.agregareinvitar"/>
            </button>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
