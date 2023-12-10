<#import "staticTemplate/template.ftlh" as t>
<@t.template user>

<h1 style="text-align: center"> Курсы в качалочке!!!</h1>

<#if user.email??>
    <h3>Вы: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выход">
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти</a>
</#if>

<#--<form action="/" method="get">-->
<#--    Поиск по названию курса: <input type="text" name="title"><br>-->
<#--    <input type="submit" value="Поиск">-->
<#--</form>-->

<hr>
    <div class="card-columns">
        <#list courses as course>
            <a href="/course/${course.id}" class="course-link">
                <div class="card text-white bg-dark my-3 course">

<#--                    <img src="/images/${course.getImages()[0].getId()}" class="card-img-top" height="200px" width="120px">-->

                    <div class="card-body">
                        <h5 class="card-title">${course.title}</h5>
                        <p class="card-text">${course.price} BR</p>
                    </div>
                    <div class="card-footer">
                        ${course.master}
                    </div>
                </div>
            </a>
        <#else>
            <h3 style="text-align: center">Все курсы закончились...</h3>
        </#list>
    </div>
<#--    <#list courses as course>-->
<#--        <div>-->
<#--            <p>${course.title} ${course.price} BR | <a href="/course/${course.id}">Подробнее</a></p>-->
<#--        </div>-->
<#--    <#else>-->
<#--        <h3>Все курсы закончились...</h3>-->
<#--    </#list>-->

<#--    <#if user.email??>-->
<#--        <hr>-->
<#--        <h3>Создать новый курс</h3>-->
<#--        <form action="/course/create" method="post" enctype="multipart/form-data">-->
<#--            Название курса: <input type="text" name="title"><br><br>-->
<#--            Описание курса: <input type="text" name="description"><br><br>-->
<#--            Дата проведения курса: <input type="text" name="date"><br><br>-->
<#--            Тренер: <input type="text" name="master"><br><br>-->
<#--            Цена курса: <input type="number" name="price"><br><br>-->
<#--            Изображение 1/4: <input type="file" name="file1"><br><br>-->
<#--            Изображение 2/4: <input type="file" name="file2"><br><br>-->
<#--            Изображение 3/4: <input type="file" name="file3"><br><br>-->
<#--            Изображение 4/4: <input type="file" name="file4"><br><br>-->
<#--            <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--            <input type="submit" value="Добавить курс">-->
<#--        </form>-->
<#--    </#if>-->
</@t.template>
