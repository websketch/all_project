package com.mediazone.dao;

import java.util.*;

public class BaseBean
    extends com.mediazone.dao.Entity {

  public BaseBean() {}

  /**
   * get a string field from entity
   * @param key	field name
   * @param defaultValue if field value is null or the field name is not in the entity, return the default value.
   * @return if field value is null or the field name is not in the entity, return the default value.
   */
  public String getString(String key, String defaultValue) {
    Object value = get(key);
    if (value == null) {
      return defaultValue;
    }
    else {
      return value.toString();
    }
  }

  public String getString(String key) {
    return getString(key, null);
  }

  /**
   * get a string field from current entity's record
   * @param cursor				record number, first record is 0
   * @param key					the field name
   * @param defaultValue	if field value is null or the field name is not in the entity, return the default value.
   * @return if field value is null or the field name is not in the entity, return the default value.
   */
  public String getString(int cursor, String key, String defaultValue) {
    Object value = getChildValue(cursor, key);
    if (value == null) {
      return defaultValue;
    }
    else {
      return value.toString();
    }
  }

  public String getString(int cursor, String key) {
    return getString(cursor, key, null);
  }

  /**
   * get a integer field from entity
   * @param key	field name
   * @param defaultValue if field value is null or the field name is not in the entity, return the default value.
   * @return if field value is null or the field name is not in the entity, return the default value.
   */
  public int getInt(String key, int defaultValue) {
    Integer value = (Integer) get(key);
    if (value == null) {
      return defaultValue;
    }
    else {
      return value.intValue();
    }
  }

  public int getInt(String key) {
    return getInt(key, 0);
  }

  /**
   * get an integer field from current entity's record
   * @param cursor				record number, first record is 0
   * @param key					the field name
   * @param defaultValue	if field value is null or the field name is not in the entity, return the default value.
   * @return if field value is null or the field name is not in the entity, return the default value.
   */
  public int getInt(int cursor, String key, int defaultValue) {
    Integer value = (Integer) getChildValue(cursor, key);
    if (value == null) {
      return defaultValue;
    }
    else {
      return value.intValue();
    }
  }

  public int getInt(int cursor, String key) {
    return getInt(cursor, key, 0);
  }

  /**
   * query an entity
   * @param name				table name
   * @param condition	query condition append to where clause
   * @param suffix			sql suffix, it will be appended to sql's tile
       * @param args				the arguments of ? in condition, for statment's set* method.
   * @param entity			result entity, if it's null method will new an entity and returen it.
   * @return						if param entity is not null, return param entity. else return a new entity contains query result.
   */

  public static BaseBean queryEntity(String name, String condition,
                                     String suffix, List args, BaseBean entity) throws
      Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
    String sql = "select * from " + name;
    if (condition != null && condition.length() > 0) {
      sql += " where " + condition;
    }
    if (suffix != null && suffix.length() > 0) {
      sql += " " + suffix;
    }
    com.mediazone.dao.DataSource.getInstance().execute(sql, args, entity);
    return entity;
  }

  public static BaseBean queryEntity(String name, String condition,
                                     String suffix, List args) throws Exception {
    return queryEntity(name, condition, suffix, args, null);
  }

  public void query(String name, String condition, String suffix, List args) throws
      Exception {
    queryEntity(name, condition, suffix, args, this);
  }

  public static BaseBean queryEntity(String name, String condition, List args,
                                     BaseBean entity) throws Exception {
    return queryEntity(name, condition, null, args, entity);
  }

  public static BaseBean queryEntity(String name, String condition, List args) throws
      Exception {
    return queryEntity(name, condition, null, args, null);
  }

  public void query(String name, String condition, List args) throws Exception {
    queryEntity(name, condition, null, args, this);
  }

  /**
   * query an entity
   * @param sql				the query sql
   * @param args				the arguments of ? in sql
   * @param entity			result entity, if it's null method will new an entity and returen it.
   * @return						if param entity is not null, return param entity. else return a new entity contains query result.
   */
  public static BaseBean queryEntity(String sql, List args, BaseBean entity) throws
      Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
	com.mediazone.dao.DataSource.getInstance().execute(sql, args, entity);
    return entity;
  }

  public static BaseBean queryEntity(String sql, List args) throws Exception {
    return queryEntity(sql, args, null);
  }
  
  public static BaseBean queryEntity(String sql) throws Exception {
	    return queryEntity(sql, (List)null, null);
	  }

  public void query(String sql, List args) throws Exception {
    queryEntity(sql, args, this);
  }

  /**
   * update setValues into a table
   * @param name						the table name
   * @param setValues			all the update names and values
   * @param condition			update condition, will be append in where clause
   * @param cargs					condition arguments of ? in condition.
   * @param entity					result entity, it will be set a field named "result", which contains the number of update rows.
   * @return								if param entity is not null, return param entity. else return a new entity contains a field named "result", which contains the number of update rows.
   * @throws Exception
   */
  public static BaseBean updateEntity(String name, Properties setValues,
                                      String condition, List cargs,
                                      BaseBean entity) throws Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
    List args = new ArrayList();
    String sql = updateStringBuilder(name, setValues, condition, cargs, args);
