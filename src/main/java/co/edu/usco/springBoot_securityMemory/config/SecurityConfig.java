package co.edu.usco.springBoot_securityMemory.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
public class SecurityConfig {

	@Bean
	public UserDetailsService userDetailsService() {
		InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
		manager.createUser(User.withUsername("admin").password("{noop}admin123").roles("ADMIN").build());
		manager.createUser(User.withUsername("user").password("{noop}user123").roles("USER").build());
		manager.createUser(User.withUsername("editor").password("{noop}editor123").roles("EDITOR").build());
		manager.createUser(User.withUsername("creator").password("{noop}creator123").roles("CREATOR").build());
		return manager;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
			.authorizeHttpRequests(auth -> auth
				.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.ERROR).permitAll()   // <-- add this
				.requestMatchers("/login", "/logout", "/error", "/error/**", "/ping").permitAll()
				.requestMatchers("/admin/**").hasRole("ADMIN")
				.requestMatchers("/user/**").hasRole("USER")
				.requestMatchers("/editor/**").hasAnyRole("EDITOR", "ADMIN")
				.requestMatchers("/creator/**").hasAnyRole("CREATOR", "ADMIN")
				.anyRequest().authenticated())

			.formLogin(form -> form
				.loginPage("/login")              
				.loginProcessingUrl("/doLogin")   
				.defaultSuccessUrl("/home", true)
				.failureUrl("/login?error"))
			.logout(logout -> logout.disable())  
			.exceptionHandling(ex -> ex.accessDeniedPage("/error/403"));
		return http.build();
	}
}