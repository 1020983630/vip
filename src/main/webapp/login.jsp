<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <title>登录页面</title>
</head>
<script>
    if (window.top != window) {
        window.top.location.href = window.location.href;
    }
</script>
<body>
    <strong>${message}</strong>
    <form action="/login.do" method="post">
        <p>
            <label>Account:<input type="text" name="account"></label>
        </p>
        <p>
            <label>Password:<input type="password" name="password"></label>
        </p>
        <p>
            <button type="submit" value="Login">Login</button>
        </p>
    </form>
</body>
</html>
