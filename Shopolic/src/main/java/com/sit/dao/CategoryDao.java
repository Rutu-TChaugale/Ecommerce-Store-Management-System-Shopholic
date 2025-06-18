// @Spuffyffets codes
package com.sit.dao;



import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.sit.model.Category;
import com.sit.util.FactoryProvider;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    // category db madhe save kelya
    public int saveCategory(Category cat) {

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }

    public List<Category> getCategories() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }

    public Category getCategoryById(int cid) {
        Category cat = null;
        try {

            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cat;
    }
    public List<Category> getAllCategories() {
        List<Category> categories = null;
        try (Session session = FactoryProvider.getFactory().openSession()) {
            categories = session.createQuery("from Category", Category.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }
    
    
    public int getCategoryCount() {
        int count = 0;
        try (Session session = factory.openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(c) FROM Category c", Long.class);
            count = query.uniqueResult().intValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public CategoryDao() {
        this.factory = FactoryProvider.getFactory();
    }
    
    
    public boolean deleteCategory(int categoryId) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Category category = session.get(Category.class, categoryId);
            if (category != null) {
                session.delete(category);
                tx.commit();
                return true;
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }


}
