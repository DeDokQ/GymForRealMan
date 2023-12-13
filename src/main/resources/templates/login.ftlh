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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/style.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Логин</title>
</head>
<body>

<div class="container position-absolute top-50 start-50 translate-middle">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">

            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active col align-self-start text-start" ><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Авторизация</a></li>
                        <li role="presentation" class="col align-self-end text-end"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">Регистрация</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content tabs">
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                        <form action="/login" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Почта</label>
                                <input type="email" name="username" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Пароль</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <div class="main-checkbox">
                                    <input value="None" id="checkbox1" name="check" type="checkbox">
                                    <label for="checkbox1"></label>
                                </div>
                                <span class="text">Запомните меня!</span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default">Войти</button>
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                            </div>
                            <div class="form-group forgot-pass">
                                <a href="/helpPage" type="submit" class="btn btn-default">Забыли пароль?</a>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Section2">
                        <form class="form-horizontal" action="/registration" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Имя</label>
                                <input type="text" name="name" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Фамилия</label>
                                <input type="text" name="lastname" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Электронная почта</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Пароль</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default">Зарегистрироваться</button>
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div><!-- /.col-md-offset-3 col-md-6 -->
    </div><!-- /.row -->
</div><!-- /.container -->
</body>
</html>