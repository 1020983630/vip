package com.example.vip.function.impl;

import static com.example.common.AssertThrowUtil.*;

import com.example.common.ThisSystemException;
import com.example.vip.dao.UserDao;
import com.example.vip.entity.UserEntity;
import com.example.vip.function.UserFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserFunctionImpl implements UserFunction {
    @Autowired
    private UserDao userDao;

    @Override
    public UserEntity login(String account, String password) throws Exception {
        account = $("账户不能为空", account);
        password = $("密码不能为空", password);

        UserEntity userEntity = userDao.select("account", account);

        if (userEntity == null) {
            throw new ThisSystemException("账户不存在！");
        }

        if (!userEntity.getPassword().equals(password)) {
            throw new ThisSystemException("密码错误！");
        }

        return userEntity;
    }
}
