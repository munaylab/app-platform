<script type="text/javascript">
var sidebarItems = [
  {
    icon: 'fa-dashboard',
    titulo: "${g.message(code: 'sidebar.dashboard')}",
    link: "${createLink(controller:'org', action: 'index')}"
  },
  {
    icon: 'fa-user',
    titulo: "${g.message(code: 'sidebar.perfil')}",
    link: "${createLink(controller:'org', action: 'perfil')}"
  },
  {
    icon: 'fa-users',
    titulo: "${g.message(code: 'sidebar.voluntarios')}",
    link: "${createLink(controller:'org', action: 'voluntarios')}"
  },
  {
    icon: 'fa-line-chart',
    titulo: "${g.message(code: 'admin.sidebar.balance.titulo')}",
    link: "${createLink(controller:'org', action: 'balance')}",
    desplegado: false,
    desplegable: 'fa-angle-down',
    subitems: [
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.balance.ingreso')}",
        modal: '#agregarIngreso'
      },
      {
        icon: 'fa-minus-circle',
        titulo: "${g.message(code: 'admin.sidebar.balance.egreso')}",
        modal: '#agregarEgreso'
      },
      {
        icon: 'fa-bar-chart',
        titulo: "${g.message(code: 'admin.sidebar.balance.estadistica')}",
        link: "${createLink(controller:'org', action: 'balance')}"
      }
    ]
  }
]

</script>
