package com.journaldev.spring.model;

import java.util.ArrayList;
import java.util.List;

public class NetStateJSON {

    private Sensor server = new Sensor();
    private Sensor acumulador = new Sensor();
    private List<Sensor> sensors = new ArrayList<Sensor>();

    public List<Sensor> getSensors() {
        return sensors;
    }

    public void setSensors(List<Sensor> sensors) {
        this.sensors = sensors;
    }

    public Sensor getServer() {
        return server;
    }

    public void setServer(Sensor server) {
        this.server = server;
    }

    public Sensor getAcumulador() {
        return acumulador;
    }

    public void setAcumulador(Sensor acumulador) {
        this.acumulador = acumulador;
    }
}
