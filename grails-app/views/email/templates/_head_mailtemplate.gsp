<!-- utf-8 works for most cases -->
<meta charset="utf-8">
<!-- Forcing initial-scale shouldn't be necessary -->
<meta name="viewport" content="width=device-width">
<!-- Use the latest (edge) version of IE rendering engine -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Disable auto-scale in iOS 10 Mail entirely -->
<meta name="x-apple-disable-message-reformatting">

<!-- Web Font / @font-face : BEGIN -->
<!-- NOTE: If web fonts are not required, lines 10 - 27 can be safely removed. -->

<!-- Desktop Outlook chokes on web font references and defaults to Times New Roman, so we force a safe fallback font. -->
<!--[if mso]>
    <style>
        * {
            font-family: sans-serif !important;
        }
    </style>
<![endif]-->

<!-- All other clients get the webfont reference; some will render the font and others will silently fail to the fallbacks. More on that here: http://stylecampaign.com/blog/2015/02/webfont-support-in-email/ -->
<!--[if !mso]><!-->
    <!-- insert web font reference, eg: <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'> -->
<!--<![endif]-->

<!-- Web Font / @font-face : END -->

  <!-- CSS Reset -->
<style>

    /* What it does: Remove spaces around the email design added by some email clients. */
    /* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
    html,
    body {
        margin: 0 auto !important;
        padding: 0 !important;
        height: 100% !important;
        width: 100% !important;
    }

    /* What it does: Stops email clients resizing small text. */
    * {
        -ms-text-size-adjust: 100%;
        -webkit-text-size-adjust: 100%;
    }

    /* What is does: Centers email on Android 4.4 */
    div[style*="margin: 16px 0"] {
        margin:0 !important;
    }

    /* What it does: Stops Outlook from adding extra spacing to tables. */
    table,
    td {
        mso-table-lspace: 0pt !important;
        mso-table-rspace: 0pt !important;
    }

    /* What it does: Fixes webkit padding issue. Fix for Yahoo mail table alignment bug. Applies table-layout to the first 2 tables then removes for anything nested deeper. */
    table {
        border-spacing: 0 !important;
        border-collapse: collapse !important;
        table-layout: fixed !important;
        margin: 0 auto !important;
    }
    table table table {
        table-layout: auto;
    }

    /* What it does: Uses a better rendering method when resizing images in IE. */
    img {
        -ms-interpolation-mode:bicubic;
    }

    /* What it does: A work-around for iOS meddling in triggered links. */
    .mobile-link--footer a,
    a[x-apple-data-detectors] {
        color:inherit !important;
        text-decoration: underline !important;
    }

    /* What it does: Prevents underlining the button text in Windows 10 */
    .button-link {
        text-decoration: none !important;
    }

</style>

<!-- Progressive Enhancements -->
<style>

    /* What it does: Hover styles for buttons */
    .button-td,
    .button-a {
        transition: all 100ms ease-in;
    }
    .button-td:hover,
    .button-a:hover {
        background: #555555 !important;
        border-color: #555555 !important;
    }

</style>
