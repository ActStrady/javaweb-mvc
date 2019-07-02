drop database if exists cms;
create database cms;

drop table if exists cms.user;
create table cms.user
(
    id       int primary key auto_increment comment '主键',
    username varchar(255) not null comment '用户名',
    password varchar(255) not null comment '密码',
    sex      varchar(255) not null comment '性别',
    age      int          not null comment '年龄',
    admin bit default 0 comment '是否管理员 0 普通用户 1 管理员',
    ico varchar(255) default 'avatar.png' comment '用户头像'
);

insert into cms.user(username, password, sex, age)
values ('tom', '123456789', '男', 20);
insert into cms.user(username, password, sex, age)
values ('jerry', '1234567890', '女', 20);
insert into cms.user(username, password, sex, age)
values ('武大郎', '000000000', '男', 20);
insert into cms.user(username, password, sex, age)
values ('小潘', '147258369', '女', 18);
insert into cms.user(username, password, sex, age, admin, ico)
values ('川普', '123456789', '男', 20, 1, 'avatar4.jpg');