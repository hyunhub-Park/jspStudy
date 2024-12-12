package com.flo.model;

public class MemberVO
{
	private String id;
    private String pwd;
    private String name;
    private String phone1;
    private String phone2;
    private String phone3;
    private String email;
    private String zipCode;
    private String adddress1;
    private String address2;
	
    
    
    public MemberVO() {
		super();
	}



	public MemberVO(String id, String pwd, String name, String phone1, String phone2, String phone3, String email,
			String zipCode, String adddress1, String address2) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email = email;
		this.zipCode = zipCode;
		this.adddress1 = adddress1;
		this.address2 = address2;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPhone1() {
		return phone1;
	}



	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}



	public String getPhone2() {
		return phone2;
	}



	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}



	public String getPhone3() {
		return phone3;
	}



	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getZipCode() {
		return zipCode;
	}



	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}



	public String getAdddress1() {
		return adddress1;
	}



	public void setAdddress1(String adddress1) {
		this.adddress1 = adddress1;
	}



	public String getAddress2() {
		return address2;
	}



	public void setAddress2(String address2) {
		this.address2 = address2;
	}
}