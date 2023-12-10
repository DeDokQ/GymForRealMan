<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h1> Курсы в качалочке!!!</h1>

<#if user.email??>
    <h3>Вы: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выход">
    </form>
<#else>
    <a href="/login">Войти</a>
</#if>

<form action="/" method="get">
    Поиск по названию курса: <input type="text" name="title"><br>
    <input type="submit" value="Поиск">
</form>

<hr>

<h4>
    <#list courses as course>
        <div>
            <p>${course.title} ${course.price} BR | <a href="/course/${course.id}">Подробнее</a></p>
        </div>
    <#else>
        <h3>Все курсы закончились...</h3>
    </#list>

    <#if user.email??>
        <hr>
        <h3>Создать новый курс</h3>
        <form action="/course/create" method="post" enctype="multipart/form-data">
            Название курса: <input type="text" name="title"><br><br>
            Описание курса: <input type="text" name="description"><br><br>
            Дата проведения курса: <input type="text" name="date"><br><br>
            Тренер: <input type="text" name="master"><br><br>
            Цена курса: <input type="number" name="price"><br><br>
            Изображение 1/4: <input type="file" name="file1"><br><br>
            Изображение 2/4: <input type="file" name="file2"><br><br>
            Изображение 3/4: <input type="file" name="file3"><br><br>
            Изображение 4/4: <input type="file" name="file4"><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Добавить курс">
        </form>
    </#if>
</h4>
</body>
</html>
