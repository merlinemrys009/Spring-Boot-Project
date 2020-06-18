package rab3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import rab3.controller.dto.ProfileDTO;
//import rab3.controller.mail.EmailService;
import rab3.controller.mail.Mail;
import rab3.dao.entity.ProfileEntity;
import rab3.service.ProfileService;

@Controller
public class ProfileController {
	@Autowired
	private ProfileService profileService;

//	@Autowired
//	EmailService emailService;

	@GetMapping("/profile")
	public String showPaginatedData(@RequestParam(required = false, defaultValue = "1") String pageid, Model model) {
		int pageSize = 3;
		int ppageid = Integer.parseInt(pageid);
		if (ppageid < 0) {
			ppageid = 1;
		}
		// 2
		// 6
		if (ppageid > 1) {
			ppageid = (ppageid - 1) * pageSize + 1;
		}
		List<ProfileDTO> profileDTOs = profileService.findProfile(ppageid, pageSize);
		Long totalRecords = profileService.findCounts();

		model.addAttribute("p", profileDTOs);
		model.addAttribute("recordStarts", ppageid);
		model.addAttribute("pgsize", pageSize);
		model.addAttribute("pgid", pageid);
		model.addAttribute("pros", totalRecords);
		return "Profile";
	}

	@GetMapping("/imageLoader")
	public void showImage(@RequestParam int id, HttpServletResponse httpServletResponse) throws IOException {
		byte[] photo = profileService.findPhotoById(id);
		httpServletResponse.setContentType("image/png && image/jpg && image/gif");
		ServletOutputStream outputStream = httpServletResponse.getOutputStream();
		if (photo != null && photo.length > 0) {
			outputStream.write(photo);
		} else {
			outputStream.write(new byte[] {});
		}
		// go to the client
		outputStream.flush();
	}

	@GetMapping("/Search")
	public String searchForProfilepg() {
		return "Search";
	}

	@PostMapping("/Search")
	public String searchForProfilepg(@RequestParam String email, Model model) {
		ProfileEntity s_profile = profileService.findSingleProfile(email);
		System.out.println("profile values is" + s_profile);
		if (s_profile != null) {
			model.addAttribute("searchP", s_profile);
		} else {
			model.addAttribute("searchP", "Profile not found");
		}
		return "Search";
	}

	@PostMapping("/ForgotPassword")
	public String forgetPasswordPage(@RequestParam String email, Model model) {
		String passsoword = profileService.findPassword(email).get().getPassword();
		if (passsoword != null) {
			model.addAttribute("p", "Your Password  =  " + passsoword);
		} else {
			model.addAttribute("p", "Email is Invalid- please enter valid email");
		}
		return "ForgotPassword";
	}

	@GetMapping("/ForgotPassword")
	public String forgetPasswordPage() {
		return "ForgotPassword";
	}

	@GetMapping("/Register")
	public String registerPage(Model model) {
		model.addAttribute("pros", profileService.findCounts());
		return "Register";
	}

	@GetMapping("/gregister")
	public String getRegistration() {
		return "Register";
	}

	@PostMapping("/Register")
	public String registerPostPage(@ModelAttribute ProfileDTO profileDTO, RedirectAttributes redirectAttributes,
			Model model) {
		System.out.println(model);
		profileService.persist(profileDTO);//
		model.addAttribute("pros", profileService.findCounts());
		redirectAttributes.addFlashAttribute("pros", profileService.findCounts());
		redirectAttributes.addFlashAttribute("msg", "You are successfully registered!!!");
		return "redirect:/gregister?msg=You are successfully registered!!!&pros=" + profileService.findCounts();
	}

	@GetMapping("/editProfile")
	public String editProfile(@RequestParam int id, Model model) {
		ProfileDTO profileDTO = profileService.findProfileById(id);
		model.addAttribute("p", profileDTO);
		return "Edit";
	}

	@PostMapping("/updateProfile")
	public String postEditProfile(@ModelAttribute ProfileDTO profileDTO, Model model) {
		profileService.updateProfile(profileDTO);
		model.addAttribute("p", profileDTO);
		model.addAttribute("msg", "Profile has successfully updated!!");
		return "Edit";
	}

	@GetMapping("/deleteProfile")
	public String deleteProfile(@RequestParam int id, Model model) {
		profileService.deleteProfileById(id);
		model.addAttribute("msg", "Profile Deleted Successfully");
		return "redirect:/profile";
	}

	@GetMapping("/email")
	public String emailsender(Model model) {
		Mail mainl=new Mail();
		profileService.sendSimpleMessage(mainl);
		return "demo-email";

	}
}
