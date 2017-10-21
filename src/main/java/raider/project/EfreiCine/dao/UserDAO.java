package raider.project.EfreiCine.dao;


import java.util.List;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import raider.project.EfreiCine.model.User;

@Repository("userDAO")
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<User> getAll() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
        Root<User> from = criteriaQuery.from(User.class);
        CriteriaQuery<User> select = criteriaQuery.select(from);
        TypedQuery<User> typedQuery = session.createQuery(select);
        List<User> users = typedQuery.getResultList();
        return users;
    }

    @Transactional
    public String insertNew(User user) {
        // insert into database & return primary key
        int userId = (Integer) sessionFactory.getCurrentSession().save(user);
        return "User information saved successfully with id " + userId;
    }

    @Transactional
    public User get(int userId) {
        User user = (User) sessionFactory.getCurrentSession().get(User.class, userId);
        return user;
    }

    @Transactional
    public String update(User user) {
        sessionFactory.getCurrentSession().update(user);
        return "User information updated successfully";
    }

    @Transactional
    public String remove(User user) {
        sessionFactory.getCurrentSession().delete(user);
        return "User information with id " + user.getId() + " deleted successfully";
    }
}