<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Adminka</title>
</head>
<body>
<h1>Панель администратора</h1>

<table border="1">
    <tr>
        <th>Email:</th>
        <th>Активность:</th>
        <th>Имя:</th>
        <th>Фамилия:</th>
        <th>Роли:</th>
        <th>Бан:</th>
        <th>Редактирование:</th>
        <th>Подробная информация:</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th><#if user.active>Доступ<#else>Без доступа</#if></th>
            <th>${user.name}</th>
            <th>${user.lastname}</th>
            <th><#list user.roles as role>
                    ${role}<#sep>,
                </#list></th>
            <th>
                <form action="/admin/u/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
            <th><a href="/user/${user.id}">Подробная информация</a></th>
        </tr>
    <#else>
        <h3>Список пользователей пуст</h3>
    </#list>
</table>
</body>
</html>