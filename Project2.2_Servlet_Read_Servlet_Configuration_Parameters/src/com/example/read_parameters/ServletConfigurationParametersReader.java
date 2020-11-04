package com.example.read_parameters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletConfigurationParametersReader
 */
@WebServlet("/ServletConfigurationParametersReader")
public class ServletConfigurationParametersReader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConfigurationParametersReader() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// Step 1: Set content type 
		response.setContentType("text/html");
		
		// Step 2: Get PrintWriter
		PrintWriter out = response.getWriter();
		
		// Step 3: Read Configuration Parameters
		ServletContext context = getServletContext();
		String maxSize = context.getInitParameter("max-size");
		
		// Step 4: Generate HTML content
		out.print("max-size: " + maxSize);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}


