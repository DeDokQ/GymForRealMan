package WebGymForRealMan.GymForRealMan.configurations;

import WebGymForRealMan.GymForRealMan.services.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalAuthentication
public class SecurityConfig {
    private final CustomUserDetailsService userDetailsService;

    @Bean
    SecurityFilterChain securityFilterChain(final HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/").permitAll()
                        .requestMatchers("/registration").permitAll()

                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        .requestMatchers("/course/create").authenticated()
                        .requestMatchers("/course/delete").permitAll()
                        .requestMatchers("/user/**").authenticated()
                        .requestMatchers("/course/**").authenticated()

                        .requestMatchers("/admin/user/**").hasRole("ADMIN")
                        .requestMatchers("/images/**").permitAll()

                        .requestMatchers("/profile").authenticated()
                        .requestMatchers("/your/courses/**").authenticated()

                     //   .requestMatchers("/static/").permitAll()
                        .requestMatchers("/css/**").permitAll()
                        .requestMatchers("/fonts/**").permitAll()
                        .requestMatchers("/img/**").permitAll()
                        .requestMatchers("/js/**").permitAll()
                        .requestMatchers("/scss/**").permitAll()

                        .requestMatchers("/mainPage").permitAll()
                        .requestMatchers("/aboutPage").permitAll()
                        .requestMatchers("/contactPage").permitAll()
                        .requestMatchers("/coachPage").permitAll()
                        .requestMatchers("/eventsPage").permitAll()
                        .requestMatchers("/programPage").permitAll()

                        .requestMatchers("/login/**").permitAll()
                )
                .formLogin((form) -> form
                        .loginPage("/login")
                        .permitAll()
                        .defaultSuccessUrl("/mainPage").permitAll()
                )
                .logout((logout) ->
                        logout.logoutSuccessUrl("/mainPage")
                );


        return http.build();
    }

//    @Bean
//    public DaoAuthenticationProvider daoAuthenticationProvider() {
//        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
//        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
//        daoAuthenticationProvider.setUserDetailsService(userDetailsService);
//        return daoAuthenticationProvider;
//    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder(8);
    }

//    @Bean
//    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws  Exception{
//        return authenticationConfiguration.getAuthenticationManager();
//    }
}
