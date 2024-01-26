package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.AlarmDTO;
import com.gi.osc.bean.ChatDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.repository.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatMapper mapper;

	@Override
	public int selectUsersId(String realId) {
		return mapper.selectUsersId(realId);
	}

	@Override
	public List<Integer> selectChattingList(int usersId) {
		return mapper.selectChattingList(usersId);
	}

	@Override
	public ChatDTO selectChatDTO(int id) {
		return mapper.selectChatDTO(id);
	}

	@Override
	public UsersDTO selectEnemyIdInfo(int id) {
		return mapper.selectEnemyIdInfo(id);
	}

	@Override
	public String selectUsersNick(int usersId) {
		return mapper.selectUsersNick(usersId);
	}

	@Override
	public ChatDTO selectChatid(int user1Id, int user2Id) {
		return mapper.selectChatid(user1Id, user2Id);
	}

	@Override
	public void insertChat(ChatDTO chatDTO) {
		mapper.insertChat(chatDTO);
	}

	@Override
	public List<UsersDTO> selectAllUsers(int usersId) {
		return mapper.selectAllUsers(usersId);
	}
	
	@Override
	public void insertChatAlarm(AlarmDTO alarmDTO) {
		mapper.insertChatAlarm(alarmDTO);
	}

	@Override
	public void deleteChatAlarm(int userId, int chatId) {
		mapper.deleteChatAlarm(userId, chatId);
	}

	@Override
	public int chatAlarmCount(int userId, int chatId) {
		return mapper.chatAlarmCount(userId,chatId);
	}

}
