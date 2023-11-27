package com.ra.model.dao;

import java.util.List;

public interface IGenericDAO <T,ID>{
    List<T> findAll();
    boolean saveOrUpdate(T t);
    T findById(ID id);
    void delete(ID id);
    List<T>findByName(String name);
}
