package org.munaylab

import org.munaylab.balance.Asiento
import org.munaylab.balance.AsientoCommand
import org.munaylab.balance.Categoria
import org.munaylab.balance.CategoriaCommand
import org.munaylab.balance.TipoAsiento
import org.munaylab.osc.Organizacion
import grails.gorm.transactions.Transactional

@Transactional
class BalanceService {

    def cancelarAsiento(Long id) {
        Asiento asiento = Asiento.findByIdAndEnabled(id, true)
        if (!asiento) return
        asiento.enabled = false
        asiento.save()
    }

    def actualizarAsiento(AsientoCommand command) {
        if (!command || !command.validate()) return null

        Categoria categoria = command.categoria.nuevaCategoria()
                ? actualizarCategoria(command.categoria) : Categoria.get(command.categoria.id)

        Asiento asiento = command.id ? Asiento.get(command.id) : new Asiento()
        asiento.actualizarDatos(command)
        asiento.categoria = categoria
        if (!asiento.organizacion)
            asiento.organizacion = Organizacion.get(command.orgId)
        asiento.save()
    }

    def actualizarCategoria(CategoriaCommand command) {
        if (!command || !command.validate()) return null

        Categoria categoria = null
        if (command.nuevaCategoria()) {
            Categoria categoriaPadre = Categoria.get(command.idCategoriaPadre)
            categoria = new Categoria(command.properties)
            if (categoriaPadre) {
                categoriaPadre.addToSubcategorias(categoria)
                categoriaPadre.save()
            } else {
                categoria.save()
            }
        } else {
            categoria = Categoria.get(command.id)
            categoria.nombre = command.nombre
            categoria.detalle = command.detalle
            categoria.save()
        }
        categoria
    }

    @Transactional(readOnly = true)
    def calcularBalance(Organizacion org, Date desde = null, Date hasta = null) {
        def totalEgresos = Asiento.createCriteria().get {
            eq 'organizacion', org
            eq 'enabled', true
            eq 'tipo', TipoAsiento.EGRESO
            if (desde) {
                between 'fecha', desde, hasta
            }
            projections {
                sum 'monto'
            }
        }
        def totalIngresos = Asiento.createCriteria().get {
            eq 'organizacion', org
            eq 'enabled', true
            eq 'tipo', TipoAsiento.INGRESO
            if (desde) {
                between 'fecha', desde, hasta
            }
            projections {
                sum 'monto'
            }
        }
        if (totalEgresos == null) totalEgresos = 0
        if (totalIngresos == null) totalIngresos = 0
        totalIngresos - totalEgresos
    }

}
