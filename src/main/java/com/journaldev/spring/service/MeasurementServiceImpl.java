package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Measurement;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.MeasurementDAO;

@Service
public class MeasurementServiceImpl implements MeasurementService {
	
	private MeasurementDAO measurementDAO;

	public void setMeasurementDAO(MeasurementDAO measurementDAO) {
		this.measurementDAO = measurementDAO;
	}

	@Override
	@Transactional
	public void addMeasurement(Measurement p) {
		this.measurementDAO.addMeasurement(p);
	}

	@Override
	@Transactional
	public void updateMeasurement(Measurement p) {
		this.measurementDAO.updateMeasurement(p);
	}

	@Override
	@Transactional
	public List<Measurement> listMeasurement() {
		return this.measurementDAO.listMeasurements();
	}

	@Override
	@Transactional
	public Measurement getMeasurementById(int id) {
		return this.measurementDAO.getMeasurementById(id);
	}

	@Override
	@Transactional
	public void removeMeasurement(int id) {
		this.measurementDAO.removeMeasurement(id);
	}

}
