package org.munaylab

import org.munaylab.balance.Asiento
import org.munaylab.balance.AsientoCommand
import org.munaylab.balance.Categoria
import org.munaylab.balance.CategoriaCommand
import org.munaylab.balance.Egreso
import org.munaylab.balance.Ingreso
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

    def actualizarEgreso(AsientoCommand command) {
        if (!command || !command.validate()) return null

        Categoria categoria = command.categoria.nuevaCategoria()
                ? actualizarCategoria(command.categoria) : Categoria.get(command.categoria.id)

        Egreso egreso = command.id ? Egreso.get(command.id) : new Egreso()
        egreso.actualizarDatos(command)
        egreso.organizacion = Organizacion.get(command.orgId)
        egreso.categoria = categoria
        egreso.save()
    }

    def actualizarIngreso(AsientoCommand command) {
        if (!command || !command.validate()) return null

        Categoria categoria = command.categoria.nuevaCategoria()
                ? actualizarCategoria(command.categoria) : Categoria.get(command.categoria.id)

        Ingreso ingreso = command.id ? Ingreso.get(command.id) : new Ingreso()
        ingreso.actualizarDatos(command)
        ingreso.organizacion = Organizacion.get(command.orgId)
        ingreso.categoria = categoria
        ingreso.save()
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

    def calcularBalance(Organizacion org) {
        def ingresos = Ingreso.findAllByOrganizacionAndEnabled(org, true)
        def egresos = Egreso.findAllByOrganizacionAndEnabled(org, true)
        ingresos.monto.sum() - egresos.monto.sum()
    }

}
