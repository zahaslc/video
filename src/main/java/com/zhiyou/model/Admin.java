package com.zhiyou.model;

public class Admin {
	
	private Integer admin_id;
	private String accounts;
	private String password;
	private String admin_remark;
	
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAccounts() {
		return accounts;
	}
	public void setAccounts(String accounts) {
		this.accounts = accounts;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdmin_remark() {
		return admin_remark;
	}
	public void setAdmin_remark(String admin_remark) {
		this.admin_remark = admin_remark;
	}
	@Override
	public String toString() {
		return "admin [admin_id=" + admin_id + ", accounts=" + accounts + ", password=" + password + ", admin_remark="
				+ admin_remark + "]";
	}
	public Admin( String accounts, String password, String admin_remark) {
		super();
	
		this.accounts = accounts;
		this.password = password;
		this.admin_remark = admin_remark;
	}
	public Admin( String accounts, String password) {
		super();
	
		this.accounts = accounts;
		this.password = password;
	}
	public Admin() {
		super();
	}
	
}
