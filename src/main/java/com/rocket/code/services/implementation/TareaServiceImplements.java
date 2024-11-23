package com.rocket.code.services.implementation;

import com.rocket.code.persistence.model.TareaModel;
import com.rocket.code.services.interfaces.ITareaService;

import java.util.Collections;
import java.util.List;

public class TareaServiceImplements implements ITareaService {
    @Override
    public List<TareaModel> findAll() {
        return Collections.emptyList();
    }

    @Override
    public TareaModel findById(Long id) {
        return null;
    }

    @Override
    public TareaModel findByNombre(String nombre) {
        return null;
    }

    @Override
    public int insert(TareaModel tareaModel) {
        return 0;
    }

    @Override
    public int update(TareaModel tareaModel) {
        return 0;
    }

    @Override
    public int delete(Long id) {
        return 0;
    }
}
