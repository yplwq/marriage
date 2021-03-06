package com.marriage.dao.impl;

import java.util.List;

import com.marriage.common.DBUnitHelper;
import com.marriage.common.PageControl;
import com.marriage.common.Pager;
import com.marriage.dao.interfaces.IMessageDAO;
import com.marriage.model.Message;

public class MessageDAO implements IMessageDAO {

	public Integer send(Message msg) {
		String sql = "insert into message(sender,receiver,message,time,status) value(?,?,?,?,'未读')";
		return DBUnitHelper.executeUpdate(sql,msg.getSender(),msg.getReceiver(),msg.getMessage(),msg.getTime()); 
	}

	public Pager<Message> find_msg(Integer id, PageControl pc) {
		String sql = "select * from message where receiver = ?";
		return DBUnitHelper.execlist(sql, pc, Message.class, "mid", id);
	}

	public Pager<Message> find_send(Integer id, PageControl pc) {
		String sql = "select * from message where sender = ?";
		return DBUnitHelper.execlist(sql, pc, Message.class, "mid", id);
	}

	public Integer read(Integer mid) {
		String sql = "update message set status = '已读' where mid = ?";
		return DBUnitHelper.executeUpdate(sql,mid); 
	}

	public Integer delete(Integer id) {
		return DBUnitHelper.executeUpdate("delete from message where mid = ?",id);
	}
}
