<%--
  Created by IntelliJ IDEA.
  User: actst
  Date: 2019/4/16
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--当前maven的jstl版本的路径是这个--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主界面</title>
    <style type="text/css">
        span {
            font-size: 100px;
        }

        .us {
            color: white;
            height: 500px;
            text-align: center;
            line-height: 500px;
        }

        body {
            background-color: #35404F;
        }
    </style>
</head>
<body>
<div class="us">
    <span>你好：</span>
    <%--在idea需要这样来指定el的使用，不然会报警告--%>
    <%--@elvariable id="username" type="com.act.servlet.LoginServlet"--%>
    <span><c:out value="${username}"/></span>
</div>
</body>
</html>
