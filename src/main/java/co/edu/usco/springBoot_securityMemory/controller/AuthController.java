package co.edu.usco.springBoot_securityMemory.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AuthController {

    @GetMapping("/")
    public String root() {
        return "redirect:/home";
    }

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, Authentication auth) {
		new SecurityContextLogoutHandler().logout(request, response, auth);
		return "redirect:/login?logout";
	}

	@GetMapping("/home")
	public String home() {
		return "home"; // 200 OK
	}

    @GetMapping("/ping")
    @ResponseBody
    public String ping() {
        return "controller works";
    }
}