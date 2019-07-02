<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>主页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">科大讯飞设备管理系统</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <%--用户权限管理--%>
                <c:choose>
                    <c:when test="${user.admin == 1}">
                        <a href="javascript:;">
                            <img src="${pageContext.request.contextPath}/img/${user.ico}" class="layui-nav-img"/>
                            <span>管理员：${user.username}</span>
                        </a>
                        <dl class="layui-nav-child layui-icon-align-center">
                            <dd><a href="">个人信息</a></dd>
                            <dd><a href="">用户管理</a></dd>
                        </dl>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:;">
                            <img src="${pageContext.request.contextPath}/img/${user.ico}" class="layui-nav-img"/>
                            <span>欢迎您：${user.username}</span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="">个人信息</a></dd>
                        </dl>
                    </c:otherwise>
                </c:choose>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/QuitServlet">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding-left: 10px;">
            <iframe src="${pageContext.request.contextPath}/DataServlet"
                    width="100%" height="100%" frameborder="no"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        © 科大讯飞
    </div>
</div>
<script src="${pageContext.request.contextPath}/plugin/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>