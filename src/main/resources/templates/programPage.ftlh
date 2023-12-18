<#import "staticTemplate/template.ftlh" as t>
<@t.template user>
    <head>
        <title>Crossfits &mdash; Colorlib Website Template</title>
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


        <div class="site-blocks-cover inner-page" style="background-image: url(img/hero_b1_1.jpg);" data-aos="fade"
             data-stellar-background-ratio="0.5">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-7 text-center" data-aos="fade">
                    <h1 style="color:#f1a21c; text-shadow: 1px 1px 1px #000;">Программы</h1>
                    <span class="caption d-block text-white"><h4 style="color:#f1a21c; text-shadow: 1px 1px 1px #000;"><b>Наши программы - лучшие!</b></h4></span>
                </div>
            </div>
        </div>

        <#list courses as course>
            <hr class="hr-warning" />
                <div class="site-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <#list course.getImages() as img>
                                    <p class="mb-5"><img src="/images/${img.id}" height="60px" alt="Image"
                                                         class="img-fluid rounded"/></p>
                                    <#break>
                                </#list>
                            </div>
                            <div class="col-lg-5 ml-auto">
                                <h2 class="site-section-heading mb-3">${course.title}</h2>
                                <p>Описание курса: ${course.description}</p>
                                <p class="mb-4">Главный тренер: ${course.master}</p>
                                <p><a href="/course/${course.id}" class="card-link">Подробнее о курсе</a></p>
                            </div>
                        </div>
                    </div>
                </div>
        <#else>
            <h3 style="text-align: center">Все курсы закончились...</h3>
        </#list>

        <div class="container site-section">
            <div class="row">

                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable">
                        <div class="pricingTable-header">
                            <h3 class="heading">Standard</h3>
                            <span class="subtitle">Lorem ipsum dolor sit amet</span>
                            <div class="price-value">10
                                <span class="currency">$</span>
                                <span class="month">/mo</span>
                            </div>
                        </div>
                        <ul class="pricing-content">
                            <li>50GB Disk Space</li>
                            <li>50 Email Accounts</li>
                            <li>50GB Monthly Bandwidth</li>
                            <li>10 Subdomains</li>
                            <li>15 Domains</li>
                        </ul>
                        <a href="#" class="read">sign up<i class="fa fa-angle-right"></i></a>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable">
                        <div class="pricingTable-header">
                            <h3 class="heading">Business</h3>
                            <span class="subtitle">Lorem ipsum dolor sit amet</span>
                            <div class="price-value">20
                                <span class="currency">$</span>
                                <span class="month">/mo</span>
                            </div>
                        </div>
                        <ul class="pricing-content">
                            <li>60GB Disk Space</li>
                            <li>60 Email Accounts</li>
                            <li>60GB Monthly Bandwidth</li>
                            <li>15 Subdomains</li>
                            <li>20 Domains</li>
                        </ul>
                        <a href="#" class="read">sign up<i class="fa fa-angle-right"></i></a>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable">
                        <div class="pricingTable-header">
                            <h3 class="heading">Premium</h3>
                            <span class="subtitle">Lorem ipsum dolor sit amet</span>
                            <div class="price-value">30
                                <span class="currency">$</span>
                                <span class="month">/mo</span>
                            </div>
                        </div>
                        <ul class="pricing-content">
                            <li>70GB Disk Space</li>
                            <li>70 Email Accounts</li>
                            <li>70GB Monthly Bandwidth</li>
                            <li>20 Subdomains</li>
                            <li>25 Domains</li>
                        </ul>
                        <a href="#" class="read">sign up<i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </body>
</@t.template>