package br.com.kolss.validators;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import br.com.kolss.bbeans.BbLocale;

/** Validador responsavel por garantir que a senha escolhida
 * contenha numeros, caracteres especiais, letras e que
 * tenha no minimo 7 e no maximo 22 caracteres  */

@FacesValidator(value="passwordValidator")
public class PasswordValidator implements Validator {

    int num = 0;
    int carac = 0;

    //Define um array de caracteres especiais
    char[] caracteresEspeciais={'=','|','!','@','#','$','%','^','&','*','(',')','{','}','[',']',';',':','.',',','<','>','?','~','+','-','_','\'','"'};
    
    @Override
    public void validate(FacesContext context,UIComponent component, Object value) throws ValidatorException {
        if (value == null) {
            return;
        }      
        
        String password = (String)value;
        
        /*Monta um array de caracteres com o conteudo da senha
         * e percorre-o contando quantos numeros a senha possui*/        
        for(int i=0;i<password.length();i++) {            
            if(password.charAt(i)>=48 && password.charAt(i)<=57) {
                num++;
            }
        }
        System.out.println("Foram encontrados "+num+" numeros na senha!");                                        
        
        /*Monta um array de caracteres com o conte�do da senha
         * e percorre-o contando quantos caracteres especias a senha possui*/        
        for(int i=0;i<password.length();i++) {
            for(int j=0;j<caracteresEspeciais.length;j++) {
                if(password.charAt(i)==caracteresEspeciais[j]) {
                    carac++;
                }
            }
        }
        System.out.println("Foram encontrados "+carac+" caracteres especias na senha!");
        
        //Verifica se a senha nao e vazia
        if(password == null || password.equals("")){
             throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
            		 BbLocale.getI18nMessage("message.alert.password_cannot_null"),
            		 ""));
             
             
        //Verifica se foi encontrado pelo menos um numero e um caracter especial
        } else if(!(carac > 0)|| !(num > 0)){            
             throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
            		 BbLocale.getI18nMessage("message.alert.password_must_contain_numbers_letters_symbols"),
            		 ""));
             
             
        //Verifica se a senha possui pelo menos 7 caracteres e no maximo 22
        } else if(password.length() < 7){
             throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
            		 BbLocale.getI18nMessage("message.alert.password_min_length"),
            		 ""));
             
        } else if(password.length() >= 22){
             throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
            		 BbLocale.getI18nMessage("message.alert.password_max_length"),
            		 ""));
             
        } 
    }
}
