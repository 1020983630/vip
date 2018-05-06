<%--
  Created by IntelliJ IDEA.
  User: yangj
  Date: 2018/5/5
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <strong>${message}</strong>
    <form action="/updatePassword.do" method="post">
        <p>
            <label>旧密码:<input type="password" name="oldPassword"></label>
        </p>
        <p>
            <label>新密码:<input type="password" name="newPassword"></label>
        </p>
        <p>
            <label>新密码确认:<input type="password" name="newPasswordConfirm"></label>
        </p>
        <p>
            <button type="submit" value="Login">提交</button>
            <a href="welcome.do">返回</a>
        </p>
    </form>
</body>
</html>
