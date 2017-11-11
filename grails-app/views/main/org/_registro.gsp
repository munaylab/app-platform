<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Registro</h4>
      </div>
      <div class="modal-body">
        <g:form controller="org" action="registro" method="POST">
          <div class="form-group">
            <label for="denominacion">Denominación:</label>
            <input id="denominacion" name="denominacion" class="form-control" type="text" placeholder="Nombre de la Organización"/>
          </div>
          <div class="form-group">
            <label for="">Tipo de Organización:</label>
            <div class="checkbox">
              <label class="col-md-3"><input type="checkbox" name="tipo" value="FUNDACION"> Fundación</label>
              <label class="col-md-4"><input type="checkbox" name="tipo" value="ASOCIACION_CIVIL"> Asociación Civil</label>
              <label class="col-md-5"><input type="checkbox" name="tipo" value="ASOCIACION_SIMPLE"> Asociación Simple</label>
            </div>
          </div>
          <div class="form-group">
            <label for="objeto">Objeto Social:</label>
            <textarea id="objeto" name="objeto" rows="3" class="form-control"></textarea>
          </div>
          <div class="form-group">
            <label for="nombre">Datos del Representante:</label>
            <div class="row">
              <div class="col-md-6">
                <input id="nombre" name="nombre" class="form-control" type="text" placeholder="Nombre" required/>
              </div>
              <div class="col-md-6">
                <input id="apellido" name="apellido" class="form-control" type="text" placeholder="Apellido" required/>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <input id="email" name="email" class="form-control" type="email" placeholder="Email" required/>
              </div>
              <div class="col-md-6">
                <input id="telefono" name="telefono" class="form-control" type="text" placeholder="Teléfono" required/>
              </div>
            </div>
          </div>
          <div class="form-group">
            <!-- <button id="prev" type="button" class="btn btn-primary btn-xl page-scroll pull-left" style="display: none">Anterior</button> -->
            <button type="submit" class="btn btn-primary btn-xl page-scroll pull-right">Continuar</button>
          </div>
        </g:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Enviar</button>
      </div>
    </div>
  </div>
</div>
