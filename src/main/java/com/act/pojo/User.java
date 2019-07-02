package com.act.pojo;

/**
 * @program: javaweb-mvc
 * @description: 用户实体
 * @author: ActStrady
 * @create: 2019-04-23 17:16
 **/
public class User {
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
    private byte admin;
    private String ico;

    public User() {
    }

    public User(int id, String username, String password, String sex, int age, byte admin, String ico) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.admin = admin;
        this.ico = ico;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public byte getAdmin() {
        return admin;
    }

    public void setAdmin(byte admin) {
        this.admin = admin;
    }

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", admin=" + admin +
                ", ico='" + ico + '\'' +
                '}';
    }
}
