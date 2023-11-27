package com.ra.service;

import java.util.List;

public interface IGenericService <T>{
    List<T> findAll();
    void save (T t);
    void deleteById(int id);
    T findById(int id);
    int getNewId();
    List<T>findByName(String name);
}
