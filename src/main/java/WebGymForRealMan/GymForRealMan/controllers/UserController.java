package WebGymForRealMan.GymForRealMan.controllers;

import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.services.CourseService;
import WebGymForRealMan.GymForRealMan.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final CourseService courseService;

    @GetMapping("/login")
    public String login(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @PostMapping("/logout")
    public String logout(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "redirect:/";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model){
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует!");
            return "redirect:/login";
        }
        return "redirect:/login";
    }

    @GetMapping("/profile")
    public String profile(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/user/{user}")
    public String userProfile(@PathVariable("user") User user, Model model, Principal principal){
        model.addAttribute("user", user);
        model.addAttribute("courses", user.getCourses());
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        return "userProfile";
    }

    @GetMapping("/testPage")
    public String testPage(){
        return "testPage";
    }

    @GetMapping("/helpPage")
    public String helpPage(){
        return "index.ftlh";
    }

    @GetMapping("/mainPage")
    public String mainPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        return "index";
    }
}
