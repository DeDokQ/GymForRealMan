package WebGymForRealMan.GymForRealMan.controllers;

import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.services.CourseService;
import WebGymForRealMan.GymForRealMan.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final CourseService courseService;

    @PostMapping("/logout")
    public String logout(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "redirect:/mainPage";
    }

    @GetMapping("/login")
    public String login(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));

        return "login";
    }

    @GetMapping("/registration")
    public String registration(
            Model model,
            // @RequestParam(name = "errorMessage", defaultValue = "") String errorMessage,
            @ModelAttribute("errorMessage") String errorMessage
    ) {
        model.addAttribute("errorMessage", errorMessage);

        return "/registration";
    }

    @PostMapping("/registration")
    public String createUser(
            User user, Model model,
            @RequestParam(name = "errorMessage", defaultValue = "") String errorMessage,
            RedirectAttributes redirectAttributes
    ) {
        switch(userService.createUser(user)){
            case 1:
                redirectAttributes.addFlashAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует!");
                return "redirect:/registration";
            case 2:
                redirectAttributes.addFlashAttribute("errorMessage", "Пароль должен быть от 6-и до 18-и символов и не содержать пробелов!");
                return "redirect:/registration";
            case 3:
                return "/login";
            default:
                redirectAttributes.addFlashAttribute("errorMessage", "Не удалось установить соединение с сервером!");
                return "redirect:/registration";
        }
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

    @GetMapping("/mainPage")
    public String mainPage(@RequestParam(name="title", required = false) String title, Principal principal, Model model, Course course){
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
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
}
