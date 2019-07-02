<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <%--${pageContext.request.contextPath}代表项目路径--%>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 header">
            <h2 class="text-center title"><span>科大讯飞教育设备保修平台</span></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 box">
            <h2 class="text-center text-info til"><span>用户登录</span></h2>
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="form-group form-group-lg">
                    <label for="username"></label>
                    <input type="text" class="form-control inp" placeholder="用户名" id="username" name="username"
                           value="${cookie.username.value}">
                </div>
                <div class="form-group form-group-lg">
                    <label for="password"></label>
                    <input type="password" class="form-control inp" placeholder="密码" id="password" name="password"
                           value="${cookie.password.value}">
                </div>
                <div class="input-group input-group-lg">
                    <label for="ver_code"></label>
                    <input type="text" class="form-control inp" id="ver_code" name="ver_code"
                           placeholder="验证码">
                    <span class="input-group-btn">
                        <img src="${pageContext.request.contextPath}/VerifyCodeServlet"
                             class="img" id="img" alt="loading"/>
                    </span>
                </div>
                <div class="footer">
                    <input class="btn btn-info" type="submit" value="确定登录" id="sub"/>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="remember" name="remember"
                                   <c:if test="${cookie.username != null}">checked="checked"</c:if>/>
                            <span>记住我</span>
                        </label>
                    </div>
                    <a href="#"><span class="forget">忘记密码？</span></a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/plugin/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/layer/layer.js"></script>
<script>
    $("#sub").click(function (event) {
        // 用户名校验
        var username = $("#username");
        if (!username.val()) {
            username.focus();
            // 使用layer插件的tip实现提示
            layer.tips('<span style="color: red">用户名不能为空</span>', '#username', {
                tips: [3, '#DBE1EA']
            });
            event.preventDefault();
            return;
        }
        // 密码校验
        var password = $("#password");
        if (!password.val() || password.val().length < 8) {
            layer.tips('<span style="color: red">密码不能为空且必须大于8个字符</span>', '#password', {
                tips: [3, '#DBE1EA']
            });
            password.focus();
            event.preventDefault();
            return;
        }
        layer.load();
    });
    // 点击变换验证码
    $('#img').click(function () {
        this.src = "${pageContext.request.contextPath}/VerifyCodeServlet?" + Math.random();
    });
    // 消息框 返回后台消息
    var error = '${error}';
    if (error) {
        layer.msg('<span style="color: #FA2E2E">' + error + '</span>', {
            offset: '100px',
            anim: 6
        });
    }
</script>
</body>
</html>