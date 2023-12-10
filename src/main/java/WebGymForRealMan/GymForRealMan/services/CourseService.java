package WebGymForRealMan.GymForRealMan.services;

import WebGymForRealMan.GymForRealMan.controllers.CourseController;
import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.models.Image;
import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.repositories.CourseRepository;
import WebGymForRealMan.GymForRealMan.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CourseService {
    private final CourseRepository courseRepository;
    private final UserRepository userRepository;
    public List<Course> listCourse(String title) {
        if (title != null) return courseRepository.findCoursesByTitle(title);
        return courseRepository.findAll();
    }

    /* Principal - обёртка, число юзеров в нашем приложении*/

    public void saveCourse(Principal principal, Course course, MultipartFile file1, MultipartFile file2, MultipartFile file3, MultipartFile file4) throws IOException {
        course.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        Image image4;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            course.addImage(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            course.addImage(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            course.addImage(image3);
        }
        if (file4.getSize() != 0) {
            image4 = toImageEntity(file4);
            course.addImage(image4);
        }
        log.info("Новый курс ` {} ` успешно сохранен!", course.getTitle());
        Course courseFromDb = courseRepository.save(course);
        courseFromDb.setPreviewImageId(course.getImages().get(0).getId());
        courseRepository.save(course);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setTitle(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteCourse(User user, Long id) {
        // courseRepository.deleteById(id);
        Course course = courseRepository.findById(id)
                .orElse(null);
        if (course != null) {
            if (course.getUser().getId().equals(user.getId())) {
                courseRepository.delete(course);
                log.info("Курс тренажёрного зала GFRM с ID:{} - был удален", id);
            } else {
                log.error("У тренера {} нету курса с ID: {}", user.getEmail(), id);
            }
        } else {
            log.error("Курса с данным ID: {} не существует", id);
        }
    }

    public Course getCourseById(Long id) {
        return courseRepository.findById(id).orElse(null);
    }
}