package com.example.model.service;

import java.util.List;

public interface IGenericService<T, ID> {
    List<T> findAll();

    boolean saveOrUpdate(T t);

    void delete(ID id);

    T findById(ID id);

}
