package WebGymForRealMan.GymForRealMan.controllers;

import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.services.CourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class CourseController {
    private final CourseService courseService;

    @GetMapping("/")
    public String courses(@RequestParam(name="title", required = false) String title, Model model) {
        model.addAttribute("courses", courseService.listCourse(title));
        return "courses";
    }

    @GetMapping("/course/{id}")
    public String courseInfo(@PathVariable Long id, Model model) {
        Course course = courseService.getCourseById(id);
        model.addAttribute("course", course);
        model.addAttribute("images", course.getImages());
        return "courseInfo";
    }

    @PostMapping("/course/create")
    public String createCourse(
            @RequestParam("file1") MultipartFile file1,
            @RequestParam("file2") MultipartFile file2,
            @RequestParam("file3") MultipartFile file3,
            @RequestParam("file4") MultipartFile file4,
            Course course
    ) throws IOException {
        courseService.saveCourse(course, file1, file2, file3, file4);
        return "redirect:/";
    }

    @PostMapping("/course/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        courseService.deleteCourse(id);
        return "redirect:/";
    }
}
