package com.journaldev.spring.model;

import java.util.ArrayList;
import java.util.List;

public class NetStateJSON {

    private Sensor acumulador = new Sensor();
    private List<Sensor> sensors = new ArrayList<Sensor>();

    public List<Sensor> getSensors() {
        return sensors;
    }

    public void setSensors(List<Sensor> sensors) {
        this.sensors = sensors;
    }

    public Sensor getAcumulador() {
        return acumulador;
    }

    public void setAcumulador(Sensor acumulador) {
        this.acumulador = acumulador;
    }
}
