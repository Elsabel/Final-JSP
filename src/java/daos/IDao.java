/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 *
 * @author demen
 */
public interface IDao<E> {

    public E save(E entity);

    public E delete(E entity);

    public List<E> select(String key);

    public List<E> search(String table, String field, String key);

    public E selectByField(String table, String field1, String field2, String key1, String key2);

    public E selectByField(String table, String field, String key);
}
