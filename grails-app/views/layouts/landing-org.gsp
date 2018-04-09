<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="robots" content="noindex,follow">
  <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
  <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
  <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

  <meta name="description" content="">
  <meta name="author" content="team@munaylab.org">
  <title><g:layoutTitle default="MunayLab"/></title>

  <asset:stylesheet src="css/bootstrap.min.css"/>
  <asset:stylesheet src="css/font-awesome.min.css"/>
  <asset:stylesheet src="css/googlefonts-OpenSans.css"/>
  <asset:stylesheet src="css/googlefonts-Merriweather.css"/>
  <asset:stylesheet src="css/landing.min.css"/>

  <asset:javascript src="jquery.min.js"/>
  <asset:javascript src="bootstrap.min.js"/>
  <asset:javascript src="scrollreveal.min.js"/>
  <asset:javascript src="jquery.easing.min.js"/>
  <asset:javascript src="landing.min.js"/>

  <g:layoutHead/>

</head>

<body id="page-top">

  <g:render template="/components/nav"
      model="[verBeneficio: true, verRegistroOsc: true, verFAQ: true, verContacto: true]"/>

  <g:layoutBody/>

  <g:render template="/org/components/beneficios"/>

  <g:render template="/org/components/registro"/>

  <g:render template="/org/components/faq"/>

  <g:render template="/components/login"/>

  <g:render template="/components/footer"/>
</body>

</html>
