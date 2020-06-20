package rab3.controller.dto;

public class AppNameId {
	
	private int id;
	private String appname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAppname() {
		return appname;
	}
	public void setAppname(String appname) {
		this.appname = appname;
	}
	@Override
	public String toString() {
		return "AppNameId [id=" + id + ", appname=" + appname + "]";
	}

}
