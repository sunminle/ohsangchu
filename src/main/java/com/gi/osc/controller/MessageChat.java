package com.gi.osc.controller;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;

import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

public class MessageChat extends DefaultEmbeddableVerticle {

	private SocketIOServer io = null;

	@Override
	public void start(Vertx arg0) {
		HttpServer server = arg0.createHttpServer();
		io = new DefaultSocketIOServer(arg0, server);
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			@Override
			public void handle(SocketIOSocket socket) {
				socket.on("joinRoom", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						String user1Id = event.getString("user1Id");
						String user2Id = event.getString("user2Id");
						String chatId = event.getString("chatId");
						socket.join(chatId+"_"+user1Id);
						socket.join(chatId+"_"+user2Id);
					}
				});

				socket.on("chatMsg", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						String chatId = event.getString("chatId");
						String user1Id = event.getString("user1Id");
						String user2Id = event.getString("user2Id");
						String temp;

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
