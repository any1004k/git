package org.zerock.domain;



public class Member1VO {
	
	private String id;
	private String  password;
	private String phone;
	private String  email;
	
    private String gender;
    private String name;
    private int birth_year;
    private int birth_month;
    private int birth_day;
    
    
    
    /*게터세터,투스트링*/
    
    @Override
	public String toString() {
		return "Member1VO [id=" + id + ", password=" + password + ", phone=" + phone + ", email=" + email + ", gender="
				+ gender + ", name=" + name + ", birth_year=" + birth_year + ", birth_month=" + birth_month
				+ ", birth_day=" + birth_day + "]";
	}
    
    
    
	public String getId() {
		return id;
	}
	
	
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBirth_year() {
		return birth_year;
	}
	public void setBirth_year(int birth_year) {
		this.birth_year = birth_year;
	}
	public int getBirth_month() {
		return birth_month;
	}
	public void setBirth_month(int birth_month) {
		this.birth_month = birth_month;
	}
	public int getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(int birth_day) {
		this.birth_day = birth_day;
	}
    
    
  
  
    
    
}
