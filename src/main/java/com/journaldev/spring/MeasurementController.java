package com.journaldev.spring;

import com.google.gson.Gson;
import com.journaldev.spring.dao.MeasurementDAO;
import com.journaldev.spring.model.Measurement;
import com.journaldev.spring.model.MeasurementJSON;
import com.journaldev.spring.model.NetStateJSON;
import com.journaldev.spring.model.Sensor;
import com.journaldev.spring.service.MeasurementService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.List;
import java.util.Map;

@Controller
public class MeasurementController {

    public static final String ACUMULADOR_HOSTNAME = "192.168.1.8";
    public static final int ACUMULADOR_PORT = 8888;
    private MeasurementService measurementService;
    private static final Logger logger = LoggerFactory.getLogger(MeasurementController.class);


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

    @RequestMapping(value = "/dataJson", method = RequestMethod.GET, produces ="application/json")
    public @ResponseBody MeasurementJSON listMeasurementJson () throws IOException {

        List<Measurement> listMeasurements = this.measurementService.listMeasurement();
        MeasurementJSON measurementJSON = new MeasurementJSON();
        measurementJSON.setiTotalDisplayRecords(listMeasurements.size());
        measurementJSON.setiTotalRecords(listMeasurements.size());
        measurementJSON.setAaData(listMeasurements);

        return  measurementJSON;
    }

	//For add and update measurement both
	@RequestMapping(value= "/measurement/add", method = RequestMethod.POST)
	public String addMeasurement(@ModelAttribute("measurement") Measurement m){
		
		if(m.getId() == 0){
			//new measurement, add it
			this.measurementService.addMeasurement(m);
		}else{
			//existing measurement, call update
			this.measurementService.updateMeasurement(m);
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

    @RequestMapping(value = "/data", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public void saveData(@RequestBody Measurement measurement) {

        logger.info(measurement.toString());
        this.measurementService.addMeasurement(measurement);
    }

    @RequestMapping(value = "/netState", method = RequestMethod.GET, produces ="application/json")
    public @ResponseBody NetStateJSON netStateJson () throws IOException {

        String response = "error";
        NetStateJSON netStateJSON = new NetStateJSON();
        netStateJSON.getAcumulador().setState(false);
        netStateJSON.getAcumulador().setIp(ACUMULADOR_HOSTNAME);
        netStateJSON.getAcumulador().setPort(String.valueOf(ACUMULADOR_PORT));

//        try {
//
//            // create a communication with Acumulador
//            Socket sensorTCPSocket = new Socket();
//            sensorTCPSocket.connect(
//                    new InetSocketAddress(
//                            ACUMULADOR_HOSTNAME,
//                            ACUMULADOR_PORT),
//                    10000);
//
//            // for read time out
//            sensorTCPSocket.setSoTimeout(8000);
//
//            BufferedReader inputStreamTCPServer = new BufferedReader( new InputStreamReader( sensorTCPSocket.getInputStream() ) );
//            PrintWriter outputStreamTCPServer = new PrintWriter( sensorTCPSocket.getOutputStream(), true );
//
//            //wait to complete the socket link with the Sensor ServerTCP
//            Thread.sleep(500);
//
//            outputStreamTCPServer.println( "getNetState\n" );
//
//            response = readResponseFromInput( inputStreamTCPServer );
//
//            //wait to complete the read and the close connection with TCP Server
//            Thread.sleep(100);
//            outputStreamTCPServer.close();
//            inputStreamTCPServer.close();
//            sensorTCPSocket.close();

//        NetStateJSON netStateJSON = new Gson().fromJson(response, NetStateJSON.class);

//        netStateJSON.getAcumulador().setState(true);
//
//        } catch(Exception e) {
//            e.printStackTrace(System.out);
//        }
//



        netStateJSON.getAcumulador().setState(true);

        Sensor sensor = new Sensor();
        sensor.setIp("192.2.2.3.");
        sensor.setPort("4444");
        sensor.setName("Sensor 1");
        sensor.setState(true);

        Sensor sensor2 = new Sensor();
        sensor2.setIp("192.2.2.5.");
        sensor2.setPort("4444");
        sensor2.setName("Sensor 2");
        sensor2.setState(false);

        Sensor sensor3 = new Sensor();
        sensor3.setIp("192.2.2.5.");
        sensor3.setPort("4444");
        sensor3.setName("Sensor 2");
        sensor3.setState(true);

        Sensor sensor4 = new Sensor();
        sensor4.setIp("192.2.2.5.");
        sensor4.setPort("4444");
        sensor4.setName("Sensor 2");
        sensor4.setState(false);

        Sensor sensor5 = new Sensor();
        sensor5.setIp("192.2.2.5.");
        sensor5.setPort("4444");
        sensor5.setName("Sensor 2");
        sensor5.setState(true);

        netStateJSON.getSensors().add(sensor);
        netStateJSON.getSensors().add(sensor2);
        netStateJSON.getSensors().add(sensor3);
        netStateJSON.getSensors().add(sensor4);
        netStateJSON.getSensors().add(sensor5);

        return  netStateJSON;
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
