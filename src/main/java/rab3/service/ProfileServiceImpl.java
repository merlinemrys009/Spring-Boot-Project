package rab3.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import rab3.SpringBootStarter;
import rab3.controller.dto.ProfileDTO;
import rab3.controller.mail.EmailService;
import rab3.controller.mail.Mail;
import rab3.dao.ProfileDaoRep;
import rab3.dao.entity.ProfileEntity;
import rab3.springboot.utils.Utils;

@Service
@Transactional
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDaoRep profileDao;
	@Autowired
	private EmailService emailService;

	@Override
	public ProfileDTO auth(String username, String password) {
		Optional<ProfileEntity> result = profileDao.findByUsernameAndPassword(username, password);
		ProfileDTO profileDTO = null;
		if (result != null) {
			profileDTO = new ProfileDTO();
			BeanUtils.copyProperties(result.get(), profileDTO);
		}
		return profileDTO;
	}

	@Override
	public byte[] findPhotoById(int id) {
		Optional<ProfileEntity> result = profileDao.findById(id);
		return result.get().getHphoto();
	}

	@Override
	public String findPassword(String email) {
		return profileDao.findByEmail(email).get().getPassword();
	}

	@Override
	public String persist(ProfileDTO profileDTO) {
		ProfileEntity profileEntity = new ProfileEntity();
		BeanUtils.copyProperties(profileDTO, profileEntity);
		try {
			profileEntity.setHphoto(profileDTO.getPhoto().getBytes());
			profileEntity.setRole("customer");
			profileEntity.setDoe(new Timestamp(new Date().getTime()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		profileDao.save(profileEntity);
		return "success";
	}

	@Override
	public ProfileDTO findProfileById(int id) {
		ProfileEntity profileEntity = profileDao.findById(id).get();
		ProfileDTO profileDTO = new ProfileDTO();
		BeanUtils.copyProperties(profileEntity, profileDTO);
		return profileDTO;
	}

	@Override
	public String updateProfile(ProfileDTO profileDTO) {
		ProfileEntity profileEntity = new ProfileEntity();
		BeanUtils.copyProperties(profileDTO, profileEntity);
		try {
			if (profileDTO.getPhoto() != null
					&& profileDTO.getPhoto().getBytes() != null & profileDTO.getPhoto().getBytes().length > 5) {
				profileDTO.setHphoto(profileDTO.getPhoto().getBytes());
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		ProfileEntity dbProfileEntity = profileDao.findById(profileDTO.getId()).get();
		Utils.copyNonNullProperties(profileEntity, dbProfileEntity);
		return "done";

	}

	@Override
	public ProfileEntity findSingleProfile(String email) {
		Optional<ProfileEntity> result = profileDao.findByEmail(email);
		return result.get();
	}

	@Override
	public Long findCounts() {
		return profileDao.count();

	}

	@Override
	public void deleteProfileById(int id) {
		profileDao.deleteById(id);

	}

	@Override
	public List<ProfileDTO> findProfile(int ppageid, int pageSize) {
		Pageable paging = PageRequest.of(ppageid, pageSize);
		Page<ProfileEntity> listOfEntity = profileDao.findAll(paging);
		List<ProfileDTO> profileDTO = new ArrayList<>();
		for (ProfileEntity peEntity : listOfEntity) {
			ProfileDTO profileDTOs = new ProfileDTO();
			BeanUtils.copyProperties(peEntity, profileDTOs);
			profileDTO.add(profileDTOs);
		}
		return profileDTO;

	}

	@Override
	public void sendSimpleMessage(Mail mail) {
		
		try {
			//Logger log = LoggerFactory.getLogger(SpringBootStarter.class);
			//log.info("Please Email me if you get this message");
			mail.setFrom("no-reply@youtube.com");
			mail.setTo("joker3drt@gmail.com");
			mail.setContent("Hello We Appologies for Inconvience");
			mail.setSubject("Please Email me if you get this message");

			Map<String, String> model = new HashMap<>();
			model.put("name", "James");
			model.put("location", "Unknown");
			model.put("signature", "http://James.com");
			//mail.setModel(model);

			emailService.sendSimpleMessage(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}