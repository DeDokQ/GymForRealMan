package WebGymForRealMan.GymForRealMan.services;

import WebGymForRealMan.GymForRealMan.models.User;
import WebGymForRealMan.GymForRealMan.models.enums.Role;
import WebGymForRealMan.GymForRealMan.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);

        log.info("В нашем данжоне пополнение! -> {}", email);

        return true;
    }

}
