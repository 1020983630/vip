package com.example.vip.dao;

import com.example.vip.entity.UserEntity;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    public UserEntity selectByAccount(@Param("account") String account);
}
