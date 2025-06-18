package com.sit.dao;

import com.sit.model.Order;
import com.sit.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class OrderDao {
    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }

    public void saveOrder(Order order) {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(order);
        tx.commit();
        session.close();
    }

    public List<Order> getOrdersByUser(User user) {
        Session session = factory.openSession();
        Query<Order> query = session.createQuery("FROM Order WHERE user=:u", Order.class);
        query.setParameter("u", user);
        List<Order> orders = query.getResultList();
        session.close();
        return orders;
    }
}
