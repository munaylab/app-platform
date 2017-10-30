package org.munaylab

import org.munaylab.balance.Categoria
import org.munaylab.balance.CategoriaCommand
import org.munaylab.balance.Egreso
import org.munaylab.balance.Ingreso
import org.munaylab.balance.TipoAsiento

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class BalanceServiceSpec extends Specification
        implements ServiceUnitTest<BalanceService>, DataTest {

    void setupSpec() {
        mockDomains Ingreso, Egreso, Categoria
    }

    void 'agregar egreso'() {
        given:
        def command = Builder.egresoCommand
        command.categoria = Builder.categoriaEgresoCommand
        when:
        def egreso = service.actualizarEgreso(command)
        then:
        egreso != null && Egreso.countByEnabled(true) == 1
        Categoria.count() == 1
    }
    void 'modificar egreso'() {
        given:
        Builder.crearEgreso().save(flush: true)
        and:
        def command = Builder.egresoCommand
        command.id = 1
        command.categoria = new CategoriaCommand(id: 1, tipo: TipoAsiento.EGRESO)
        when:
        def egreso = service.actualizarEgreso(command)
        then:
        egreso != null && Egreso.countByEnabled(true) == 1
        egreso.monto == command.monto && Egreso.get(1).monto == command.monto
        egreso.detalle == command.detalle && Egreso.get(1).detalle == command.detalle
        Categoria.count() == 1
    }
    void 'cancelar egreso'() {
        given:
        def egreso = Builder.crearEgreso().save(flush: true)
        when:
        service.cancelarAsiento(egreso.id)
        then:
        Egreso.countByEnabled(true) == 0
        Egreso.countByEnabled(false) == 1
        Categoria.count() == 1
    }
    void 'agregar ingreso'() {
        given:
        def command = Builder.ingresoCommand
        command.categoria = Builder.categoriaIngresoCommand
        when:
        def ingreso = service.actualizarIngreso(command)
        then:
        ingreso != null && Ingreso.countByEnabled(true) == 1
        Categoria.count() == 1
    }
    void 'modificar ingreso'() {
        given:
        Builder.crearIngreso().save(flush: true)
        and:
        def command = Builder.ingresoCommand
        command.id = 1
        command.categoria = new CategoriaCommand(id: 1, tipo: TipoAsiento.INGRESO)
        when:
        def ingreso = service.actualizarIngreso(command)
        then:
        ingreso != null && Ingreso.countByEnabled(true) == 1
        ingreso.monto == command.monto && Ingreso.get(1).monto == command.monto
        ingreso.detalle == command.detalle && Ingreso.get(1).detalle == command.detalle
        Categoria.count() == 1
    }
    void 'cancelar ingreso'() {
        given:
        def ingreso = Builder.crearIngreso().save(flush: true)
        when:
        service.cancelarAsiento(ingreso.id)
        then:
        Ingreso.countByEnabled(true) == 0
        Ingreso.countByEnabled(false) == 1
        Categoria.count() == 1
    }
    void 'crear categoria'() {
        when:
        service.actualizarCategoria(Builder.categoriaIngresoCommand)
        then:
        Categoria.count() == 1
    }
    void 'crear subcategoria'() {
        given:
        Builder.crearCategoria().save(flush: true)
        def command = Builder.categoriaIngresoCommand
        command.idCategoriaPadre = 1
        when:
        def categoria = service.actualizarCategoria(command)
        then:
        categoria != null && Categoria.count() == 2
        Categoria.get(1).subcategorias.size() == 1
    }
    void 'modificar categoria'() {
        given:
        Builder.crearCategoria().save(flush: true)
        def command = Builder.categoriaIngresoCommand
        command.id = 1
        when:
        def categoria = service.actualizarCategoria(command)
        then:
        categoria != null && Categoria.count() == 1
        categoria.nombre == command.nombre
        categoria.detalle == command.detalle
        Categoria.get(1).nombre == command.nombre
        Categoria.get(1).detalle == command.detalle
    }

}
