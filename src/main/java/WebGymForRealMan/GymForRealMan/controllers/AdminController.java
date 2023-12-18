package WebGymForRealMan.GymForRealMan.controllers;

import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.models.enums.Role;
import WebGymForRealMan.GymForRealMan.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal){
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin";
    }

    @PostMapping("/admin/u/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{id}")
    public String userEdit(@PathVariable("id") Long id, Model model){
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form){
        userService.createUserRoles(user, form);
        return "redirect:/admin";
    }
}
