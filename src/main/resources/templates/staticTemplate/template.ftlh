<#macro template user>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>
        <title>TEST</title>
    </head>
    <body>
    <nav class="navbar bg-body-tertiary fixed-top" style="background-color: #97979f !important;">
        <div class="container-fluid" style="background-color: #97979f !important;">
            <a class="navbar-brand" href="/"><i>Gym For Real Man</i></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                 aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header" style="background-color: #97979f !important;">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel"><b>Навигация</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-header">
                    <#if user.email??>
                        <h6 class="offcanvas-title" id="offcanvasNavbarLabelUserName">Вы: <i>${user.name}</i>
                        </h6>
                    <#else>
                        <h6 class="offcanvas-title" id="offcanvasNavbarLabelUserName">Вы: <b>Гость</b></h6>
                        <h6><i> Вам необходимо авторизоваться!</i></h6>
                    </#if>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/">Главная страничка</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/profile">Профиль</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                Дополнительные функции
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Пока думаю</a></li>
                                <li><a class="dropdown-item" href="#">Думаю в тройне</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <#if user.email??>
                                        <#if user.isAdmin()>
                                            <a class="dropdown-item" href="/admin">Панель администратора</a>
                                        </#if>
                                        <form class="dropdown-item" action="/logout" method="post">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <input class="dropdown-item" type="submit" value="Выход">
                                        </form>
                                    <#else>
                                        <a class="dropdown-item" href="/login">Вход</a>
                                    </#if>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex mt-3" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Поиск курса</button>
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <#nested/>
    </div>

    </body>
    </html>
</#macro>