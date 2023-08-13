/**
 * @description       :
 * @author            : Soulberto Lorenzo <soulberto@cloudblue.us>
 * @group             :
 * @last modified on  : 08-13-2023
 * @last modified by  : Soulberto Lorenzo <soulberto@cloudblue.us>
 **/
public abstract with sharing class Logger {  

    public static Boolean isEnabled = false;

    public static Boolean isEnabled() {
      return Logger.isEnabled;
    }

    public static void setEnabled(Boolean enabled) {
      Logger.isEnabled = enabled;
    }

    /**
    * @description 
    * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023 
    * @return String 
    **/
    public String getName() {
      return String.valueOf(this).substring(0, String.valueOf(this).indexOf(':'));
    }
  
    public Logger() {
      isEnabled = true;
    }
  
    /**
     * @description
     * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023
     * @param message
     * @param args
     **/
    public static String debug(
      String className,
      LoggingLevel level,
      String message,
      List<Object> args
    ) {
      String formatted;

      if (Logger.isEnabled) {
        List<Object> params = new List<Object>{ className, message };
        if (args == null) {
          args = new List<Object>();
        }
        formatted = className + ': ' + String.format(message, args);
        System.debug(level, formatted);
      }

      return formatted;
    }
  
    /**
     * @description
     * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023
     * @param message
     * @param args
     **/
    public static String debug(
      String className,
      LoggingLevel level,
      String message
    ) {
      return Logger.debug(className, level, message, new List<Object>());
    }
  
    /**
     * @description
     * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023
     * @param message
     **/
    public String log(String message, List<Object> args) {
      return Logger.debug(this.getName(), LoggingLevel.DEBUG, message, args);
    }
  
    /**
     * @description
     * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023
     * @param message
     **/
    public String log(String message) {
      return Logger.debug(this.getName(), LoggingLevel.DEBUG, message, null);
    }
  
    /**
     * @description
     * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023
     * @param message
     **/
    public String error(String message, List<Object> args) {
      return Logger.debug(this.getName(), LoggingLevel.ERROR, message, args);
    }
  
    /**
     * @description
     * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 08-13-2023
     * @param message
     **/
    public String error(String message) {
      return Logger.debug(this.getName(), LoggingLevel.ERROR, message, null);
    }
  }
  