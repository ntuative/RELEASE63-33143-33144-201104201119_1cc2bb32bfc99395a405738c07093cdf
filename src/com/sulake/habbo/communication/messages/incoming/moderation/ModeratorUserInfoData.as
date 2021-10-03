package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2866:int;
      
      private var var_2869:int;
      
      private var var_817:Boolean;
      
      private var var_2868:int;
      
      private var var_2870:int;
      
      private var var_2867:int;
      
      private var var_2865:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2866 = param1.readInteger();
         this.var_2869 = param1.readInteger();
         this.var_817 = param1.readBoolean();
         this.var_2868 = param1.readInteger();
         this.var_2870 = param1.readInteger();
         this.var_2867 = param1.readInteger();
         this.var_2865 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2866;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2869;
      }
      
      public function get online() : Boolean
      {
         return this.var_817;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2868;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2870;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2867;
      }
      
      public function get banCount() : int
      {
         return this.var_2865;
      }
   }
}
