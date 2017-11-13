<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="layout" content="mail"/>
  <title><g:message code="mail.confirmacion.titulo"/></title>
</head>
<body>
  <g:pageProperty name="mail.preview">
    <g:message code="mail.confirmacion.preview" arg="['${token}']" />
  </g:pageProperty>

  <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 600px;">
    <!-- Codigo de confirmacion : BEGIN -->
    <tr>
      <td bgcolor="#ffffff">
        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
          <tr>
            <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
              <g:message code="mail.confirmacion.descripcion"/>
              <br><br>
              <g:message code="mail.confirmacion.code"/>:
              <br><br><br>
              <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                  <tr>
                      <td style="border-radius: 3px; text-align: center; font-size: 45px;" class="button-td">
                          ${token}
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
              <g:message code="mail.confirmacion.link"/>
              <br><br>
              <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                <tr>
                  <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                    <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                      <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;<g:message code="mail.confirmacion.boton"/>&nbsp;&nbsp;&nbsp;&nbsp;</span>
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

</body>
</html>
