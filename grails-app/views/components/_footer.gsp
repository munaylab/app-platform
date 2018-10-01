<aside class="bg-dark" id="contacto">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 mx-auto text-center">
        <h2 class="section-heading">Contacto</h2>
        <hr class="primary">
        <p>Si tienes alguna consulta o propuesta contáctanos por cualquiera de estos medios:</p>
      </div>
    </div>
    <div class="row hidden-xs">
      <div class="btn-group btn-block" role="group">
        <a href="tel:${g.message(code:'contacto.celular')}" class="btn btn-primary col-sm-3 text-center">
            <i class="fa fa-phone fa-2x"></i>
            <p><g:message code="contacto.celular"/></p>
        </a>
        <a href="mailto:${g.message(code:'contacto.email')}" class="btn btn-primary col-sm-3 text-center">
          <i class="fa fa-envelope-o fa-2x"></i>
          <p><g:message code="contacto.email"/></p>
        </a>
        <a href="${g.message(code:'contacto.facebook.url')}" class="btn btn-primary col-sm-3 text-center">
          <i class="fa fa-facebook fa-2x"></i>
          <p><g:message code="contacto.facebook.titulo"/></p>
        </a>
        <a href="${g.message(code:'contacto.twitter.url')}" class="btn btn-primary col-sm-3 text-center">
          <i class="fa fa-twitter fa-2x"></i>
          <p><g:message code="contacto.twitter.titulo"/></p>
        </a>
      </div>
    </div>
    <div class="row visible-xs-block">
      <a href="tel:${g.message(code:'contacto.celular')}" class="col-xs-8 text-center">
          <i class="fa fa-phone fa-2x"></i>
          <p><g:message code="contacto.celular"/></p>
      </a>
      <a href="${g.message(code:'contacto.facebook.url')}" class="col-xs-4 text-center">
        <i class="fa fa-facebook fa-2x"></i>
        <p><g:message code="contacto.facebook.titulo"/></p>
      </a>
    </div>
    <div class="row visible-xs-block">
      <a href="mailto:${g.message(code:'contacto.email')}" class="col-xs-8 text-center">
        <i class="fa fa-envelope-o fa-2x"></i>
        <p><g:message code="contacto.email"/></p>
      </a>
      <a href="${g.message(code:'contacto.twitter.url')}" class="col-xs-4 text-center">
        <i class="fa fa-twitter fa-2x"></i>
        <p><g:message code="contacto.twitter.titulo"/></p>
      </a>
    </div>
  </div>
</aside>
