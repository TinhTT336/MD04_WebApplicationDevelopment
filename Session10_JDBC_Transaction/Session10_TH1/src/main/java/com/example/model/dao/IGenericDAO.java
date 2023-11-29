package com.example.model.dao;

import java.util.List;

public interface IGenericDAO <T,ID>{
    List<T> findAll();
    boolean saveOrUpdate(T t);
    void delete(ID id);
    T findById(ID id);
}
