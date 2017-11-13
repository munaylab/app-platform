<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <!-- The title tag shows in email notifications, like Android 4.4. -->
  <title><g:message code="mail.confirmacion.titulo"/></title>
  <g:render template="/email/templates/head_mailtemplate"/>
</head>
<body width="100%" bgcolor="#222222" style="margin: 0; mso-line-height-rule: exactly;">
  <center style="width: 100%; background: #F7F7F7;">

    <!-- Visually Hidden Preheader Text : BEGIN -->
    <div style="display:none;font-size:1px;line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden;mso-hide:all;font-family: sans-serif;">
      <g:message code="mail.welcome.preview" />
    </div>
    <!-- Visually Hidden Preheader Text : END -->

    <!--
      Set the email width. Defined in two places:
      1. max-width for all clients except Desktop Windows Outlook, allowing the email to squish on narrow but never go wider than 600px.
      2. MSO tags for Desktop Windows Outlook enforce a 600px width.
    -->
    <div style="max-width: 600px; margin: auto;">
      <!--[if mso]>
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" align="center">
      <tr>
      <td>
      <![endif]-->

      <!-- Email Header : BEGIN -->
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 600px;">
        <tr>
          <td style="padding: 20px 0; text-align: center">
            <img src="http://placehold.it/200x50" width="600" height="50" alt="alt_text" border="0" style="height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
          </td>
        </tr>
      </table>
      <!-- Email Header : END -->

      <!-- Email Body : BEGIN -->
      <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 600px;">
        <!-- Codigo de confirmacion : BEGIN -->
        <tr>
          <td bgcolor="#ffffff">
            <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
              <tr>
                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                  Confirma tu dirección de correo electrónico para poder acceder a tu cuenta y recibir información importante.
                  <br><br>
                  Escribe el siguiente código en la web para finalizar el registro:
                  <br><br><br>
                  <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                      <tr>
                          <td style="border-radius: 3px; text-align: center; font-size: 45px;" class="button-td">
                              672834
                          </td>
                      </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <!-- Codigo de confirmacion : END -->
        <!-- Verificacion automática : BEGIN -->
        <tr>
          <td bgcolor="#ffffff">
            <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
              <tr>
                <td style="padding: 0 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                  ¿No funcionó? Haz clic en el siguiente botón para verificar automáticamente tu dirección de correo electrónico:
                  <br><br>
                  <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                    <tr>
                      <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                        <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                          <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;Confirmar email&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
        <!-- Verificacion automática : END -->
      </table>
      <!-- Email Body : END -->

      <g:render template="/email/templates/footer_mailtemplate"/>

      <!--[if mso]>
      </td>
      </tr>
      </table>
      <![endif]-->
    </div>
  </center>
</body>
</html>
