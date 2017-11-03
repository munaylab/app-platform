package org.munaylab

import org.munaylab.balance.Categoria
import org.munaylab.balance.CategoriaCommand
import org.munaylab.balance.Asiento
import org.munaylab.balance.TipoAsiento

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class BalanceServiceSpec extends Specification
        implements ServiceUnitTest<BalanceService>, DataTest {

    void setupSpec() {
        mockDomains Asiento, Categoria
    }

    void 'agregar egreso'() {
        given:
        Builder.crearOrganizacionConDatos().save(flush: true)
        and:
        def command = Builder.egresoCommand
        command.categoria = Builder.categoriaEgresoCommand
        when:
        def egreso = service.actualizarAsiento(command)
        then:
        egreso != null && Asiento.countByEnabled(true) == 1
        Categoria.count() == 1
    }
    void 'modificar egreso'() {
        given:
        def egreso = Builder.crearEgreso()
        egreso.organizacion = Builder.crearOrganizacionConDatos().save(flush: true)
        egreso.save(flush: true)
        and:
        def command = Builder.egresoCommand
        command.id = 1
        command.categoria = new CategoriaCommand(id: 1, tipo: TipoAsiento.EGRESO)
        when:
        egreso = service.actualizarAsiento(command)
        then:
        egreso != null && Asiento.countByEnabled(true) == 1
        egreso.monto == command.monto && Asiento.get(1).monto == command.monto
        egreso.detalle == command.detalle && Asiento.get(1).detalle == command.detalle
        Categoria.count() == 1
    }
    void 'cancelar egreso'() {
        given:
        def egreso = Builder.crearEgreso()
        egreso.organizacion = Builder.crearOrganizacionConDatos().save(flush: true)
        egreso.save(flush: true)
        when:
        service.cancelarAsiento(egreso.id)
        then:
        Asiento.countByEnabled(true) == 0
        Asiento.countByEnabled(false) == 1
        Categoria.count() == 1
    }
    void 'agregar ingreso'() {
        given:
        Builder.crearOrganizacionConDatos().save(flush: true)
        and:
        def command = Builder.ingresoCommand
        command.categoria = Builder.categoriaIngresoCommand
        when:
        def ingreso = service.actualizarAsiento(command)
        then:
        ingreso != null && Asiento.countByEnabled(true) == 1
        Categoria.count() == 1
    }
    void 'modificar ingreso'() {
        given:
        def ingreso = Builder.crearIngreso()
        ingreso.organizacion = Builder.crearOrganizacionConDatos().save(flush: true)
        ingreso.save(flush: true)
        and:
        def command = Builder.ingresoCommand
        command.id = 1
        command.categoria = new CategoriaCommand(id: 1, tipo: TipoAsiento.INGRESO)
        when:
        ingreso = service.actualizarAsiento(command)
        then:
        ingreso != null && Asiento.countByEnabled(true) == 1
        ingreso.monto == command.monto && Asiento.get(1).monto == command.monto
        ingreso.detalle == command.detalle && Asiento.get(1).detalle == command.detalle
        Categoria.count() == 1
    }
    void 'cancelar ingreso'() {
        given:
        def ingreso = Builder.crearIngreso()
        ingreso.organizacion = Builder.crearOrganizacionConDatos().save(flush: true)
        ingreso.save(flush: true)
        when:
        service.cancelarAsiento(ingreso.id)
        then:
        Asiento.countByEnabled(true) == 0
        Asiento.countByEnabled(false) == 1
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
    void 'calcular balance sin fechas'() {
        given:
        def org = Builder.crearOrganizacionConDatos().save(flush: true)
        def categoria = new Categoria(nombre: 'nuevaCategoria', tipo: TipoAsiento.INGRESO).save(flush: true)
        crearAsientos(org, categoria, TipoAsiento.EGRESO, [egreso1, egreso2, egreso3])
        crearAsientos(org, categoria, TipoAsiento.INGRESO, [ingreso1, ingreso2, ingreso3])
        expect:
        service.calcularBalance(org) == total
        where:
        egreso1 | egreso2 | egreso3 | ingreso1 | ingreso2 | ingreso3 | total
        10.0    | 10.0    | 10.0    | 20.0     | 20.0     | 20.0     | 30.0
        20.0    | 10.0    | 10.0    | 20.0     | 20.0     | 20.0     | 20.0
        20.0    | 20.0    | 10.0    | 10.0     | 10.0     | 10.0     | -20.0
    }
    void crearAsientos(org, categoria, tipo, values) {
        values.each {
            new Asiento(fecha: new Date(), monto: it, detalle: 'asiento',
                categoria: categoria, organizacion: org, tipo: tipo).save(flush: true)
        }
    }
    void 'calcular balance con fechas'() {
        given:
        def org = Builder.crearOrganizacionConDatos().save(flush: true)
        def categoria = new Categoria(nombre: 'nuevaCategoria', tipo: TipoAsiento.INGRESO).save(flush: true)
        crearAsientosConFechas(org, categoria, TipoAsiento.EGRESO, egreso)
        crearAsientosConFechas(org, categoria, TipoAsiento.INGRESO, ingreso)
        expect:
        service.calcularBalance(org, desde, hasta) == total
        where:
        egreso                | ingreso                | total | desde         | hasta
        [40.0, new Date() -2] | [100.0, new Date() -3] | 60.0  | new Date() -3 | new Date() -1
        [90.0, new Date() -5] | [100.0, new Date() -3] | 100.0 | new Date() -3 | new Date() -1
        [90.0, new Date() -5] | [100.0, new Date() -5] | 0.0   | new Date() -1 | new Date() -1
        [90.0, new Date() -1] | [50.0, new Date() -1]  | -40.0 | new Date() -1 | new Date() -1
    }
    void crearAsientosConFechas(org, categoria, tipo, value) {
        new Asiento(fecha: value[1], monto: value[0], detalle: 'asiento',
            categoria: categoria, organizacion: org, tipo: tipo).save(flush: true)
    }

}
