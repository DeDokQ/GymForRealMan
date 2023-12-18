<#import "staticTemplate/template.ftlh" as t>
<@t.template user>

    <div class="site-wrap">

        <div class="site-blocks-cover inner-page" style="background-image: url('img/hero_b1_1.jpg');" data-aos="fade"
             data-stellar-background-ratio="0.5">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-7 text-center" data-aos="fade">
                    <h1 style="color:#f1a21c; text-shadow: 1px 1px 1px #000;">Подробнее о курсе</h1>
                </div>
            </div>
        </div>
        <section class="h-100 h-custom" style="background-color: #eee;">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card shopping-cart" style="border-radius: 15px;">
                            <div class="card-body text-black">

                                <div class="row">
                                    <div class="col-lg-6 px-5 py-4">

                                        <h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Подробнее о курсе</h3>
                                        <div class="d-flex align-items-center mb-5">
                                            <div class="flex-shrink-0">
                                                <#list images as img>
                                                    <img src="/images/${img.id}" class="img-fluid"
                                                         style="width: 150px;"/>
                                                </#list>
                                            </div>
                                        </div>

                                        <hr class="mb-4" style="height: 2px; background-color: #1266f1; opacity: 1;">

                                        <div class="d-flex justify-content-between px-x">
                                            <p class="fw-bold mr-3">Название курса:</p>
                                            <p class="fw-bold">${course.title}</p>
                                        </div>
                                        <div class="d-flex justify-content-between px-x">
                                            <p class="fw-bold mr-3" style="margin-right: 30%;">Описание курса:</p>
                                            <p class="fw-bold">${course.description}</p>
                                        </div>
                                        <div class="d-flex justify-content-between px-x">
                                            <p class="fw-bold mr-3">Главный тренер:</p>
                                            <p class="fw-bold">${course.master}</p>
                                        </div>
                                        <div class="d-flex justify-content-between px-x">
                                            <p class="fw-bold mr-3">Автор курса:</p>
                                            <p class="fw-bold"><a href="/user/${course.user.id}">${course.user.name}</a>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between p-2 mb-2"
                                             style="background-color: #e1f5fe;">
                                            <h5 class="fw-bold mb-0">Цена:</h5>
                                            <h5 class="fw-bold mb-0">${course.price} BYN</h5>
                                        </div>

                                    </div>
                                    <div class="col-lg-6 px-5 py-4">

                                        <h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Записаться!</h3>

                                        <form class="mb-5">

                                            <div class="form-outline mb-5">
                                                <label class="form-label" for="typeText">Ваша почта</label>
                                                <input type="text" id="typeText" class="form-control form-control-lg"
                                                       placeholder="Ваша-почта@gmail.com" minlength="6" maxlength="32"/>
                                            </div>

                                            <div class="form-outline mb-5">
                                                <label class="form-label" for="typeName">ФИО</label>
                                                <input type="text" id="typeName" class="form-control form-control-lg"
                                                       minlength="6" placeholder="Иванов Иван Иванович"/>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-5">
                                                    <div class="form-outline">
                                                        <label class="form-label" for="typeExp">Название курса, который
                                                            Вас интересует</label>
                                                        <input type="text" class="form-control form-control-lg"
                                                               minlength="6" id="exp" placeholder="Новогодние курсы"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <button type="button" class="btn btn-primary rounded text-white px-4" style="background-color: #f1a21c;">Записаться!
                                            </button>

                                            <p class="mb-5">Помните, что с Вами свяжутся наши эксперты! <a
                                                        href="contactPage" style="color: #f1a21c;">Остались вопросы? Вам сюда!</a>.</p>

                                            <h5 class="fw-bold mb-5" style="position: absolute; bottom: 0;">
                                                <a href="programPage"><i class="fas fa-angle-left me-2" style="color: #f1a21c;">Вернуться к
                                                        курсам</i></a>
                                            </h5>

                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

</@t.template>