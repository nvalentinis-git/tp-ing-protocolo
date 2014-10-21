package com.journaldev.spring;

import com.journaldev.spring.model.Measurement;
import com.journaldev.spring.service.MeasurementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MeasurementController {
	
	private MeasurementService measurementService;
	
	@Autowired(required=true)
	@Qualifier(value="measurementService")
	public void setMeasurementService(MeasurementService ps){
		this.measurementService = ps;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String listMeasurement(Model model) {
		model.addAttribute("measurement", new Measurement());
		model.addAttribute("listMeasurements", this.measurementService.listMeasurement());
		return "measurement";
	}
	
	//For add and update measurement both
	@RequestMapping(value= "/measurement/add", method = RequestMethod.POST)
	public String addMeasurement(@ModelAttribute("measurement") Measurement p){
		
		if(p.getId() == 0){
			//new measurement, add it
			this.measurementService.addMeasurement(p);
		}else{
			//existing measurement, call update
			this.measurementService.updateMeasurement(p);
		}
		
		return "redirect:/home";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removeMeasurement(@PathVariable("id") int id){
		
        this.measurementService.removeMeasurement(id);
        return "redirect:/home";
    }
 
    @RequestMapping("/edit/{id}")
    public String editMeasurement(@PathVariable("id") int id, Model model){
        model.addAttribute("measurement", this.measurementService.getMeasurementById(id));
        model.addAttribute("listMeasurements", this.measurementService.listMeasurement());
        return "measurement";
    }
	
}
