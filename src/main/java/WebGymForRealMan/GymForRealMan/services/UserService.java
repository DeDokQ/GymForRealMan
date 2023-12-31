package WebGymForRealMan.GymForRealMan.services;

import WebGymForRealMan.GymForRealMan.models.Course;
import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.models.enums.Role;
import WebGymForRealMan.GymForRealMan.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public int createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return 1;
        if (user.getPassword().length() < 6 || user.getPassword().length() > 18
                || user.getPassword().contains(String.valueOf(' '))) return 2;

        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);

        log.info("В нашем данжоне пополнение! -> {}", email);
        userRepository.save(user);
        return 3;
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public List<User> list(){
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if(user != null){
            if(user.isActive()){
                user.setActive(false);
                log.info("Пользователь {} был забанен. ID: {}", user.getEmail(), user.getId());
            } else {
                user.setActive(true);
                log.info("Пользователь {} был раззабанен. ID: {}", user.getEmail(), user.getId());
            }

            userRepository.save(user);
        }
    }

    public void createUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for(String key : form.keySet()){
            if(roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public User getUserById(Long id){
        return userRepository.findUserById(id);
    }
}
