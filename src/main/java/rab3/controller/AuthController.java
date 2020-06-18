package rab3.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import rab3.controller.dto.ProfileDTO;
import rab3.service.ProfileService;

@Controller
public class AuthController {

	@Autowired
	private ProfileService profileService;

	@GetMapping("/auth")
	public String auth() {
		return "Login"; // /aha.jsp
	}

	// action=auth
	// method = POST
	@PostMapping("/auth")
	public String auth(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
		ProfileDTO profileDTO = profileService.auth(username, password);
		if (profileDTO != null) {
			session.setAttribute("proS", profileDTO);
			model.addAttribute("p", profileDTO);
			model.addAttribute("msg","You have Login Successfully");
			return "Home";
		} else  {
			model.addAttribute("msg","Either Username or Password is Incorrect");
			return "Login";
		}
	}

}
