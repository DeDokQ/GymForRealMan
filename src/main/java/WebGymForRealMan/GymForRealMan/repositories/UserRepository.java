package WebGymForRealMan.GymForRealMan.repositories;

import WebGymForRealMan.GymForRealMan.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

    void deleteById(Long id);

    User findUserById(Long id);
}
