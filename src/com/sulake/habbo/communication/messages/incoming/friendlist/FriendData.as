package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_991:int;
      
      private var var_817:Boolean;
      
      private var var_1830:Boolean;
      
      private var var_654:String;
      
      private var var_1591:int;
      
      private var var_1703:String;
      
      private var var_1704:String;
      
      private var var_1702:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_991 = param1.readInteger();
         this.var_817 = param1.readBoolean();
         this.var_1830 = param1.readBoolean();
         this.var_654 = param1.readString();
         this.var_1591 = param1.readInteger();
         this.var_1703 = param1.readString();
         this.var_1704 = param1.readString();
         this.var_1702 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_991;
      }
      
      public function get online() : Boolean
      {
         return this.var_817;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1830;
      }
      
      public function get figure() : String
      {
         return this.var_654;
      }
      
      public function get categoryId() : int
      {
         return this.var_1591;
      }
      
      public function get motto() : String
      {
         return this.var_1703;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1704;
      }
      
      public function get realName() : String
      {
         return this.var_1702;
      }
   }
}
