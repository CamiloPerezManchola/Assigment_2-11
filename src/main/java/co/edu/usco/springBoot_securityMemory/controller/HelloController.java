package co.edu.usco.springBoot_securityMemory.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

@Controller
public class HelloController {

	@GetMapping("/admin/hello")
	public String adminHello(Model model) {
		model.addAttribute("role", "Admin");
		return "hello";
	}

	@GetMapping("/user/hello")
	public String userHello(Model model) {
		model.addAttribute("role", "User");
		return "hello";
	}

	@GetMapping("/editor/hello")
	public String editorHello(Model model) {
		model.addAttribute("role", "Editor");
		return "hello";
	}

	@GetMapping("/creator/hello")
	public String creatorHello(Model model) {
		model.addAttribute("role", "Creator");
		return "hello";
	}

	// Editor trying to get here -> 403
	@GetMapping("/creator/create")
	public String createForm() {
		return "create";
	}

	// Successful response with a "good" status: 201 Created
	@PostMapping("/creator/create")
	public String create(Model model, HttpServletResponse response) {
		response.setStatus(HttpServletResponse.SC_CREATED);
		model.addAttribute("code", 201);
		model.addAttribute("message", "Resource created successfully");
		return "success";
	}

	// Forces a 500 for testing
	@GetMapping("/test/error")
	public String forceError() {
		throw new RuntimeException("Forced error");
	}
}