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
    <h1><b>! GFRM !</b></h1>
    <h3>Подробная информация о пользователе</h3>
        <b>Имя | Фамилия </b> ${user.name} ${user.lastname}
        <b>Email(удалить потом) </b> ${user.email}
        <b>Роль: </b> ${user.id}
    <h2>Подробнее о курсах пользователя ${user.name}</h2>
    <#list courses as course>
        <div>
            <p>${course.title} ${course.price} BR | <a href="/course/${course.id}">Подробнее</a></p>
        </div>
        <#else>
        <h3>Курсов нету</h3>
    </#list>

</body>
</html>