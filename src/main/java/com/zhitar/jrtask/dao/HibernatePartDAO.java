package com.zhitar.jrtask.dao;

import com.zhitar.jrtask.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HibernatePartDAO implements IPartDAO {

    private int sort = 0;

    @Autowired
    private SessionFactory sessionFactory;

    private Session currentSession() {
        return sessionFactory.openSession();
    }

    @Override
    public List<Part> getAll(int sort) {
        if (sort == -1) {
            sort = this.sort;
        } else {
            this.sort = sort;
        }
        switch (sort) {
            case 1:
                return currentSession().createQuery("from Part where necessary = 1 order by name", Part.class).list();
            case 2:
                return currentSession().createQuery("from Part where necessary = 0 order by name", Part.class).list();
        }
        return currentSession().createQuery("from Part order by name", Part.class).list();
    }

    public List<Part> getByPage(int page) {
        int lastIndex = page * 10;
        List<Part> result = getAll(sort);
        int lastValue = result.size();
        if (lastIndex > lastValue)
            lastIndex = lastValue;
        return result.subList((page - 1) * 10, lastIndex);
    }

    @Override
    public Part getPart(String name) {
        Session session = currentSession();
        Query<Part> q = session.createQuery(
                "from Part where name = :name", Part.class);
        q.setParameter("name", name);
        Part part = q.list().stream().findAny().orElse(null);
        session.close();
        return part;
    }

    @Override
    public Part getMinNecessaryPart() {
        Session session = currentSession();
        Query<Part> q = session.createQuery("from Part where quantity = (select min(p.quantity) from Part p where necessary = true)");
        Part part = q.list().stream().findAny().orElse(null);
        return part;
    }

    @Override
    public void addPart(Part part) {
        Part oldPart = getPart(part.getName());
        Session session = currentSession();
        if (oldPart != null) {
            part.setId(oldPart.getId());
            Transaction transaction = session.beginTransaction();
            session.update(part);
            transaction.commit();
        } else {
            session.save(part);
        }
        session.close();
    }

    @Override
    public void deletePart(Integer id) {
        Session session = currentSession();
        Part p = session.load(Part.class, new Integer(id));
        if (p != null) {
            Transaction transaction = session.beginTransaction();
            session.delete(p);
            transaction.commit();
        }
        session.close();
    }
}
