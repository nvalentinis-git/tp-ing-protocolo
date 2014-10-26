package com.server.tcp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServer implements Runnable {

    public static final int PORT = 6666;
    private static ServerSocket httpServer;

    private static final Logger logger = LoggerFactory.getLogger(TCPServer.class);

	public static void start() {
        new Thread(new TCPServer()).start();
	}

    @Override
    public void run() {
        try {

            httpServer = new ServerSocket(PORT);
            logger.info("TCP Server Started at: " + PORT);

            while(true) {
                Socket httpClientSocket = httpServer.accept();
                logger.info("New HTTP request established");

                new Thread(new TCPServerSession(httpClientSocket)).start();
            }

        } catch(IOException e) {
            e.printStackTrace();

        } finally {
            try {
                httpServer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}


