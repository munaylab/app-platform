<div class="panel panel-default">
  <div class="panel-heading">
    <g:message code="perfil.miembros.titulo"/>
    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#agregarMiembro">
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

<div class="modal fade" id="agregarMiembro" tabindex="-1" role="dialog" aria-labelledby="miembroLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="${g.message(code: 'label.cerrar')}">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="miembroLabel">
          <g:message code="perfil.miembros.modal.titulo"/>
        </h4>
      </div>

      <div class="modal-body">
        <div class="panel panel-default">
          <div class="panel-heading">
            <g:message code="perfil.miembros.modal.existente.titulo"/>
          </div>
          <div class="panel-body">

            <div class="input-group">
              <input type="text" class="form-control" aria-describedby="buscarMiembroLabel"
                  placeholder="${g.message(code: 'perfil.miembros.modal.buscar.placeholder')}">
              <span class="input-group-btn" id="buscarMiembroLabel">
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
            <g:message code="perfil.miembros.modal.nuevo.titulo"/>
          </div>
          <div class="panel-body">

            <div class="form-group">

              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="nombreMiembro">
                  <g:message code="perfil.miembros.modal.nombre.label"/>*
                </label>
                <input id="nombreMiembro" name="nombre" class="form-control" type="text" required
                    pattern=".{3,50}" title="${g.message(code: 'org.munaylab.osc.RegistroCommand.nombre.size.error')}"/>
              </div>

              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="apellidoMiembro">
                  <g:message code="perfil.miembros.modal.nombre.label"/>*
                </label>
                <input id="apellidoMiembro" name="apellido" class="form-control" type="text" required
                    pattern=".{3,30}" title="${g.message(code: 'org.munaylab.osc.RegistroCommand.apellido.size.error')}"/>
              </div>

              <div class="col-lg-4 col-md-4 col-sm-6">
                <label for="emailMiembro">
                  <g:message code="perfil.miembros.modal.nombre.label"/>*
                </label>
                <input id="emailMiembro" name="email" class="form-control" type="email" required/>
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
