package rab3.rest.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import rab3.controller.dto.ApplicationVO;
import rab3.controller.dto.ProfileDTO;
import rab3.service.ProfileService;

@RestController
@RequestMapping("/api2")
public class ProfileRestController {

	@Autowired
	private ProfileService profileService;
	
	@GetMapping("password/email")
	public ApplicationVO findPasswordEmail(@RequestParam("email") String email ) {
		Optional<ProfileDTO> optional=profileService.findPassword(email);
		  ApplicationVO applicationVO=new ApplicationVO();
		  if(optional.isPresent()) {
			  ProfileDTO profileDTO=optional.get();
			  String salutation="Mr.";
			  if(!profileDTO.getGender().equalsIgnoreCase("Male")) {
				  salutation="Ms";
			  }
			  applicationVO.setCode("1");
			  applicationVO.setMessage("Hello "+salutation+" "+profileDTO.getName()+" your password is : "+profileDTO.getPassword());
		  }else {
			  applicationVO.setCode("0");
			  applicationVO.setMessage("Sorry , Email doesn't exist");
		  }
		  applicationVO.setEmail(email);
		  return applicationVO;
	}

	
	@PostMapping("/profile")
	public ApplicationVO registerPostPage(@RequestBody ProfileDTO profileDTO) {
		profileService.persist(profileDTO);
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is created ");
		/*{
			"code":"O8182",
			"message":profile is created""
		}*/
		return applicationVO;
	}

	@PutMapping("/profile")
	public ApplicationVO updateProfile(@RequestBody ProfileDTO profileDTO) {
		profileService.updateProfile(profileDTO);
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is update ");
		return applicationVO;
	}


	//Jackson Mapper or GSON
	@GetMapping("/profile")
	public List<ProfileDTO> showProfiles() {
		List<ProfileDTO> profileDTOs = profileService.findProfile(10, 10);
		return profileDTOs;
	}

	//api2/profiles/3
	@GetMapping("/profile/{pid}")
	public ProfileDTO editProfile(@PathVariable("pid") int gid) {
		ProfileDTO profileDTO = profileService.findProfileById(gid);
		return profileDTO;
	}

	@DeleteMapping("/profile/{pid}")
	public ApplicationVO deleteProfile(@PathVariable("pid") int gid) {
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is deleted ");
		return applicationVO;
	}

}
