package com.gi.osc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.ChatDTO;
import com.gi.osc.bean.UsersDTO;

public interface ChatMapper {
	public int selectUsersId(String realId);
	public List<Integer> selectChattingList(int usersId);
	public ChatDTO selectChatDTO(int id);
	public UsersDTO selectEnemyIdInfo(int id);
	public String selectUsersNick(int usersId);
	public ChatDTO selectChatid(@Param("user1Id")int user1Id, @Param("user2Id")int user2Id);
	public void insertChat(ChatDTO chatDTO);
	public List<UsersDTO> selectAllUsers(int usersId);
}
