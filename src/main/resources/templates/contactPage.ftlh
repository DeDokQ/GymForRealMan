<#import "staticTemplate/template.ftlh" as t>
<@t.template user>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700|Work+Sans:300,400,700" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">



        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">

    </head>
    <body style="background-image: url(img/bg.jpg);">

    <div class="site-wrap">
        <div class="site-blocks-cover inner-page" style="background-image: url(img/hero_b1_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-7 text-center" data-aos="fade">
                    <h1 style="color:#f1a21c; text-shadow: 1px 1px 1px #000;">Контакты</h1>
                    <span class="caption d-block text-white"><h4 style="color:#f1a21c; text-shadow: 1px 1px 1px #000;"><b>Узнайте о нас больше!</b></h4></span>
                </div>
            </div>
        </div>

        <div class="py-5 bg-light">
            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-lg-8 mb-5">



                        <form action="#" class="p-5 bg-white">

                            <div class="row form-group">
                                <div class="col-md-12 mb-3 mb-md-0">
                                    <label class="font-weight-bold" for="fullname">ФИО</label>
                                    <input type="text" id="fullname" class="form-control" placeholder="Ваше ФИО">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-12">
                                    <label class="font-weight-bold" for="email">Почта</label>
                                    <input type="email" id="email" class="form-control" placeholder="Ваша Почта">
                                </div>
                            </div>


                            <div class="row form-group">
                                <div class="col-md-12 mb-3 mb-md-0">
                                    <label class="font-weight-bold" for="phone">Телефон</label>
                                    <input type="text" id="phone" class="form-control" placeholder="+375-29-111-1111">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <label class="font-weight-bold" for="message">Сообщение</label>
                                    <textarea name="message" id="message" cols="30" rows="5" class="form-control" placeholder="Ваше сообщение нам..."></textarea>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <input type="submit" value="Отправить" class="btn btn-primary text-white px-4 py-2">
                                </div>
                            </div>


                        </form>
                    </div>

                    <div class="col-lg-4">
                        <div class="p-4 mb-3 bg-white">
                            <h3 class="h5 text-black mb-3">Наши Контакты</h3>
                            <p class="mb-0 font-weight-bold">Адресс</p>
                            <p class="mb-4">Беларусь, г. Минск, ул. Городецкая 40А, 8 этаж</p>

                            <p class="mb-0 font-weight-bold">Телефон</p>
                            <p class="mb-4" style="color: #f1a21c"><b>+375 29 139 1488</b></p>

                            <p class="mb-0 font-weight-bold">Почта</p>
                            <p class="mb-0" style="color: #f1a21c"><b>zhukovichegoralf@gmail.com</b></p>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row w-100">
            <div class="col-lg-6 my-4">
                <iframe
                        src=https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2348.2395542747663!2d27.671628877182158!3d53.94525272974289!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46dbcecce4d9ef8d%3A0x2e20f2e121cf01c2!2z0YPQuy4g0JPQvtGA0L7QtNC10YbQutCw0Y8gNDDQsCwg0JzQuNC90YHQuiwg0JzQuNC90YHQutCw0Y8g0L7QsdC70LDRgdGC0Yw!5e0!3m2!1sru!2sby!4v1702842075950!5m2!1sru!2sby" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                        class="w-100" height="400" allowfullscreen="" loading="lazy"></iframe>
            </div>
            <div class="col-lg-6 my-4 d-flex align-items-center">
                <div>
                    <h6>Карта нашего местонахождения</h6>
                    <p>Это ТОЧНО не дом Владимира Черкаса, честно</p>
                    <p><a href="aboutPage">Подробнее о нас</a>.</p>
                    <p>Наш спортивный зал уютно расположен в самом сердце города, предоставляя легкий доступ и удобство для всех.
                        Загляните к нам, чтобы открыть для себя мир фитнеса и заботы о своем здоровье.</p>
                </div>
            </div>
        </div>
    </div>

    </body>
</@t.template>