//
//        String setStr = "";
//        Enumeration enum = setValues.keys();
//        while (enum.hasMoreElements()) {
//            String key = (String)enum.nextElement();
//            if (setStr.length() > 0) { setStr += ", "; }
//            setStr += key + "=?";
//            args.add(setValues.get(key));
//        }
//        sql += " set " + setStr;
//        if (condition != null && condition.length() > 0) { sql += " where " + condition; }
//        if (cargs != null) { args.addAll(cargs); }
	com.mediazone.dao.DataSource.getInstance().execute(sql, args, entity);
    return entity;
  }

  public static BaseBean updateEntity(String name, Properties setValues,
                                      String condition, List cargs) throws
      Exception {
    return updateEntity(name, setValues, condition, cargs, null);
  }

  public void update(String name, Properties setValues, String condition,
                     List cargs) throws Exception {
    updateEntity(name, setValues, condition, cargs, this);
  }

  public static BaseBean updateEntity(String sql, List args, BaseBean entity) throws
      Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
	com.mediazone.dao.DataSource.getInstance().execute(sql, args, entity);
    return entity;

  }

  /**
   * insert setValues into a table
   * @param name					table name
   * @param setValues		all the insert names and values
   * @param entity				result entity, it will be set a field named "result", which contains the number of update rows.
   * @return								if param entity is not null, return param entity. else return a new entity contains a field named "result", which contains the number of update rows.
   */
  public static BaseBean insertEntity(String name, Properties setValues,
                                      BaseBean entity) throws Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
    ArrayList args = new ArrayList();
    String sql = insertStringBuilder(name, setValues, args);
	com.mediazone.dao.DataSource.getInstance().execute(sql, args, entity);
    return entity;
  }

  public static BaseBean insertEntity(String name, Properties setValues) throws
      Exception {
    return insertEntity(name, setValues, null);
  }

  public void insert(String name, Properties setValues) throws Exception {
    insertEntity(name, setValues, this);
  }

  /**
   * delete rows from table
   * @param name						table name
   * @param condition			delete condition, append to where clause
   * @param args						the arguments of ? in condition
   * @param entity					result entity, it will be set a field named "result", which contains the number of update rows.
   * @return								if param entity is not null, return param entity. else return a new entity contains a field named "result", which contains the number of update rows.
   * @throws Exception
   */
  public static BaseBean deleteEntity(String name, String condition, List args,
                                      BaseBean entity) throws Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
    String sql = deleteStringBuilder(name, condition);
	com.mediazone.dao.DataSource.getInstance().execute(sql, args, entity);
    return entity;
  }

  public static BaseBean deleteEntity(String name, String condition, List args) throws
      Exception {
    return deleteEntity(name, condition, args, null);
  }

  public void delete(String name, String condition, List args) throws Exception {
    deleteEntity(name, condition, args, this);
  }

  /**
   * batch one or more sqls one time
   * @param sqls					the list of sqls
   * @param argses				the args List for each sqls.
   * @param entity				result entity, it will has rows for return result.
   * @return
   * @throws Exception
   */
  public static BaseBean batchEntity(List sqls, List argses, BaseBean entity) throws
      Exception {
    if (entity == null) {
      entity = new BaseBean();
    }
	com.mediazone.dao.DataSource.getInstance().execute(sqls, argses, entity);
    return entity;
  }

  public static BaseBean batchEntity(List operations, List tables,
                                     List setValues, List conditions,
                                     List cargses, BaseBean entity) throws
      Exception {
    ArrayList sqls = new ArrayList();
    ArrayList argses = new ArrayList();
    for (int i = 0; i < operations.size(); i++) {
      String operation = (String) operations.get(i);
      if ("update".equals(operation)) {
        ArrayList args = new ArrayList();
        sqls.add(updateStringBuilder( (String) tables.get(i),
                                     (Properties) setValues.get(i),
                                     (String) conditions.get(i),
                                     (List) cargses.get(i), args));
        argses.add(args);
      }
      if ("delete".equals(operation)) {
        List args = (List) cargses.get(i);
        sqls.add(deleteStringBuilder( (String) tables.get(i),
                                     (String) conditions.get(i)));
        argses.add(args);
      }
      if ("insert".equals(operation)) {
        ArrayList args = new ArrayList();
        sqls.add(insertStringBuilder( (String) tables.get(i),
                                     (Properties) setValues.get(i), args));
        argses.add(args);
      }
    }
    return batchEntity(sqls, argses, entity);
  }

  protected static String updateStringBuilder(String name, Properties setValues,
                                              String condition, List cargs,
                                              List args) {
    String sql = "update " + name;
    String setStr = "";
    Enumeration enum = setValues.keys();
    while (enum.hasMoreElements()) {
      String key = (String) enum.nextElement();
      if (setStr.length() > 0) {
        setStr += ", ";
      }
      setStr += key + "=?";
      args.add(setValues.get(key));
    }
    sql += " set " + setStr;
    if (condition != null && condition.length() > 0) {
      sql += " where " + condition;
    }
    if (cargs != null) {
      args.addAll(cargs);
    }
    return sql;
  }

  protected static String insertStringBuilder(String name, Properties setValues,
                                              ArrayList args) {
    String sql = "insert into " + name;
    String setStr = "";
    String valueStr = "";
    Enumeration enum = setValues.keys();
    while (enum.hasMoreElements()) {
      String key = (String) enum.nextElement();
      if (setStr.length() > 0) {
        setStr += ", ";
        valueStr += ", ";
      }
      setStr += key;
      valueStr += "?";
      args.add(setValues.get(key));
    }
    sql += " (" + setStr + ") values (" + valueStr + ")";
    return sql;
  }

  protected static String deleteStringBuilder(String name, String condition) {
    String sql = "delete from " + name;
    if (condition != null && condition.length() > 0) {
      sql += " where " + condition;
    }
    return sql;
  }

  /**
   * any subclass should override this method
   */
  protected com.mediazone.dao.Entity newEntity() {
    return new BaseBean();
  }

  public static void main(String[] args) throws Exception {

  }
}
