package rab3.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import rab3.controller.dto.Image;

@RestController
public class ImagController {

	@GetMapping("/loo")
	public Image getImage() {
		Image image = new Image();
		image.setName("Bialla");
		image.setType("png&&jpg&&gif");
		return image;
	}

}
