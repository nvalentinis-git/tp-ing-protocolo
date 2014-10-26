package com.server.tcp;

import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

public class TCPServerContextLoaderListener extends ContextLoaderListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);

        TCPServer.start();
    }
}
