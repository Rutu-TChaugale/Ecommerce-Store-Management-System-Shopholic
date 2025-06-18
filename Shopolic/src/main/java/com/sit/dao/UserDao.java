// @Spuffyffets codes
package com.sit.dao;



import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.sit.model.User;
import com.sit.util.FactoryProvider;



public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        
        try {
            
            String query="from User where userEmail =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p",password);            
            user=(User) q.uniqueResult();         
            session.close();         
            
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }     
        
        
        
        
        return user;
    }
    
    public int getUserCount() {
        int count = 0;
        try (Session session = FactoryProvider.getFactory().openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(u) FROM User u", Long.class);
            count = query.uniqueResult().intValue();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public UserDao() {
        this.factory = FactoryProvider.getFactory();
    }

    
    
    
}
