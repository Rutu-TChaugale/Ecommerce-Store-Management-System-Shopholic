// @Spuffyffets codes
package com.sit.dao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.sit.model.Product;
import com.sit.util.FactoryProvider;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(product);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }

    //get all products
    public List<Product> getAllProducts() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }

    //get all  products of given category
    public List<Product> getAllProductsById(int cid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;
    }
    
    
    
    public Product getProductById(int productId) {
        Product product = null;
        try {
            
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            
            product = session.get(Product.class, productId);

           
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    
    
    
    public int getProductCount() {
        int count = 0;
        try (Session session = factory.openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(p) FROM Product p", Long.class);
            count = query.uniqueResult().intValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    
    
    
    public boolean updateProduct(Product product) {
        try (Session session = factory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(product);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteProduct(int productId) {
        boolean success = false;
        try (Session session = factory.openSession()) {
            Transaction tx = session.beginTransaction();
            Product product = session.get(Product.class, productId);
            if (product != null) {
                session.delete(product);
                tx.commit();
                success = true;
                System.out.println("Product deleted successfully: " + productId);
            } else {
                System.out.println("Product not found: " + productId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }





}
