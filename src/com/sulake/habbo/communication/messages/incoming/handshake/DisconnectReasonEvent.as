package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1953:int = 0;
      
      public static const const_1631:int = 1;
      
      public static const const_1734:int = 2;
      
      public static const const_1927:int = 3;
      
      public static const const_1994:int = 4;
      
      public static const const_1952:int = 5;
      
      public static const const_1530:int = 10;
      
      public static const const_1979:int = 11;
      
      public static const const_1908:int = 12;
      
      public static const const_1993:int = 13;
      
      public static const const_2013:int = 16;
      
      public static const const_2029:int = 17;
      
      public static const const_1943:int = 18;
      
      public static const const_2036:int = 19;
      
      public static const const_1872:int = 20;
      
      public static const const_2050:int = 22;
      
      public static const const_2064:int = 23;
      
      public static const const_1907:int = 24;
      
      public static const const_1906:int = 25;
      
      public static const const_1898:int = 26;
      
      public static const const_1878:int = 27;
      
      public static const const_1919:int = 28;
      
      public static const const_2022:int = 29;
      
      public static const const_1858:int = 100;
      
      public static const const_2056:int = 101;
      
      public static const const_1935:int = 102;
      
      public static const const_1937:int = 103;
      
      public static const const_1861:int = 104;
      
      public static const const_1957:int = 105;
      
      public static const const_1945:int = 106;
      
      public static const const_1903:int = 107;
      
      public static const const_1914:int = 108;
      
      public static const const_2005:int = 109;
      
      public static const const_1881:int = 110;
      
      public static const const_1884:int = 111;
      
      public static const const_2046:int = 112;
      
      public static const const_1997:int = 113;
      
      public static const const_1998:int = 114;
      
      public static const const_2038:int = 115;
      
      public static const const_2062:int = 116;
      
      public static const const_2052:int = 117;
      
      public static const const_1931:int = 118;
      
      public static const const_2033:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get method_11() : String
      {
         switch(this.reason)
         {
            case const_1631:
            case const_1530:
               return "banned";
            case const_1734:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
