/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javassist.bytecode.stackmap.BasicBlock;
import models.UserAccount;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;

/**
 *
 * @author USER
 */
public class GeneralDao<E> implements IDao<E> {

    private Session session;
    private Transaction transaction;
    private SessionFactory sessionFactory;
    public GeneralDao fd;

    public GeneralDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override

    public E save(E entity) {
        return execute(entity, null, 1, null, null, null, null, null);
    }

    @Override

    public E delete(E entity) {
        return execute(entity, null, 2, null, null, null, null, null);
    }

    @Override

    public List<E> select(String entity) {
        //  List<E> data = new ArrayList<>();
        return (List<E>) execute((E) entity, null, 3, null, null, null, null, null);
    }

    @Override
    public List<E> search(String table, String field, String key) {
        return (List<E>) execute(null, null, 4, table, field, key, null, null);
    }

    @Override
    public E selectByField(String tabel, String field1, String field2, String fname, String lname) {
        return (E) execute(null, null, 6, tabel, field1, fname, field2, lname);
    }

    @Override
    public E selectByField(String table, String field, String key) {
        return (E) execute(null, null, 5, table, field, key, null, null);
    }

    public Object getNewId(String table, String field) {
        return execute(null, null, 7, table, field, null, null, null);

    }

    /**
     * ketentuan pilihan 1. saveorupdate 2. delete 3. select 4. search 5.
     * SelectByField ==> menggunakan satu field 6. SelectByField2 ==>
     * menggunakan dua field 7. max (mengambil id dengan nilai terbesar)
     *
     * @param entity
     * @param query
     * @param fungsi
     * @param tabel
     * @param field
     * @param key
     * @param field2
     * @param key2
     * @return
     */
    public E execute(E entity, String query, int fungsi, String tabel, String field, String key, String field2, String key2) {

        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            switch (fungsi) {
                case 1:
                    session.saveOrUpdate(entity);
                    break;
                case 2:
                    session.delete(entity);
                    break;
                case 3:
                    return (E) session
                            .createQuery("from " + entity + " order by 1")
                            .list();
                case 4:
                    return (E) session.createQuery("from " + tabel + " where " + field + "  like :keys")
                            .setString("keys", "%" + key + "%")
                            .list();
                case 5:
                    return (E) session.createQuery("from " + tabel + " where " + field + " = :key")
                            .setString("key", key)
                            .uniqueResult();
                case 6:
                    return (E) session.createQuery("from " + tabel + " where " + field + "  like :key and " + field2 + " like :keys")
                            .setString("key", key)
                            .setString("keys", key2)
                            .uniqueResult();
                default:
                    return (E) session.createQuery("select max(" + field + ") from " + tabel + "").uniqueResult();
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return entity;
    }

}
