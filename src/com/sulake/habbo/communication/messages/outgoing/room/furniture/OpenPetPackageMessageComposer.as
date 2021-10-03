package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_369:int;
      
      private var var_2760:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_369 = param1;
         this.var_2760 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_369,this.var_2760];
      }
      
      public function dispose() : void
      {
      }
   }
}
