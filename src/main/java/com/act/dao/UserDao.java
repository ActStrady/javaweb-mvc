package com.act.dao;

import com.act.pojo.User;
import com.act.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    /**
     * 通过密码和账号查User
     *
     * @param username
     * @param password
     * @return
     */
    public User queryByUsernameAndPassword(String username, String password) {
        User user = null;
        String sql = "select id, username, password, sex, age, admin, ico from cms.user " +
                "where username = ? and password = ?";
        try (Connection connection = JdbcUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(sql)) {
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                user = new User(rst.getInt("id"), rst.getString("username"),
                        rst.getString("password"), rst.getString("sex"),
                        rst.getInt("age"), rst.getByte("admin"), rst.getString("ico"));
            }
            rst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
