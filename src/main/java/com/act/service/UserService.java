package com.act.service;

import com.act.dao.UserDao;
import com.act.pojo.User;

public class UserService {
    UserDao userDao = new UserDao();

    public User queryByUsernameAndPassword(String username, String password) {
        return userDao.queryByUsernameAndPassword(username, password);
    }
}
