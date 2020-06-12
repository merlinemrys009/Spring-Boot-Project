package rab3.service;

import java.util.List;

import rab3.controller.dto.ProfileDTO;
import rab3.dao.entity.ProfileEntity;

public interface ProfileService {

	String findPassword(String email);

	ProfileDTO findProfileById(int id);

	ProfileEntity findSingleProfile(String email);

	byte[] findPhotoById(int id);

	String persist(ProfileDTO profileDTO);

	ProfileDTO auth(String username, String password);

	List<ProfileDTO> findProfile();

	String updateProfile(ProfileDTO profileDTO);

	Long findCounts();

	void deleteProfileById(int id);

}
