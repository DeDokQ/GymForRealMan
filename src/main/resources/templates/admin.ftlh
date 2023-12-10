<#import "staticTemplate/template.ftlh" as t>
<@t.template user>
    <h1>Панель администратора</h1>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Email:</th>
            <th scope="col">Активность:</th>
            <th scope="col">Имя:</th>
            <th scope="col">Фамилия:</th>
            <th scope="col">Роли:</th>
            <th scope="col">Бан:</th>
            <th scope="col">Редактирование:</th>
            <th scope="col">Подробная информация:</th>
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
                        <input type="submit" class="btn btn-light" value="Бан">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
                <th><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <h3>Список пользователей пуст</h3>
        </#list>
    </table>
</@t.template>