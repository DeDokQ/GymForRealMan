<#import "staticTemplate/template.ftlh" as t>
<@t.template user>
    <h1>Панель администратора</h1>
    <table class="table table-hover table-dark">
        <tr>
            <th class="table-dark" scope="col">Email:</th>
            <th class="table-dark" scope="col">Активность:</th>
            <th class="table-dark" scope="col">Имя:</th>
            <th class="table-dark" scope="col">Фамилия:</th>
            <th class="table-dark" scope="col">Роли:</th>
            <th class="table-dark" scope="col">Бан:</th>
            <th class="table-dark" scope="col">Редактирование:</th>
            <th class="table-dark" scope="col">Подробная информация:</th>
        </tr>
        <#list users as user>
            <tr>
                <th class="table-dark">${user.email}</th>
                <th class="table-dark"><#if user.active>Доступ<#else>Без доступа</#if></th>
                <th class="table-dark">${user.name}</th>
                <th class="table-dark">${user.lastname}</th>
                <th class="table-dark"><#list user.roles as role>
                        ${role}<#sep>,
                    </#list></th>
                <th class="table-dark">
                    <form action="/admin/u/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light border border-danger-subtle" value="Бан">
                    </form>
                </th>
                <th class="table-dark"><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
                <th class="table-dark"><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <h3>Список пользователей пуст</h3>
        </#list>
    </table>
</@t.template>