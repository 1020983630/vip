package com.example.vip.function;

import com.example.vip.entity.UserEntity;

public interface UserFunction {
    public UserEntity login(String account, String password) throws Exception;
}
