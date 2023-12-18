<#import "staticTemplate/template.ftlh" as t>
<@t.template user>


    <div class="container">
        <div id="main">
            <div class="row" id="real-estates-detail">
                <div class="col-lg-8 col-md-8 col-xs-12">
                    <div class="panel">
                        <div class="panel-body">
                            <div>
                                <hr>
                                <div>
                                    <h4>История профиля</h4>
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td>Почта:</td>
                                            <td>${user.email}</td>
                                        </tr>
                                        <tr>
                                            <td>Доступ:</td>
                                            <th><#if user.active>Доступ<#else>Без доступа</#if></th>
                                        </tr>
                                        <tr>
                                            <td>Ваш ID:</td>
                                            <td>${user.id}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <#if user.isAdmin()>
                            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
                               href="/admin">
                                Панель администратора
                            </a><br>
                        </#if>
                        <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
                           href="/your/courses">
                            Мои товары
                        </a>
                        <form action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" style="text-align: center; width: 100%" class="btn btn-danger mb-2">
                                Выйти из аккаунта
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <header class="panel-title">
                                <div class="text-center">
                                    <#list user.getRoles() as role>
                                        <#if role == "ROLE_USER">
                                            <strong>Пользователь</strong>
                                            <#elseif role=="ROLE_ADMIN">
                                                <strong>Администратор сайта</strong>
                                            <#elseif role=="ROLE_COACH">
                                                <strong>Тренер сайта</strong>
                                        </#if>
                                    </#list>
                                </div>
                            </header>
                        </div>
                        <div class="panel-body">
                            <div class="text-center" id="author">
                                <img src="https://bootstraptema.ru/snippets/element/2016/profilesection/myprofile.jpg">
                                <h3>${user.name} ${user.lastname}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section bg-image" style="background-image: url('/img/bg_03.png'); background-attachment: fixed">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="site-section-heading text-center text-white">Присоединяйся к нашей программе тренировок!</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-7 text-center">
                            <img src="/img/main_two.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
                            <h2 class="h5 mb-4 text-white" style="color: #f1a21c; text-shadow: 1px 1px 1px #000;">Билли Херрингтон</h2>
                            <p class="text-white mb-5 lead" style="color: #f1a21c; text-shadow: 1px 1px 1px #000;"><i>&ldquo;Наши курсы — это вдохновляющее путешествие к лучшей версии вас самого.
                                Откройте мир увлекательных тренировок, индивидуального внимания и достижения новых высот вместе с опытными инструкторами.
                                Присоединяйтесь к нашим курсам, где каждое занятие — это возможность обрести силу, гармонию и уверенность в себе."</i>
                            </p>
                            <p><a href="/programPage" class="btn btn-primary text-white">Подробнее...</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@t.template>