<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <!-- The title tag shows in email notifications, like Android 4.4. -->
  <title><g:layoutTitle default="MunayLab"/></title>
  <g:render template="/email/templates/head_mailtemplate"/>
  <g:layoutHead/>
</head>
<body width="100%" bgcolor="#222222" style="margin: 0; mso-line-height-rule: exactly;">
  <center style="width: 100%; background: #F7F7F7;">

    <!-- Visually Hidden Preheader Text : BEGIN -->
    <div style="display:none;font-size:1px;line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden;mso-hide:all;font-family: sans-serif;">
      <g:pageProperty name="mail.preview"/>
      <!-- <g:message code="mail.confirmacion.preview" arg="['${token}']" /> -->
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
      <g:layoutBody/>
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
