package com.ecart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.ProductDao;
import com.ecart.entities.Category;
import com.ecart.entities.Product;
import com.ecart.helper.FactoryProvider;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	
       
	 @SuppressWarnings("deprecation")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {
	            /* TODO output your page here. You may use following sample code. */
	            
				/*
				 * servlet 2: add category,  add product
				 */
	        	
	        	// fetching ctegory data
	        	
	        	String op = request.getParameter("operation");
	        	
	        	if(op.trim().equals("addcategory")) {
	        		
	        		// add category
	        		String title = request.getParameter("catTitle");
		        	String description = request.getParameter("catDescription");
		        	
		        	// creating object
		        	Category category = new Category();
		        	category.setCategoryTitle(title);
		        	category.setCategorydescription(description);
		        	
		        	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		        	int catId = categoryDao.saveCategory(category);
		        	
		        	// out.println("categoty saved");
		        	
		        	HttpSession httpSession = request.getSession();
		        	httpSession.setAttribute("message", "Category added successfully: "+", Id: " + catId);
		        	response.sendRedirect("admin.jsp");
		        	
		        	return;
	        		
	        	}else if(op.trim().equals("addproduct")) {
	        		
	        		// add product
	        		String pName = request.getParameter("pName");
	        		String pDes = request.getParameter("pDes");
	        		
	        		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	        		int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
	        		int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
	        		int catId = Integer.parseInt(request.getParameter("catId"));
	        		Part part = request.getPart("pPic");
	        		
	        		Product p = new Product();
	        		p.setpName(pName);
	        		p.setpDesc(pDes);
	        		p.setpPrice(pPrice);
	        		p.setpDiscount(pDiscount);
	        		p.setpQuality(pQuantity);
	        		p.setpPhoto(part.getSubmittedFileName());
	        		
	        		
	        		// get category by id
	        		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	        		Category category = cdao.getCategoryById(catId);
	        		
	        		p.setCategory(category);
	        		
	        		// product save
	        		ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
	        		pdao.saveProduct(p);
	        		// out.println("product save success....");
	        		
	        		// pic upload
	        		// path to upload photo
	        		String path = request.getRealPath("img") + 
	        				File.separator+"products" + File.separator + part.getSubmittedFileName();
	        		System.out.println(path);
	        		
	        		try {
	        			
	        			// uploding code..
		        		FileOutputStream fos = new FileOutputStream(path);
		        		InputStream is = part.getInputStream();
		        		
		        		// reading data
		        		byte [] data = new byte[is.available()];
		        		is.read(data);
		        		
		        		// writing the code
		        		fos.write(data);
		        		fos.close();
		        		
	        		} catch (Exception e) {
						// TODO: handle exception
	        			e.printStackTrace();
					}
	        		
	        		
	        		
	        		HttpSession httpSession = request.getSession();
		        	httpSession.setAttribute("message", "product added successfully");
		        	response.sendRedirect("admin.jsp");
		        	
		        	return;
	        		
	        		

	        	}
	        	
	        }
	    }

	   
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    @Override
	    public String getServletInfo() {
	        return "Short description";
	        
	    }

}
