<#macro template user>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>

        <title>Gym for real man</title>
    </head>
    <body>
    <div class="site-wrap" style="margin-top: 3%;">
        <nav class="header navbar bg-body-tertiary fixed-top"
             style="background-color: #1e1e1c !important; max-width: 1200px; margin: 0 auto;">
            <div class="container-fluid" style="background-color: #1e1e1c !important;">
                <a class="navbar-brand" href="/" style="color: rgba(255, 255, 255, 0.5);"><i>Gym For Real Man</i></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasNavbar"
                        aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"><img src="/img/favicon/android-icon-36x36.png" alt=""></span>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                     aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header" style="background-color: #1e1e1c !important;">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: rgba(255, 255, 255, 0.5);"><b>Навигация</b></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-header">
                        <#if user.email??>
                            <h6 class="offcanvas-title" id="offcanvasNavbarLabelUserName">Вы: <i>${user.name}</i>
                            </h6>
                        <#else>
                            <h6 class="offcanvas-title" id="offcanvasNavbarLabelUserName">Вы: <b>Гость</b></h6>
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

        <div class="main">
            <div class="container-lg">
                <#nested/>
            </div>
        </div>

        <footer class="site-footer">
            <div class="container">


                <div class="row">
                    <div class="col-md-4">
                        <h3 class="footer-heading mb-4 text-white">About</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat
                            amet.</p>
                        <p><a href="#" class="btn btn-primary rounded text-white px-4">Read More</a></p>
                    </div>
                    <div class="col-md-5 ml-auto">
                        <div class="row">
                            <div class="col-md-6">
                                <h3 class="footer-heading mb-4 text-white">Quick Menu</h3>
                                <ul class="list-unstyled">
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Our Trainers</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">Contacts</a></li>
                                    <li><a href="#">The Club</a></li>
                                    <li><a href="#">Privacy</a></li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h3 class="footer-heading mb-4 text-white">Program</h3>
                                <ul class="list-unstyled">
                                    <li><a href="#">Body Building</a></li>
                                    <li><a href="#">Morning Energy</a></li>
                                    <li><a href="#">Stretching</a></li>
                                    <li><a href="#">Weight Lifting</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-2">
                        <div class="col-md-12"><h3 class="footer-heading mb-4 text-white">Social Icons</h3></div>
                        <div class="col-md-12">
                            <p>
                                <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
                                <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                                <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                                <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

                            </p>
                        </div>
                    </div>
                </div>
                <div class="row pt-5 mt-5 text-center">
                    <div class="col-md-12">
                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script>
                            All Rights Reserved | This template is made with <i class="icon-heart text-danger"
                                                                                aria-hidden="true"></i> by <a
                                    href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>

                </div>
            </div>
        </footer>
    </div>

    </body>
    </html>
</#macro>