package com.nnxy.ldq.model.entity.chat;



//@AllArgsConstructor //构造方法
//@NoArgsConstructor //构造方法
//@Data//get set
//@Accessors(chain = true) //设置set方法的定义类型
public class Login {
	
    private Integer id;
    private String userid;
    private String username;
    private String password;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	@Override
	public String toString() {
		return "Login [id=" + id + ", userid=" + userid + ", username=" + username + ", password=" + password + "]";
	}

}
