package com.nnxy.ldq.model.entity.chat;



//@AllArgsConstructor
//@NoArgsConstructor
//@Data
//@Accessors(chain = true)
public class Userinfo {
    private Integer uid;
    private String nickname;
    private String usign;
    private String userid;
    private String uimg;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUsign() {
		return usign;
	}
	public void setUsign(String usign) {
		this.usign = usign;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUimg() {
		return uimg;
	}
	public void setUimg(String uimg) {
		this.uimg = uimg;
	}
	@Override
	public String toString() {
		return "Userinfo [uid=" + uid + ", nickname=" + nickname + ", usign=" + usign + ", userid=" + userid + ", uimg="
				+ uimg + "]";
	}
    
    
    
}
