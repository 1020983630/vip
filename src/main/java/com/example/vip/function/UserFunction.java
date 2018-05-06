package com.example.vip.function;

import com.example.vip.entity.UserEntity;

public interface UserFunction {
    public UserEntity login(String account, String password) throws Exception;

    public UserEntity updatePassword(String id, String oldPassword, String newPassword, String newPasswordConfim) throws Exception;

}
