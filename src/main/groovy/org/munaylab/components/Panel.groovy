package org.munaylab.components

class Panel {
    String icon
    String style
    String name
    String value
    String link
}

class PanelOrganizaciones extends Panel {
    PanelOrganizaciones() {
        icon = 'fa-users'
        style = 'panel-primary'
    }
}

class PanelVoluntarios extends Panel {
    PanelVoluntarios() {
        icon = 'fa-users'
        style = 'panel-primary'
    }
}

class EventsPanel extends Panel {
    EventsPanel() {
        icon = 'fa-calendar-check-o'
        style = 'panel-green'
    }
}

class MessagesPanel extends Panel {
    MessagesPanel() {
        icon = 'fa-envelope'
        style = 'panel-yellow'
    }
}

class StatePanel extends Panel {
    StatePanel() {
        icon = 'fa-line-chart'
        style = 'panel-red'
    }
}
