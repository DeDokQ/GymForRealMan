package WebGymForRealMan.GymForRealMan.repositories;

import WebGymForRealMan.GymForRealMan.models.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Long> {
    List<Course> findCoursesByTitle(String title);

}
