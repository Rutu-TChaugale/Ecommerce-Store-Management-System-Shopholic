// @Spuffyffets codes
//package com.sit.servlet;
//
//
//import java.io.File;
//
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.http.Part;
//
//import com.sit.dao.CategoryDao;
//import com.sit.dao.ProductDao;
//import com.sit.model.Category;
//import com.sit.model.Product;
//import com.sit.util.FactoryProvider;
//
//import jakarta.servlet.annotation.WebServlet;
//
//
//
//@WebServlet("/ProductOperationServlet")
//@MultipartConfig
//public class ProductOperationServlet extends HttpServlet {
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//
////            servlet 2:
////            add category 
////            add product
//            String op = request.getParameter("operation");
//
//            if (op.trim().equals("addcategory")) {
//                //add category
//                //fetching category data
//                String title = request.getParameter("catTitle");
//                String description = request.getParameter("catDescription");
//
//                Category category = new Category();
//                category.setCategoryTitle(title);
//                category.setCategoryDescription(description);
//
//                
//                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
//                int catId = categoryDao.saveCategory(category);
//                  // out.println("Category Saved");
//                HttpSession httpSession = request.getSession();
//                httpSession.setAttribute("message", "Category added successfully : " + catId);
//                response.sendRedirect("admin.jsp");
//                return;
//
//            } else if (op.trim().equals("addproduct")) {
//               
//                String pName = request.getParameter("pName");
//                String pDesc = request.getParameter("pDesc");
//                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
//                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
//                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
//                int catId = Integer.parseInt(request.getParameter("catId"));
//                Part part = request.getPart("pPic");
//
//                
//                Product p = new Product();
//                p.setpName(pName);
//                p.setpDesc(pDesc);
//                p.setpPrice(pPrice);
//                p.setpDiscount(pDiscount);
//                p.setpQuantity(pQuantity);
//
//                
//                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
//                Category category = cdoa.getCategoryById(catId);
//                p.setCategory(category);
//
//                
//                String uploadPath = getServletContext().getRealPath("") + File.separator + "img" + File.separator + "products";
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                    uploadDir.mkdirs();
//                }
//
//                
//                String fileName = extractFileName(part);
//                if (fileName != null && !fileName.isEmpty()) {
//                    String filePath = uploadPath + File.separator + fileName;
//
//                    
//                    try (InputStream is = part.getInputStream(); FileOutputStream fos = new FileOutputStream(filePath)) {
//                        byte[] buffer = new byte[1024];
//                        int bytesRead;
//                        while ((bytesRead = is.read(buffer)) != -1) {
//                            fos.write(buffer, 0, bytesRead);
//                        }
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//
//                   
//                    p.setpPhoto(fileName);
//                } else {
//                    p.setpPhoto("default.jpg"); 
//                }
//
//                
//                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
//                pdao.saveProduct(p);
//
//                
//                HttpSession httpSession = request.getSession();
//                httpSession.setAttribute("message", "Product added successfully!");
//                response.sendRedirect("admin.jsp");
//            }
//            
//
//            
//            
//            
//            
//            
//            
////            else if (op.trim().equals("addproduct")) {
////                //add product
////                //work
////                String pName = request.getParameter("pName");
////                String pDesc = request.getParameter("pDesc");
////                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
////                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
////                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
////                int catId = Integer.parseInt(request.getParameter("catId"));
////                Part part = request.getPart("pPic");
////
////                Product p = new Product();
////                p.setpName(pName);
////                p.setpDesc(pDesc);
////                p.setpPrice(pPrice);
////                p.setpDiscount(pDiscount);
////                p.setpQuantity(pQuantity);
////                p.setpPhoto(part.getSubmittedFileName());
////
////                //get category by id
////                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
////                Category category = cdoa.getCategoryById(catId);
////
////                p.setCategory(category);
////
////                //product save...
////                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
////                pdao.saveProduct(p);
////
////                //pic upload
//////                find out the path to upload photo
////                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
////                System.out.println(path);
////
////                //uploading code..
////                try {
////
////                    FileOutputStream fos = new FileOutputStream(path);
////
////                    InputStream is = part.getInputStream();
////
//////                reading data
////                    byte[] data = new byte[is.available()];
////
////                    is.read(data);
////
//////                writing the data
////                    fos.write(data);
////
////                    fos.close();
////
////                } catch (Exception e) {
////                    e.printStackTrace();
////                }
////
////                out.println("Product save sucess...");
////                HttpSession httpSession = request.getSession();
////                httpSession.setAttribute("message", "Product is added successfully..");
////                response.sendRedirect("admin.jsp");
////                return;
////
////            }
//
//        
//    
//    
//    
//    else if (op.trim().equals("updateproduct")) {
//        int pId = Integer.parseInt(request.getParameter("pId"));
//        String pName = request.getParameter("pName");
//        String pDesc = request.getParameter("pDesc");
//        int pPrice = Integer.parseInt(request.getParameter("pPrice"));
//        int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
//        int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
//
//        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
//        Product existingProduct = pdao.getProductById(pId);
//        
//        if (existingProduct != null) {
//            existingProduct.setpName(pName);
//            existingProduct.setpDesc(pDesc);
//            existingProduct.setpPrice(pPrice);
//            existingProduct.setpDiscount(pDiscount);
//            existingProduct.setpQuantity(pQuantity);
//
//            pdao.updateProduct(existingProduct);
//            
//            HttpSession httpSession = request.getSession();
//            httpSession.setAttribute("message", "Product updated successfully!");
//            response.sendRedirect("admin.jsp");
//        } else {
//            response.sendRedirect("error.jsp");
//        }
//    }
//    else if (op.trim().equals("deleteproduct")) {
//        int pId = Integer.parseInt(request.getParameter("pId"));
//        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
//        
//        if (pdao.deleteProduct(pId)) {
//            HttpSession httpSession = request.getSession();
//            httpSession.setAttribute("message", "Product deleted successfully!");
//            response.sendRedirect("admin.jsp");
//        } else {
//            response.sendRedirect("error.jsp");
//        
//    }
//    }
//        }
//    }
//
//    
//    
//    
//    
//    
//    private String extractFileName(Part part) {
//        String contentDisp = part.getHeader("content-disposition");
//        for (String content : contentDisp.split(";")) {
//            if (content.trim().startsWith("filename")) {
//                return content.substring(content.indexOf("=") + 2, content.length() - 1);
//            }
//        }
//        return null;
//    }
//
//
//  
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//  
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }
//
//}
// @Spuffyffets codes
package com.sit.servlet;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.sit.dao.CategoryDao;
import com.sit.dao.ProductDao;
import com.sit.model.Category;
import com.sit.model.Product;
import com.sit.util.FactoryProvider;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String op = request.getParameter("operation");

		if (op != null) {
			HttpSession httpSession = request.getSession();

			if (op.equals("addcategory")) {
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");

				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);

				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);

				httpSession.setAttribute("message", "Category added successfully: " + catId);
				response.sendRedirect("admin.jsp");
			}

			else if (op.equals("addproduct")) {
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");

				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);

				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(catId);
				p.setCategory(category);

				String uploadPath = getServletContext().getRealPath("") + File.separator + "img" + File.separator
						+ "products";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				String fileName = extractFileName(part);
				if (fileName != null && !fileName.isEmpty()) {
					String filePath = uploadPath + File.separator + fileName;
					try (InputStream is = part.getInputStream();
							FileOutputStream fos = new FileOutputStream(filePath)) {
						byte[] buffer = new byte[1024];
						int bytesRead;
						while ((bytesRead = is.read(buffer)) != -1) {
							fos.write(buffer, 0, bytesRead);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					p.setpPhoto(fileName);
				} else {
					p.setpPhoto("default.jpg");
				}

				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);

				httpSession.setAttribute("message", "Product added successfully!");
				response.sendRedirect("admin.jsp");
			}
			else if (op.equals("updateproduct")) {
				int pId = Integer.parseInt(request.getParameter("pId"));
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));

				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				Product existingProduct = pdao.getProductById(pId);

				if (existingProduct != null) {
					existingProduct.setpName(pName);
					existingProduct.setpDesc(pDesc);
					existingProduct.setpPrice(pPrice);
					existingProduct.setpDiscount(pDiscount);
					existingProduct.setpQuantity(pQuantity);

					pdao.updateProduct(existingProduct);

					httpSession.setAttribute("message", "Product updated successfully!");
					response.sendRedirect("admin.jsp");
				} else {
					httpSession.setAttribute("error", "Product not found!");
					response.sendRedirect("error.jsp");
				}
			}

			else if (op.equals("deleteproduct")) {
				int pId = Integer.parseInt(request.getParameter("pId"));
				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());

				if (pdao.deleteProduct(pId)) {
					httpSession.setAttribute("message", "Product deleted successfully!");
					response.sendRedirect("admin.jsp");
				} else {
					httpSession.setAttribute("error", "Product deletion failed!");
					response.sendRedirect("error.jsp");
				}
			}
			
			
			
			
			
			
			else if (op.equals("deletecategory")) {
			    int categoryId = Integer.parseInt(request.getParameter("catId"));
			    // Reuse the existing CategoryDao object instead of declaring a new one
			    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

			    // Attempt to delete the category
			    if (categoryDao.deleteCategory(categoryId)) {
			        httpSession.setAttribute("message", "Category deleted successfully!");
			    } else {
			        httpSession.setAttribute("error", "Category deletion failed!");
			    }
			    response.sendRedirect("admin.jsp");
			}


		} else {
			response.sendRedirect("error.jsp");
		}
		
		
		
		
		
		
		
	}
	

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		for (String content : contentDisp.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
			}
		}
		return null;
	}

}
