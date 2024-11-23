package com.rocket.code.services.interfaces;

import com.rocket.code.persistence.model.TareaModel;

import java.util.List;

public interface ITareaService {
    List<TareaModel> findAll();

    TareaModel findById(Long id);

    TareaModel findByNombre(String nombre);

    int insert(TareaModel tareaModel);

    int update(TareaModel tareaModel);

    int delete(Long id);
}
