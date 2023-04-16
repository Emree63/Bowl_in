package org.acme.Api.service;

import javax.enterprise.context.ApplicationScoped;

import org.acme.Hibernates.entities.ThrowEntity;

import io.quarkus.hibernate.orm.panache.PanacheRepository;

@ApplicationScoped
public class ThrowRepository implements PanacheRepository<ThrowEntity> {

}
