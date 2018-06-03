<div class="panel panel-default">
  <div class="panel-heading">
    <g:message code="perfil.contacto.titulo"/>
    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#agregarContacto">
      <i class="fa fa-plus" aria-hidden="true"></i>
      <g:message code="label.agregar"/>
    </button>
  </div>
  <div class="panel-body">
    <div class="table-responsive">
      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th><g:message code="perfil.contacto.tipo.label"/></th>
            <th><g:message code="perfil.contacto.contacto.label"/></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <g:each in="${org.contactos}" var="contacto">
            <tr>
              <td>${contacto.tipo}</td>
              <td>${contacto.value}</td>
              <td>
                <a href="#">
                  <i class="fa fa-trash" aria-hidden="true"></i>
                </a>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
  </div>
</div>

<div class="modal fade" id="agregarContacto" tabindex="-1" role="dialog" aria-labelledby="miembroLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="miembroLabel">
          <g:message code="perfil.contacto.modal.titulo"/>
        </h4>
      </div>

      <div class="modal-body">
        <div class="input-group">
          <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="caret"></span>
              <span class="visible-xs-inline">
                <g:message code="perfil.contacto.modal.tipo.label"/>
              </span>
              <span class="hidden-xs">
                <g:message code="perfil.contacto.modal.tipo.full.label"/>
              </span>
            </button>
            <ul class="dropdown-menu">
              <li class="contacto-item">
                <i class="fa fa-fax" aria-hidden="true"></i>
                <g:message code="perfil.contacto.modal.fax.label"/>
              </li>
              <li class="contacto-item">
                <i class="fa fa-cloud" aria-hidden="true"></i>
                <g:message code="perfil.contacto.modal.web.label"/>
              </li>
              <li class="contacto-item">
                <i class="fa fa-at" aria-hidden="true"></i>
                <g:message code="perfil.contacto.modal.email.label"/>
              </li>
              <li class="contacto-item">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <g:message code="perfil.contacto.modal.telefono.label"/>
              </li>
              <li class="contacto-item">
                <i class="fa fa-mobile" aria-hidden="true"></i>
                <g:message code="perfil.contacto.modal.celular.label"/>
              </li>
            </ul>
          </div>
          <input id="valor" name="valor" class="form-control" type="text" required pattern=".{5,50}">
        </div>
      </div>
      <br>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
          <g:message code="label.cerrar"/>
        </button>
        <button type="button" class="btn btn-primary">
          <g:message code="label.agregar"/>
        </button>
      </div>

    </div>
  </div>
</div>
