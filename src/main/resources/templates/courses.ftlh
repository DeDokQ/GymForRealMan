<#import "staticTemplate/template.ftlh" as t>
<@t.template user>

<div class="card-columns">
    <#list courses as course>
        <div class="card" style="width: 18rem;">
<#--            <img src="..." class="card-img-top" alt="...">-->
            <div class="card-body">
                <h5 class="card-title">${course.title}</h5>
<#--                <p class="card-text">${course.user.}</p>-->
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Курсы ведет: ${course.master}</li>
                <li class="list-group-item">${course.user.email}</li>
            </ul>
            <div class="card-body">
                <a href="/course/${course.id}" class="card-link">Подробнее о курсе</a>
            </div>
        </div>
    <#else>
        <h3 style="text-align: center">Все курсы закончились...</h3>
    </#list>
</div>

</@t.template>
