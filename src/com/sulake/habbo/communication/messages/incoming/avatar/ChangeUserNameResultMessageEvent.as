package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_563:int = 0;
      
      public static var var_864:int = 1;
      
      public static var var_868:int = 2;
      
      public static var var_867:int = 3;
      
      public static var var_866:int = 4;
      
      public static var var_869:int = 5;
      
      public static var var_1066:int = 6;
      
      public static var var_1069:int = 7;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_10 as ChangeUserNameResultMessageParser;
      }
   }
}
