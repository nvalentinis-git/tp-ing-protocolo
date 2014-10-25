package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="MEASUREMENT")
public class Measurement {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

    private String anio;
    private String mes;
    private String dia;
    private String hora;
    private String minuto;
    private String segundo;
    private String sensor;
    private String valor;

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getMinuto() {
        return minuto;
    }

    public void setMinuto(String minuto) {
        this.minuto = minuto;
    }

    public String getSegundo() {
        return segundo;
    }

    public void setSegundo(String segundo) {
        this.segundo = segundo;
    }

    public String getSensor() {
        return sensor;
    }

    public void setSensor(String sensor) {
        this.sensor = sensor;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "Measurement{" +
                "id=" + id +
                ", anio='" + anio + '\'' +
                ", mes='" + mes + '\'' +
                ", dia='" + dia + '\'' +
                ", hora='" + hora + '\'' +
                ", minuto='" + minuto + '\'' +
                ", segundo='" + segundo + '\'' +
                ", sensor='" + sensor + '\'' +
                ", valor='" + valor + '\'' +
                '}';
    }
}
