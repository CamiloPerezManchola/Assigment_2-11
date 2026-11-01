package co.edu.usco.springBoot_securityMemory.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CustomErrorController implements ErrorController {

	@RequestMapping("/error")
	public String handleError(HttpServletRequest request, HttpServletResponse response, Model model) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		int code = (status != null) ? Integer.parseInt(status.toString()) : 500;
		response.setStatus(code);
		return fill(model, code);
	}

	// Target of accessDeniedPage (e.g. editor -> /creator/create)
	@RequestMapping("/error/403")
	public String forbidden(HttpServletResponse response, Model model) {
		response.setStatus(403);
		return fill(model, 403);
	}

	private String fill(Model model, int code) {
		String message = switch (code) {
			case 400 -> "Bad request";
			case 401 -> "You must log in";
			case 403 -> "You don't have permission to access this page";
			case 404 -> "Page not found";
			case 405 -> "Method not allowed";
			case 500 -> "Internal server error";
			default -> "Unexpected error";
		};
		model.addAttribute("code", code);
		model.addAttribute("message", message);
		return "errorPage";
	}
}