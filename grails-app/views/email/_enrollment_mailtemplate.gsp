<%@ page contentType="text/html"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><g:message code="mail.welcome.title"/></title> <!-- The title tag shows in email notifications, like Android 4.4. -->
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
                <!-- Introducción : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                                    Maecenas sed ante pellentesque, posuere leo id, eleifend dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent laoreet malesuada cursus. Maecenas scelerisque congue eros eu posuere. Praesent in felis ut velit pretium lobortis rhoncus ut&nbsp;erat.
                                    <br>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- Introducción : END -->
                <!-- Requisitos inscripción : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <img src="http://placehold.it/600x300" width="600" height="" alt="alt_text" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                                    Maecenas sed ante pellentesque, posuere leo id, eleifend dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent laoreet malesuada cursus. Maecenas scelerisque congue eros eu posuere. Praesent in felis ut velit pretium lobortis rhoncus ut&nbsp;erat.
                                    <br><br>
                                    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                                        <tr>
                                            <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                                                <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                                                    <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;A Button&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
                <!-- Requisitos inscripción : END -->
                <!-- Proceso de inscripción : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <img src="http://placehold.it/600x300" width="600" height="" alt="alt_text" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                                    Maecenas sed ante pellentesque, posuere leo id, eleifend dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent laoreet malesuada cursus. Maecenas scelerisque congue eros eu posuere. Praesent in felis ut velit pretium lobortis rhoncus ut&nbsp;erat.
                                    <br><br>
                                    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                                        <tr>
                                            <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                                                <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                                                    <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;A Button&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
                <!-- Proceso de inscripción : END -->
                <!-- TECNICATURA SUPERIOR EN GESTIÓN  AMBIENTAL : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <img src="http://placehold.it/600x300" width="600" height="" alt="alt_text" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                                    En este momento, donde la viabilidad del planeta y de sus especies se encuentra amenazada, la educación surge nuevamente como el mejor medio para superar los problemas sociales, económicos y ambientales existentes.  (Macedo 2006). La educación ambiental es un proceso que le permite al individuo comprender las relaciones de interdependencia con su entorno...
                                    <br><br>
                                    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                                        <tr>
                                            <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                                                <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                                                    <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;A Button&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
                <!-- TECNICATURA SUPERIOR EN GESTIÓN  AMBIENTAL : END -->
                <!-- Técnico Especialista en Reciclado : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <img src="http://placehold.it/600x300" width="600" height="" alt="alt_text" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                                    Cotidianamente se desechan en forma de basura elementos inorgánicos tales como  papel de distinto tipo, lapiceras, cartones, telas, bolsas plásticas, botellas plásticas y de vidrio, latas, mobiliario viejo, entre otros y orgánicos de toda clase.
                                    <br><br>
                                    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                                        <tr>
                                            <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                                                <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                                                    <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;A Button&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                    <br><br>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- Técnico Especialista en Reciclado : END -->
                <!-- Técnico Guarda Ambiental : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <img src="http://placehold.it/600x300" width="600" height="" alt="alt_text" border="0" align="center" style="width: 100%; max-width: 600px; height: auto; background: #dddddd; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;">
                                    Diariamente vemos como nuestras bellezas naturales, desde el punto de vista paisajístico, así como nuestros recursos naturales, se ven deteriorados por el mal uso de los mismos, el descuido indiscriminado del hacer humano. Es por ello que es necesario que haya de manera permanente quien los cuide o que señale a quienes usan nuestros recursos el modo correcto de manejar dichos recursos. Los pequeños gestos cuentan, la suma de voluntades es la única manera de cambiar el destino de nuestra provincia, de nuestro planeta.
                                    <br><br>
                                    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                                        <tr>
                                            <td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
                                                <a href="http://www.google.com" style="background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;" class="button-a">
                                                    <span style="color:#ffffff;" class="button-link">&nbsp;&nbsp;&nbsp;&nbsp;A Button&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                    <br><br>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- Técnico Guarda Ambiental : END -->
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
