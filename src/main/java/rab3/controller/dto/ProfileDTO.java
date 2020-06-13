package rab3.controller.dto;

import java.sql.Timestamp;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class ProfileDTO {
	private int id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String gender;
	private MultipartFile photo;
	private Timestamp doe;
	private String role;
	private byte[] hphoto;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	// public Timestamp getDoe() {
	// return doe;
	// }
	//
	// public void setDoe(Timestamp doe) {
	// this.doe = doe;
	// }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public Timestamp getDoe() {
		return doe;
	}

	public void setDoe(Timestamp doe) {
		this.doe = doe;
	}

	public byte[] getHphoto() {
		return hphoto;
	}

	public void setHphoto(byte[] hphoto) {
		this.hphoto = hphoto;
	}

	@Override
	public String toString() {
		return "ProfileDTO [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", gender=" + gender + ", photo=" + photo + ", doe=" + doe + ", role=" + role
				+ ", hphoto=" + Arrays.toString(hphoto) + "]";
	}

	

}
