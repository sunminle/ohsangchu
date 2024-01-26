package com.gi.osc.controller;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;

import com.gi.osc.bean.AlarmDTO;
import com.gi.osc.service.ChatService;
import com.gi.osc.service.MyPageService;
import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

public class MessageChat extends DefaultEmbeddableVerticle {
	@Autowired
	private ChatService service;
	
	@Autowired
	private MyPageService myPageService;
	
	private String currentUserId;
	
	@Autowired
	private AlarmDTO alarmDTO;
	
	private SocketIOServer io = null;
	
	@Autowired
	private HashMap<Integer,List<Integer>> onlineUsers;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageChat.class);
	@Override
	public void start(Vertx arg0) {
		HttpServer server = arg0.createHttpServer();
		io = new DefaultSocketIOServer(arg0, server);
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			
			@Override
			public void handle(SocketIOSocket socket) {
				socket.onDisconnect(new Handler<JsonObject>() {
					@Override
					public void handle(JsonObject event) {
						
					
						
						
                        // 사용자가 연결을 끊으면 온라인 사용자에서 제거
						
                        
                        logger.info("Online users: {}", onlineUsers);
                        
					}
				});
				socket.on("joinRoom", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						String user1Id = event.getString("user1Id");
						String user2Id = event.getString("user2Id");
						String id = event.getString("id");
						id = String.valueOf(myPageService.selectUsers(id).getId());
						String chatId = event.getString("chatId");
						socket.join(chatId+"_"+user1Id);
						socket.join(chatId+"_"+user2Id);
						List<Integer> userList = onlineUsers.get(Integer.parseInt(chatId));
						if (userList == null) {
						    userList = new ArrayList<>();
						    onlineUsers.put(Integer.parseInt(chatId), userList);
						}
						userList.add(Integer.parseInt(id));
						// onlineUsers에 누가 있는지 확인하고 로그 출력
	                    logger.info("Online users: {}", onlineUsers);
					}
				});

				
				socket.on("chatMsg", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						String chatId = event.getString("chatId");
						String user1Id = event.getString("user1Id");
						String user2Id = event.getString("user2Id");
						String id = event.getString("id");
						id = String.valueOf(myPageService.selectUsers(id).getId());
						String temp;
						alarmDTO.setChatId(Integer.parseInt(chatId));
						alarmDTO.setCode("NewPost");
						alarmDTO.setPrefix("chat");
						System.out.println("유저아이디 ======"+id);
						System.out.println("유저1아이디 ======"+user1Id);
						System.out.println("유저2아이디 ======"+user2Id);
						if(id.equals(user1Id)) {
							alarmDTO.setUserId(Integer.parseInt(user2Id));
							System.out.println("맞을때저장되는유저아이디 ======"+alarmDTO.getUserId());
						}
						else{
							alarmDTO.setUserId(Integer.parseInt(user1Id));
							System.out.println("아닐때저장되는유저아이디 ======"+alarmDTO.getUserId());
						}
						
						String directoryPath = "D:\\ide\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ohsangchu1\\resources\\file\\chat\\";
						File directory = new File(directoryPath);
						List<String> textFileNames = new ArrayList<>();

						if (directory.exists() && directory.isDirectory()) {
							Collection<File> files = FileUtils.listFiles(directory, new String[] { "txt" }, true);

							if (files != null) {
								for (File file : files) {
									textFileNames.add(file.getName());
								}
							}
						}
						for (String fn : textFileNames) {
							if (fn.equals(user2Id + "," + user1Id + ".txt")) {
								temp = user1Id;
								user1Id = user2Id;
								user2Id = temp;
							}
						}
						
						io.sockets().in(chatId+"_"+user1Id).emit("response", event);

						String fileName = user1Id + "," + user2Id + ".txt";
						String path = "D:\\ide\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ohsangchu1\\resources\\file\\chat\\";
						String message = event.getString("msg");
						String filePath = path + fileName;
						System.out.println(event.getString("msg")); 

						try {
							
							FileWriter fileWriter = new FileWriter(filePath, true);

							fileWriter.write(message);
							fileWriter.write("\n");
							fileWriter.close();
							 
							if (!onlineUsers.get(Integer.parseInt(chatId)).contains(alarmDTO.getUserId())) {
	                            service.insertChatAlarm(alarmDTO);
	                        }
		                        
							//service.insertChatAlarm(alarmDTO);

						} catch (Exception e) {
							e.printStackTrace();
						}

						// io.sockets().emit("response",event);
					}
				});
			}

		});
		server.listen(9999);
	}
	
}
