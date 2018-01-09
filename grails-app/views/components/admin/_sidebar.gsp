
<template id="sidebar-template">

  <div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">

      <ul class="nav" id="side-menu">

        <li class="sidebar-search">
          <div class="input-group custom-search-form">
            <input type="text" class="form-control" disabled
                placeholder="${g.message(code: 'label.buscar')}..."/>
            <span class="input-group-btn">
              <button class="btn btn-default" type="button" disabled>
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
        </li>

        <li v-for="item in sidebarItems">

          <a v-bind:href="item.link" v-on:click="item.subitems ? desplegar(item, $event) : null">
            <i class="fa fa-fw" v-bind:class="item.icon"></i>
            {{item.titulo}}
            <span v-if="item.subitems" class="fa pull-right" v-bind:class="item.desplegable"></span>
          </a>

          <ul v-show="item.subitems && item.desplegado" class="nav nav-second-level">
            <li v-for="subitem in item.subitems">
              <a v-if="subitem.link" v-bind:href="subitem.link">
                <i class="fa fa-fw" v-bind:class="subitem.icon"></i>
                {{subitem.titulo}}
              </a>
              <a v-else href="#" data-toggle="modal" v-bind:data-target="subitem.modal">
                <i class="fa fa-fw" v-bind:class="subitem.icon"></i>
                {{subitem.titulo}}
              </a>
            </li>
          </ul>

        </li>

      </ul>
    </div>

  </div>
</template>

<g:render template="/org/components/agregarEgreso"/>
<g:render template="/org/components/agregarIngreso"/>
