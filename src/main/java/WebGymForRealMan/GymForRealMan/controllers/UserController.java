package WebGymForRealMan.GymForRealMan.controllers;

import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

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

    @GetMapping("/registration")
    public String registration(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model){
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует!");
            return "registration";
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
}
