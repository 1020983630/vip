package com.example.common;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AbstractDao<T> {
    void insert(T t) throws Exception;

    void update(T t) throws Exception;

    void delete(@Param("key") String key, @Param("value") Object value) throws Exception;

    T select(@Param("key") String key, @Param("value") Object value) throws Exception;

    void exists(@Param("key") String key, @Param("value") Object value) throws Exception;

    List<T> selectLike(@Param("key") String key) throws Exception;
}
