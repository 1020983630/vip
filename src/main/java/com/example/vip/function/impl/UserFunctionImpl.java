package com.example.vip.function.impl;

import static com.example.common.AssertThrowUtil.*;

import com.example.common.ThisSystemException;
import com.example.vip.dao.UserDao;
import com.example.vip.entity.UserEntity;
import com.example.vip.function.UserFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    @Transactional
    public UserEntity updatePassword(String id, String oldPassword, String newPassword, String newPasswordConfirm) throws Exception {
        //验证参数
        id = $("id不能为空", id);
        oldPassword = $("旧密码必须填写", oldPassword);
        newPassword = $("新密码必须填写", newPassword);
        newPasswordConfirm = $("新密码确认必须填写", newPasswordConfirm);
        assertEquals("两次密码不一致", newPassword, newPasswordConfirm);
        assertNotEquals("新密码与旧密码不能相同", oldPassword, newPassword);

        //验证用户
        UserEntity user = userDao.select("id", id);
        assertNotNull("无法找到用户", user);

        //验证旧密码
        assertEquals("旧密码不正确", user.getPassword(), oldPassword);

        //更新密码
        user.setPassword(newPassword);
        userDao.update(user);

        return user;
    }
}
