<script type="text/javascript">
var sidebarItems = [
  {
    icon: 'fa-dashboard',
    titulo: "${g.message(code: 'sidebar.dashboard')}",
    link: "${createLink(controller:'admin', action: 'index')}"
  },
  {
    icon: 'fa-user',
    titulo: "${g.message(code: 'sidebar.perfil')}",
    link: "${createLink(controller:'admin', action: 'perfil')}"
  },
  {
    icon: 'fa-cubes',
    titulo: "${g.message(code: 'sidebar.contenido')}",
    link: "${createLink(controller:'contenido')}",
    desplegado: false,
    desplegable: 'fa-angle-down',
    subitems: [
      {
        icon: 'fa-bar-chart',
        titulo: "${g.message(code: 'admin.sidebar.contenido.listado')}",
        link: "${createLink(controller:'contenido')}",
      },
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.contenido.agregar')}",
        link: "${createLink(controller:'contenido', action:'articulo')}",
      },
      {
        icon: 'fa-bar-chart',
        titulo: "${g.message(code: 'admin.sidebar.contenido.listado')}",
        link: "${createLink(controller:'menu')}",
      },
    ]
  },
  {
    icon: 'fa-cubes',
    titulo: "${g.message(code: 'sidebar.planificacion')}",
    link: "${createLink(controller:'admin', action: 'planificacion')}",
    desplegado: false,
    desplegable: 'fa-angle-down',
    subitems: [
      {
        icon: 'fa-bar-chart',
        titulo: "${g.message(code: 'admin.sidebar.planificacion.estadistica')}",
        link: "${createLink(controller:'admin', action: 'planificacion')}"
      },
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.planificacion.agregar.programa')}",
        modal: '#agregarPrograma'
      },
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.planificacion.agregar.proyecto')}",
        modal: '#agregarProyecto'
      },
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.planificacion.agregar.actividad')}",
        modal: '#agregarActividad'
      },
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.planificacion.agregar.evento')}",
        link: "${createLink(controller:'admin', action: 'evento')}"
      }
    ]
  },
  /*{
    icon: 'fa-users',
    titulo: "${g.message(code: 'sidebar.voluntarios')}",
    link: "${createLink(controller:'admin', action: 'voluntarios')}"
  },
  {
    icon: 'fa-line-chart',
    titulo: "${g.message(code: 'admin.sidebar.balance.titulo')}",
    link: "${createLink(controller:'admin', action: 'balance')}",
    desplegado: false,
    desplegable: 'fa-angle-down',
    subitems: [
      {
        icon: 'fa-bar-chart',
        titulo: "${g.message(code: 'admin.sidebar.balance.estadistica')}",
        link: "${createLink(controller:'admin', action: 'balance')}"
      },
      {
        icon: 'fa-plus-circle',
        titulo: "${g.message(code: 'admin.sidebar.balance.ingreso')}",
        modal: '#agregarIngreso'
      },
      {
        icon: 'fa-minus-circle',
        titulo: "${g.message(code: 'admin.sidebar.balance.egreso')}",
        modal: '#agregarEgreso'
      }
    ]
  }*/
]

</script>
