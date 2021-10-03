package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1808:int;
      
      private var var_2717:String;
      
      private var var_310:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1808 = param1.readInteger();
         this.var_2717 = param1.readString();
         this.var_310 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1808;
      }
      
      public function get nodeName() : String
      {
         return this.var_2717;
      }
      
      public function get visible() : Boolean
      {
         return this.var_310;
      }
   }
}
