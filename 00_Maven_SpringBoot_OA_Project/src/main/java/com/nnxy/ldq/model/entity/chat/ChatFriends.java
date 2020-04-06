package com.nnxy.ldq.model.entity.chat;



//@AllArgsConstructor
//@NoArgsConstructor
//@Data//get set
//@Accessors(chain = true)
public class ChatFriends {
    private Integer id;

    private String userid;

    private String fuserid;

    private String nickname;
    

    private String uimg;

    
    
	public ChatFriends(Integer id, String userid, String fuserid, String nickname, String uimg) {
		super();
		this.id = id;
		this.userid = userid;
		this.fuserid = fuserid;
		this.nickname = nickname;
		this.uimg = uimg;
	}

	public ChatFriends() {
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public ChatFriends setUserid(String userid) {
		this.userid = userid;
		return this;
	}

	public String getFuserid() {
		return fuserid;
	}

	public ChatFriends setFuserid(String fuserid) {
		this.fuserid = fuserid;
		return this;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUimg() {
		return uimg;
	}

	public void setUimg(String uimg) {
		this.uimg = uimg;
	}

	@Override
	public String toString() {
		return "ChatFriends [id=" + id + ", userid=" + userid + ", fuserid=" + fuserid + ", nickname=" + nickname
				+ ", uimg=" + uimg + "]";
	}
    
    
    
}