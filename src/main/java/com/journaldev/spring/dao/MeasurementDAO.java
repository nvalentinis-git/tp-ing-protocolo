package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Measurement;

public interface MeasurementDAO {

	public void addMeasurement(Measurement m);
	public void updateMeasurement(Measurement m);
	public List<Measurement> listMeasurements();
	public Measurement getMeasurementById(int id);
	public void removeMeasurement(int id);
}
