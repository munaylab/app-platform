<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-bar-chart-o fa-fw"></i> Pendientes
  </div>
  <div class="panel-body">

    <g:if test="${pendientes}">
      <div class="table-responsive scrollable">
        <table class="table table-bordered table-hover table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Nombre</th>
              <th>Dirección</th>
              <th>Fecha</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <g:each var="org" in="${pendientes}">
              <tr>
                <td>${org.id}</td>
                <td>${org.nombre}</td>
                <td>${org.direccion}</td>
                <td><g:formatDate format="dd/MM/yyyy hh:ss" date="${org.dateCreated}"/></td>
                <td><input type="checkbox"></td>
              </tr>
            </g:each>
          </tbody>
        </table>
      </div>
      <div class="pull-right">
        <button type="submit" class="btn btn-primary">Activar</button>
      </div>
    </g:if>

    <g:else>
      <div class="text-center">
        <i class="fa fa-info-circle" aria-hidden="true"></i>
        <p>
          <em>
            No hay organizaciones pendientes de registrar
          </em>
        </p>
      </div>
    </g:else>

  </div>
</div>
