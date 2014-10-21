package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Measurement;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class MeasurementDAOImpl implements MeasurementDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MeasurementDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addMeasurement(Measurement m) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(m);
		logger.info("Measurement saved successfully, Measurement Details="+m);
	}

	@Override
	public void updateMeasurement(Measurement m) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(m);
		logger.info("Measurement updated successfully, Measurement Details="+m);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Measurement> listMeasurements() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Measurement> measurementList = session.createQuery("from Measurement").list();
		for(Measurement m : measurementList){
			logger.info("Measurement List::"+m);
		}
		return measurementList;
	}

	@Override
	public Measurement getMeasurementById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Measurement m = (Measurement) session.load(Measurement.class, new Integer(id));
		logger.info("Measurement loaded successfully, Measurement details="+m);
		return m;
	}

	@Override
	public void removeMeasurement(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Measurement m = (Measurement) session.load(Measurement.class, new Integer(id));
		if(null != m){
			session.delete(m);
		}
		logger.info("Measurement deleted successfully, person details="+m);
	}

}
