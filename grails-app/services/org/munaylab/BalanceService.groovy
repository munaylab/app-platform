package org.munaylab

import org.munaylab.balance.AsientoCommand
import org.munaylab.balance.Ingreso
import grails.gorm.transactions.Transactional

@Transactional
class BalanceService {

    def agregarAsiento(AsientoCommand command) {
        if (!command || command.hasErrors()) return null

        Ingreso ingreso = command.ingreso
        ingreso.save()
    }
}
