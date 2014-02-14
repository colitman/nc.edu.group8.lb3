package action.handlers.country;

import action.*;
import hibernate.dao.*;
import hibernate.logic.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.log4j.*;

public class AddCountry implements HttpAction {
	
	private static final Logger logger = Logger.getLogger(AddCountry.class);

	public void perform(HttpServletRequest request, HttpServletResponse response) throws ActionException {
		try {
			logger.info("Prepare to add country");

			Country country = new Country();
			country.setName(request.getParameter("name"));
			country.setLanguage(request.getParameter("language"));
			country.setCapital(request.getParameter("capital"));
			country.setPopulation(Integer.valueOf(request.getParameter("population")));
			country.setTimezone(Integer.valueOf(request.getParameter("timezone")));

			if (logger.isInfoEnabled()) {		
				logger.info("Country properties: ");
				logger.info("Name: " + request.getParameter("name"));
				logger.info("Language: " + request.getParameter("language"));
				logger.info("Capital: " + request.getParameter("capital"));
				logger.info("Population: " + request.getParameter("population"));
				logger.info("Timezone: " + request.getParameter("timezone"));
			}

			GatewayResolver.getGateway().add(country);
			
			logger.info("Country was successfully added");			
			logger.info("Send redirect to showAllCountry page");

			response.sendRedirect("/WebPrototype/action?code=showAllCountry");
		} 	
		catch (Exception e) {
			logger.error("Error occured in AddCountry action", e);
		}	
	}
}