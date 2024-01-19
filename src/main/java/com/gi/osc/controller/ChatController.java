package com.gi.osc.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gi.osc.bean.ChatDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.ChatService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	@Autowired
	private ChatDTO chatDTO;
	
	@Autowired
	private UsersDTO usersDTO;
	
	
	/*@RequestMapping("chatList")
	public String chatList(String user1Id , String user2Id, HttpSession session, Model model, int chatId) {
		
		
		String temp;
		
		
		String directoryPath = "D:\\ide\\chatLog";
		File directory = new File(directoryPath);
        List<String> textFileNames = new ArrayList<>();

        // 디렉토리가 존재하고 디렉토리인지 확인
        if (directory.exists() && directory.isDirectory()) {
            Collection<File> files = FileUtils.listFiles(directory, new String[]{"txt"}, true);

            // 디렉토리 내의 모든 텍스트 파일에 대해 검색
            if (files != null) {
                for (File file : files) {
                    textFileNames.add(file.getName());
                }
            }
        } else {
            System.out.println("유효한 디렉토리 경로가 아닙니다.");
        }
        
        for(String fn : textFileNames) {
        	if(fn.equals(user2Id + "," + user1Id + ".txt")) {
        		temp = user1Id;
        		user1Id = user2Id;
        		user2Id = temp;
        	}
        }
        String fileName = user1Id+","+user2Id+".txt";
		String path = "D:\\ide\\chatLog\\";
		String filePath = path+fileName;
		List<String> lineList = Collections.EMPTY_LIST;
        String line = "";
		try {
			File file = new File(filePath);
			if(file.exists()) {
			
            FileReader fileReader = new FileReader(filePath);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            if((line = bufferedReader.readLine()) != null) {
            	lineList = new ArrayList<String>();
            	lineList.add(line);
            }
            
            while ((line = bufferedReader.readLine()) != null) {
                lineList.add(line);
            }

            bufferedReader.close();
			}
        }catch(Exception e) {
        	e.printStackTrace();
        }
		model.addAttribute("lineList",lineList);
		model.addAttribute("user1Id",user1Id);
		model.addAttribute("user2Id",user2Id);
		model.addAttribute("chatId",chatId);
		return "chat/chatList";
	}*/
	
	
	@RequestMapping("chattingList")
	public String chattingList (HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		int usersId = service.selectUsersId(realId);
		List<Integer> chattingIdList = service.selectChattingList(usersId);
		int enemyId ;
		List<Integer> enemyIdList = new ArrayList<Integer>();
		List<UsersDTO> usersDTOList = new ArrayList<UsersDTO>();
		if(!chattingIdList.isEmpty()) {
		for(int id : chattingIdList) {
			chatDTO = service.selectChatDTO(id);
			if(chatDTO.getUserAId()==usersId) {
				enemyId = chatDTO.getUserBId();
				enemyIdList.add(enemyId);
			}else if(chatDTO.getUserBId()==usersId) {
				enemyId = chatDTO.getUserAId();
				enemyIdList.add(enemyId);
			}
			
		}
		
		
		for(int id : enemyIdList) {
			usersDTO = service.selectEnemyIdInfo(id);
			usersDTOList.add(usersDTO);
		}
		}
		model.addAttribute("usersDTOList",usersDTOList);
		model.addAttribute("usersId",usersId);
		
		
		return "chat/chattingList";
	}
	
	@RequestMapping("doChat")
	public String doChat(HttpServletRequest request, HttpSession session, @RequestParam(value = "enemyId", required = false)int user2Id, Model model) {
		
		
		
		String realId = (String) session.getAttribute("usersId");
		int user1Id = service.selectUsersId(realId);
		String user1Nick = service.selectUsersNick(user1Id);
		int chatId=0;
		int temp;
		
		
		String directoryPath = request.getServletContext().getRealPath("/resources/file/chat/");
		File directory = new File(directoryPath);
        List<String> textFileNames = new ArrayList<>();

        // 디렉토리가 존재하고 디렉토리인지 확인
        if (directory.exists() && directory.isDirectory()) {
            Collection<File> files = FileUtils.listFiles(directory, new String[]{"txt"}, true);

            // 디렉토리 내의 모든 텍스트 파일에 대해 검색
            if (files != null) {
                for (File file : files) {
                    textFileNames.add(file.getName());
                }
            }
        } else {
            System.out.println("유효한 디렉토리 경로가 아닙니다.");
        }
        
        for(String fn : textFileNames) {
        	if(fn.equals(user2Id + "," + user1Id + ".txt")) {
        		temp = user1Id;
        		user1Id = user2Id;
        		user2Id = temp;
        	}
        }
        String fileName = user1Id+","+user2Id+".txt";
		String path = request.getServletContext().getRealPath("/resources/file/chat/");
		String filePath = path+fileName;
		Path p = Paths.get(filePath);
		List<String> lineList = Collections.EMPTY_LIST;
        String line = "";
		try {
			File file = new File(filePath);
			
			if(!file.exists()) {
				Files.createFile(p);
				chatDTO.setChatLog(fileName);
				chatDTO.setUserAId(user1Id);
				chatDTO.setUserBId(user2Id);
				service.insertChat(chatDTO);
				chatId = chatDTO.getId();
			}
			
			else if(file.exists()) {
			chatId = service.selectChatid(user1Id, user2Id).getId();
            FileReader fileReader = new FileReader(filePath);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            if((line = bufferedReader.readLine()) != null) {
            	lineList = new ArrayList<String>();
            	lineList.add(line);
            }
            
            while ((line = bufferedReader.readLine()) != null) {
                lineList.add(line);
            }

            bufferedReader.close();
			}
			
        }catch(Exception e) {
        	e.printStackTrace();
        }
		
		System.out.println("유저닉네임 ======"+user1Nick);
		model.addAttribute("lineList",lineList);
		model.addAttribute("user1Id",user1Id);
		model.addAttribute("user2Id",user2Id);
		model.addAttribute("chatId",chatId);
		model.addAttribute("user1Nick",user1Nick);
		return "chat/doChat";
	}
	
	@RequestMapping("newChat")
	public String newChat(HttpSession session,Model model) {
		String realId = (String) session.getAttribute("usersId");
		int userId = service.selectUsersId(realId);
		List<UsersDTO> usersList = service.selectAllUsers(userId);
		
		model.addAttribute("usersList",usersList);
		return "chat/newChat";
	}
	
}
