package com.nnxy.ldq.model.entity.chat;



import java.util.Date;

//@AllArgsConstructor
//@NoArgsConstructor
//@Data
//@Accessors(chain = true)
public class ChatMsg {
    private String senduserid;

    private String reciveuserid;

    private Date sendtime;

    private String msgtype; //消息类型

    private String sendtext;

	public ChatMsg(String senduserid, String reciveuserid, Date sendtime, String msgtype, String sendtext) {
		super();
		this.senduserid = senduserid;
		this.reciveuserid = reciveuserid;
		this.sendtime = sendtime;
		this.msgtype = msgtype;
		this.sendtext = sendtext;
	}
	
	public ChatMsg() {
		
	}
	
	public String getSenduserid() {
		return senduserid;
	}

	public ChatMsg setSenduserid(String senduserid) {
		this.senduserid = senduserid;
		return this;
	}

	public String getReciveuserid() {
		return reciveuserid;
	}

	public ChatMsg setReciveuserid(String reciveuserid) {
		this.reciveuserid = reciveuserid;
		return this;
	}

	public Date getSendtime() {
		return sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	public String getMsgtype() {
		return msgtype;
	}

	public  ChatMsg setMsgtype(String msgtype) {
		this.msgtype = msgtype;
		return this;
				
	}

	public String getSendtext() {
		return sendtext;
	}

	public ChatMsg setSendtext(String sendtext) {
		this.sendtext = sendtext;
		return this;
	}

	@Override
	public String toString() {
		return "ChatMsg [senduserid=" + senduserid + ", reciveuserid=" + reciveuserid + ", sendtime=" + sendtime
				+ ", msgtype=" + msgtype + ", sendtext=" + sendtext + "]";
	}

    
    
}