package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2169:String;
      
      private var var_2171:int;
      
      private var var_2167:int;
      
      private var var_2170:String;
      
      private var var_2168:int;
      
      private var var_1808:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2169 = param1.readString();
         this.var_2171 = param1.readInteger();
         this.var_2167 = param1.readInteger();
         this.var_2170 = param1.readString();
         this.var_2168 = param1.readInteger();
         this.var_1808 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2169;
      }
      
      public function get unitPort() : int
      {
         return this.var_2171;
      }
      
      public function get worldId() : int
      {
         return this.var_2167;
      }
      
      public function get castLibs() : String
      {
         return this.var_2170;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2168;
      }
      
      public function get nodeId() : int
      {
         return this.var_1808;
      }
   }
}
