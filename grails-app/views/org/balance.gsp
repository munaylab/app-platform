<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="org"/>
    <title>Balance</title>

</head>
<body>
  <g:render template="/components/panel"/>

  <div class="row">
    <div class="col-lg-8">
      <g:render template="/components/volunteers-panel"/>
      <g:render template="/components/state-panel"/>
    </div>
    <div class="col-lg-4">
      <g:render template="/components/notification-panel"/>
      <g:render template="/components/messages-panel"/>
    </div>
  </div>
</body>
</html>
