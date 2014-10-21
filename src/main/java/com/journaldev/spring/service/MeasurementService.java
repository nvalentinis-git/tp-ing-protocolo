package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Measurement;

public interface MeasurementService {

	public void addMeasurement(Measurement m);
	public void updateMeasurement(Measurement m);
	public List<Measurement> listMeasurement();
	public Measurement getMeasurementById(int id);
	public void removeMeasurement(int id);
	
}
