package DTO;

public class memberDTO {

	private String member_name;
	private String member_id;
	private String member_pw;
	private String member_address;
	
	private String name;
	private String detail;
	private int price;
	
	
	public memberDTO() {
		
	}
	
	public memberDTO(String member_name, String member_id, String member_pw, String member_aderess, 
		String name, String detail, int price) {
		
		
		this.member_name=member_name;
		this.member_id=member_id;
		this.member_pw=member_pw;
		this.member_address=member_address;
	
		this.name=name;
		this.detail=detail;
		this.price=price;
	
	}
	
	public void setMEMBER_NAME(String member_name) {
		this.member_name=member_name;
	}
	public String getMEMBER_NAME() {
		return member_name;
	}
	public void setMEMBER_ID(String member_id) {
		this.member_id=member_id;
	}
	public String getMEMBER_ID() {
		return member_id;
	}
	public void setMEMBER_PW(String member_pw) {
		this.member_pw=member_pw;
	}
	public String getMEMBER_PW() {
		return member_pw;
	}
	public void setMEMBER_ADDRESS(String member_address) {
		this.member_address=member_address;
	}
	public String getMEMBER_ADDRESS() {
		return member_address;
	}
	
	public void setNAME(String name) {
		this.name=name;
	}
	public String getNAME() {
		return name;
	}
	public void setDETAIL(String detail) {
		this.detail=detail;
	}
	public String getDETAIL() {
		return detail;
	}
	public void setPRICE(int price) {
		this.price=price;
	}
	public int getPRICE() {
		return price;
	}

}
