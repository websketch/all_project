package com.mediazone.dao;

import java.util.Properties;
import java.util.ArrayList;

/**
 * container of all values
 * 
 */
public class Entity {
    
    private Properties prop = new Properties();
    private ArrayList children = new ArrayList();
    public Object get(String key) { return prop.get(key); }
    public Object getChildValue(int cursor, String key) { return getChild(cursor).get(key); }
    public Entity getChild(int cursor) { return cursor < children.size() ? (Entity)children.get(cursor) : null; }    
    
    public void set(String key, Object value) { prop.put(key, value); }
    public void set(int cursor, String key, Object value) {
        Entity entity = getChild(cursor);
        if (entity == null) { 
            entity = newEntity(); 
            addEntity(cursor, entity);
        }
        entity.set(key, value);        
    }
    public void addEntity(Entity entity) { children.add(entity); }
    public void addEntity(int cursor, Entity entity) { children.add(cursor, entity); }
    public int size() { return children.size(); }
    protected Entity newEntity() { return new Entity(); }
}
