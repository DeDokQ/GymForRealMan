<#import "staticTemplate/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Ваши курсы</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Создать новый курс!
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/course/create" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label for="courseName">Название курса</label>
                <input type="text" required class="form-control" id="courseName" name="title">
            </div>

            <div class="form-group">
                <label for="description">Описание курса</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>

            <div class="form-group">
                <label for="date">Дата проведения</label>
                <textarea required class="form-control" id="date" name="date"></textarea>
            </div>

            <div class="form-group">
                <label for="master">Тренер</label>
                <textarea required class="form-control" id="master" name="master"></textarea>
            </div>

            <div class="form-group">
                <label for="price">Цена курса</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">₽</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Изображение 1/4</label>
                </div>
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Изображение 2/4</label>
                </div>
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Изображение 3/4</label>
                </div>
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file4" id="file4">
                    <label class="custom-file-label" for="file4">Изображение 4/4</label>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>

    <div class="card-columns">
        <#list courses as course>
            <a href="/course/${course.id}" class="course-link">
                <div class="card text-white bg-dark my-3 course">
                    <div class="card-top">
                        <form action="/course/delete/${course.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
<#--                    <img src="/images/${course.previewImageId}" class="card-img-top">-->
                    <div class="card-body">
                        <h5 class="card-title">${course.title}</h5>
                        <p class="card-text">${course.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${course.master}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">У вас нету активных созданных курсов!</h1>
        </#list>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
</@t.template>