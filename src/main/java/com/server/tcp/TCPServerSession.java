package com.server.tcp;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.Socket;

public class TCPServerSession implements Runnable {

	private Socket socketConnection;

	public TCPServerSession(Socket socketConnection) {
		this.socketConnection = socketConnection;
	}
	
	@Override
	public void run() {
		
		try {
		
			InputStream inputStream = socketConnection.getInputStream();
			DataOutputStream outputStream = new DataOutputStream( socketConnection.getOutputStream() );

            BufferedReader inputStreamReader= new BufferedReader( new InputStreamReader( inputStream ) );
            String command = readResponseFromInput(inputStreamReader);

            String response = "error";
            if (!"error".equalsIgnoreCase(command)) {
                if (command.contains("getHostName")) {
                    response = "{\"nombre\":\"ServerBD\", \"type\":\"server\"}";
                } else {
                    response = "badCommand\n";
                }
            }

			outputStream.writeBytes(response);
			outputStream.flush();

			inputStream.close();
			outputStream.close();
			socketConnection.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private String readResponseFromInput( Reader input ) {
		
		String response = "error";
		String sensorResponse = "";
		try {
			int in = 0;
			boolean needToRead = true;
			
			while ( !input.ready() ) { 
				Thread.sleep(200);
			}
			
			while ( input.ready() && needToRead ) {
				in = input.read();
				sensorResponse += Character.toString( (char) in );
                response = sensorResponse;
			}
			
		} catch (Exception e) {
			e.printStackTrace();				
		}			
		
		return response;			
	}

}
