package br.com.kolss.util;

import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.context.Flash;

import org.hibernate.Session;

public class FacesContextUtil {
	
	private static final String HIBERNATE_SESSION = "hibernate_session";
	
	public static void setRequestSession(Session session) {
		FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put(HIBERNATE_SESSION, session);
	}
	
	public static Session getRequestSession() {
		return (Session) FacesContext.getCurrentInstance().getExternalContext().getRequestMap().get(HIBERNATE_SESSION);
	}
	
	public static void addMessageError(String titulo, String mensagem){
          FacesMessage facesMessage = new FacesMessage(FacesMessage.SEVERITY_FATAL, titulo, mensagem);
          FacesContext.getCurrentInstance().addMessage(null, facesMessage);
	  }
  
	public static void addMessageInfo(String titulo, String mensagem){
          FacesMessage facesMessage = new FacesMessage(FacesMessage.SEVERITY_INFO, titulo, mensagem);
          FacesContext.getCurrentInstance().addMessage(null, facesMessage);
  		}  
	
	
	 public static void setSessionAttributeFlash(String attributeName, Object attributeValue) {    
         try {    
             Flash flash = FacesContext.getCurrentInstance().getExternalContext().getFlash();    
             if (flash != null && attributeName!=null){    
                	flash.put(attributeName, attributeValue);    
             }     
         } catch (Exception e) {    
             e.printStackTrace();    
         }    
     }       
 
 public static Object getSessionAttributeFlash(String nomeAtributo){   
	 
         try {    
             Flash flash = FacesContext.getCurrentInstance().getExternalContext().getFlash();    
             if (flash != null && nomeAtributo != null) {    
                     return flash.get(nomeAtributo);    
                 } else {    
                     return null;    
             }    
         } catch (Exception e) {    
         	e.printStackTrace();    
             return null;    
         } 
 }

	
    public static void setSessionAttribute(String attributeName, Object attributeValue) {    
            try {    
                ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();    
                if (ec != null){    
                    Map<String, Object> attrMap = ec.getSessionMap();       
                    if (attrMap != null) {    
                        attrMap.put(attributeName, attributeValue);    
                    }     
                }     
            } catch (Exception e) {    
                e.printStackTrace();    
            }    
            }       
    
    public static Object getSessionAttribute(String nomeAtributo){          
            try {    
                ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();    
                if (ec != null){    
                    Map<String, Object> attrMap = ec.getSessionMap();       
                    if (attrMap != null) {    
                        return attrMap.get(nomeAtributo);    
                    } else {    
                        return null;    
                    }    
                } else {    
                    return null;    
                }    
            } catch (Exception e) {    
            	e.printStackTrace();    
                return null;    
            } 
    }


}
