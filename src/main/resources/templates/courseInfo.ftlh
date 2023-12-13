<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gym for real man</title>
</head>
<body>
<h1>
    Подробнее о курсе
</h1>
<h4>
    <#list images as img>
        <img src="/images/${img.id}" height="60px"/><br><br>
    </#list>

    <b>Название курса: </b>${course.title}<br><br>
    <b>Описание курса: </b>${course.description}<br><br>
    <b>Дата проведения курса: </b>${course.date}<br><br>
    <b>Тренер: </b>${course.master}<br><br>
    <b>Цена курса: </b>${course.price}<br><br>
    <b>Автор курса: </b><a href="/user/${course.user.id}">${course.user.name}</a>
</h4>
</body>
</html>