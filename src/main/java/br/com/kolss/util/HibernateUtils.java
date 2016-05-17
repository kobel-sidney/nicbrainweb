package br.com.kolss.util;

import java.beans.PropertyDescriptor;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Transient;

import org.apache.commons.beanutils.PropertyUtils;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;

public class HibernateUtils {
    @Transient
    public static List<String> getCollectionProperties(Class<?> entity) {
        List<String> collectionProperties = new LinkedList<String>();
        for (PropertyDescriptor descriptor : PropertyUtils.getPropertyDescriptors(entity)) {
            if (Collection.class.isAssignableFrom(descriptor.getPropertyType()) &&
                descriptor.getReadMethod().getAnnotation(Transient.class) == null) {
                collectionProperties.add(descriptor.getName());
            }
        }
        return collectionProperties;
    }
    
    public static void initializeProperties(Object entity, String... properties) {
        if (properties == null)
            return;
        
        if (entity != null) {
            if (entity instanceof Collection) {
                Hibernate.initialize(entity);
                
                if(properties != null) {
                    for (Object singleEntity: (Collection<?>) entity) {
                        initializeProperties(singleEntity, properties);
                    }
                }
            } else {
                for (String property : properties) {
                    try {
                        int dotIndex = property.indexOf(".");
                        if (dotIndex > 0) {
                            Object value = PropertyUtils.getProperty(entity, property.substring(0, dotIndex));
                            Hibernate.initialize(value);
                            initializeProperties(value, property.substring(dotIndex+1, property.length()));
                            continue;
                        }
                        Object value = PropertyUtils.getProperty(entity, property);
                        Hibernate.initialize(value);
                        
                        //Novo trecho de codigo, importante pois em diversos locais do software, podem ocorrer problemas de LAZY, neste caso, se for uma 
                        //collection devemos percorrer TODOS os registros e chamar um metodo para o hibernate inicializar direito
                        if (value != null && value instanceof Collection) {
                            for (Object itemCol : (Collection)value) {
                            	//Todos tem hashCode...
                                itemCol.hashCode();
                            }
                        }
                        
                    } catch (Exception e) {
                        //e.printStackTrace();
                    }
                }
            }
        }
    }
    
    @Transient
    public static void setCollectionsAsSelect(Criteria criteria, Class<?> entity) {
        setPropertiesAsSelect(criteria, getCollectionProperties(entity).toArray(new String[0]));
    }
    
    public static void setPropertiesAsSelect(Criteria criteria, String... properties) {
        setPropertyFetchMode(criteria, FetchMode.SELECT, properties);
    }
    
    public static void setPropertiesAsJoin(Criteria criteria, String... properties) {
        setPropertyFetchMode(criteria, FetchMode.JOIN, properties);
    }
    
    protected static void setPropertyFetchMode(Criteria criteria, FetchMode mode, String... properties) {
        if (properties == null)
            return;
        for (String property : properties)
            criteria.setFetchMode(property, mode);
    }
}
