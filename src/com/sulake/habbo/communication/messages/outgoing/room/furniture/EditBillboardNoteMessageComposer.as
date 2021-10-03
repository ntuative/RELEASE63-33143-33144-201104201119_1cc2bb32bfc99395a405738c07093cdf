package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class EditBillboardNoteMessageComposer implements IMessageComposer
   {
       
      
      private var var_1660:int;
      
      private var var_418:String;
      
      private var _message:String;
      
      public function EditBillboardNoteMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         this.var_1660 = param1;
         this.var_418 = param2;
         this._message = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1660,this.var_418,this._message];
      }
   }
}
