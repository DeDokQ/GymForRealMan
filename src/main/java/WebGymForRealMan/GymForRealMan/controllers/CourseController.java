package WebGymForRealMan.GymForRealMan.controllers;

import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.services.CourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class CourseController {
    private final CourseService courseService;

    @GetMapping("/")
    public String courses(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course) {
        model.addAttribute("courses", courseService.listCourse(title));
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        model.addAttribute("images", course.getImages());
        return "courses";
    }

    @GetMapping("/mainPage")
    public String mainPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course) {
        model.addAttribute("courses", courseService.listCourse(title));
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        model.addAttribute("images", course.getImages());
        return "mainPage";
    }

    @GetMapping("/aboutPage")
    public String aboutPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        return "aboutPage";
    }

    @GetMapping("/contactPage")
    public String contactPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        return "contactPage";
    }

    @GetMapping("/programPage")
    public String programPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        model.addAttribute("courses", courseService.listCourse(title));
        model.addAttribute("images", course.getImages());
        return "programPage";
    }

    @GetMapping("/coachPage")
    public String coachPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        return "coachPage";
    }

    @GetMapping("/eventsPage")
    public String eventsPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        return "eventsPage";
    }

    @GetMapping("/course/{id}")
    public String courseInfo(@PathVariable Long id, Model model, Principal principal) {
        Course course = courseService.getCourseById(id);
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
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
            Course course,
            Principal principal
    ) throws IOException {
        courseService.saveCourse(principal, course, file1, file2, file3, file4);
        return "redirect:/your/courses";
    }

    @PostMapping("/course/delete/{id}")
    public String deleteCourse(@PathVariable("id") Long id) {
        courseService.deleteCourse(id);
        return "redirect:/your/courses";
    }

    @GetMapping("/your/courses")
    public String userCourses(Principal principal, Model model, Course course) {
        User user = courseService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("courses", user.getCourses());
        model.addAttribute("images", course.getImages());
        return "yourCourses";
    }
}
