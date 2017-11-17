<div class="panel panel-default">
  <div class="panel-heading">
    Contacto
    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#agregarContacto">
      <i class="fa fa-plus" aria-hidden="true"></i>
      Agregar
    </button>
  </div>
  <div class="panel-body">
    <div class="table-responsive">
      <table class="table table-hover table-striped">
        <thead>
          <tr>
            <th>Tipo</th>
            <th>Contacto</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Celular</td>
            <td>03884778400</td>
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

<div class="modal fade" id="agregarContacto" tabindex="-1" role="dialog" aria-labelledby="miembroLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="miembroLabel">
          Agregar Contacto
        </h4>
      </div>

      <div class="modal-body">
        <div class="input-group">
          <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="caret"></span> Tipo de contacto
            </button>
            <ul class="dropdown-menu">
              <li class="contacto-item">
                <i class="fa fa-fax" aria-hidden="true"></i> FAX
              </li>
              <li class="contacto-item">
                <i class="fa fa-cloud" aria-hidden="true"></i> Web
              </li>
              <li class="contacto-item">
                <i class="fa fa-at" aria-hidden="true"></i> Email
              </li>
              <li class="contacto-item">
                <i class="fa fa-phone" aria-hidden="true"></i> Teléfono
              </li>
              <li class="contacto-item">
                <i class="fa fa-mobile" aria-hidden="true"></i> Celular
              </li>
            </ul>
          </div><!-- /btn-group -->
          <input type="text" name="valor" value="" id="valor" class="form-control">
        </div><!-- /input-group -->
      </div>
      <br>
      <br>
      <br>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Agregar</button>
      </div>

    </div>
  </div>
</div>
