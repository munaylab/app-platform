package org.munaylab.utils

import org.munaylab.contacto.Contacto
import org.munaylab.osc.Organizacion
import org.munaylab.user.User

import grails.transaction.NotTransactional
import grails.gorm.transactions.Transactional
import org.springframework.context.i18n.LocaleContextHolder

@Transactional(readOnly = true)
class EmailService {

    def mailService
    def messageSource

    @NotTransactional
    def enviarRegistroOrg(User user, Organizacion org, String token) {
        Contacto email = user.email
        if (!email) {
            log.warn "no se puede enviar email a ${user}"
            return
        }
        enviarMail(email.value, TipoEmail.ORG_REGISTRO, [token: token, user: user, org: org])
    }

    @NotTransactional
    def enviarBienvenidaOrg(User user, Organizacion org) {
        Contacto email = user.email
        if (!email) {
            log.warn "no se puede enviar email a ${user}"
            return
        }
        enviarMail(email.value, TipoEmail.ORG_BIENVENIDA, [user: user, org: org])
    }

    @NotTransactional
    def enviarMail(String email, TipoEmail tipo, Map map) {
        log.info "enviando email($tipo) a ${email}"
        String titulo = messageSource.getMessage("mail.subject.${tipo.id}",
                null, LocaleContextHolder.getLocale())
        try {
            mailService.sendMail {
                to email
                subject titulo
                body(view: tipo.plantilla, model: map)
            }
        } catch (Exception e) {
            log.error "no se puede enviar email($tipo) a $email", e
        }
    }

}
