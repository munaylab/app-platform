<%@ page contentType="text/html"%>
<g:applyLayout name="mail">

  <head>
    <title><g:message code="mail.bienvenida.titulo"/></title>
  </head>

  <content tag="preview">
    <g:message code="mail.preview.org.bienvenida" args="[user.nombre, org.nombre]"/>
  </content>

  <body>
    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 600px;">
      <!-- Mensaje bienvenida : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                Felicidades ${user.nombre}! Tu cuenta ya se encuentra activa y la organización ${org.nombre} está correctamente registrada. Enterate de los beneficios que brinda la plataforma Hampe:
                <br><br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Mensaje bienvenida : END -->

      <!-- Beneficio Perfil : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <img alt="${g.message(code: 'main.org.beneficio.perfil.titulo')}" src="http://placehold.it/600x300" width="600" height="" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                <g:message code="main.org.beneficio.perfil.descripcion"/>
                <br><br>
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                    <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                      <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                        <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Más Información&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      </a>
                    </td>
                  </tr>
                </table>
                <br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Beneficio Perfil : END -->

      <!-- Beneficio Planificacion : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <img alt="${g.message(code: 'main.org.beneficio.planificacion.titulo')}" src="http://placehold.it/600x300" width="600" height="" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                <g:message code="main.org.beneficio.planificacion.descripcion"/>
                <br><br>
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                    <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                      <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                        <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Más Información&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      </a>
                    </td>
                  </tr>
                </table>
                <br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Beneficio Planificacion : END -->

      <!-- Beneficio Eventos : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <img alt="${g.message(code: 'main.org.beneficio.eventos.titulo')}" src="http://placehold.it/600x300" width="600" height="" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                <g:message code="main.org.beneficio.eventos.descripcion"/>
                <br><br>
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                    <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                      <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                        <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Más Información&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      </a>
                    </td>
                  </tr>
                </table>
                <br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Beneficio Eventos : END -->

      <!-- Beneficio Balance : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <img alt="${g.message(code: 'main.org.beneficio.balance.titulo')}" src="http://placehold.it/600x300" width="600" height="" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                <g:message code="main.org.beneficio.balance.descripcion"/>
                <br><br>
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                    <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                      <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                        <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Más Información&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      </a>
                    </td>
                  </tr>
                </table>
                <br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Beneficio Balance : END -->

      <!-- Beneficio Articulos : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <img alt="${g.message(code: 'main.org.beneficio.articulos.titulo')}" src="http://placehold.it/600x300" width="600" height="" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                <g:message code="main.org.beneficio.articulos.descripcion"/>
                <br><br>
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                    <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                      <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                        <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Más Información&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      </a>
                    </td>
                  </tr>
                </table>
                <br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Beneficio Articulos : END -->

      <!-- Beneficio Voluntarios : BEGIN -->
      <tr>
        <td bgcolor="#ffffff">
          <img alt="${g.message(code: 'main.org.beneficio.voluntarios.titulo')}" src="http://placehold.it/600x300" width="600" height="" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff">
          <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
              <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                <g:message code="main.org.beneficio.voluntarios.descripcion"/>
                <br><br>
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                    <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                      <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                        <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Más Información&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      </a>
                    </td>
                  </tr>
                </table>
                <br>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Beneficio Voluntarios : END -->
    </table>
  </body>

</g:applyLayout>
