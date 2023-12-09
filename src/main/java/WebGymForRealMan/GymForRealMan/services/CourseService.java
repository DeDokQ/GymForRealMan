package WebGymForRealMan.GymForRealMan.services;

import WebGymForRealMan.GymForRealMan.controllers.CourseController;
import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.models.Image;
import WebGymForRealMan.GymForRealMan.repositories.CourseRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CourseService {
    private final CourseRepository courseRepository;

    public List<Course> listCourse(String title) {
        if (title != null) return courseRepository.findCoursesByTitle(title);
        return courseRepository.findAll();
    }

    public void saveCourse(Course course, MultipartFile file1, MultipartFile file2, MultipartFile file3, MultipartFile file4) throws IOException {
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
        // Course productFromDb = courseRepository.save(course);
        course.setPreviewImageId(course.getImages().getFirst().getId());
        courseRepository.save(course);
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

    public void deleteCourse(Long id) {
        courseRepository.deleteById(id);
    }

    public Course getCourseById(Long id) {
        return courseRepository.findById(id).orElse(null);
    }
}