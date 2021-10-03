package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2252:int;
      
      private var var_1964:String;
      
      private var var_2486:String;
      
      private var var_2482:Boolean;
      
      private var var_2483:Boolean;
      
      private var var_2484:int;
      
      private var var_2485:String;
      
      private var var_2481:String;
      
      private var var_1702:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2252 = param1.readInteger();
         this.var_1964 = param1.readString();
         this.var_2486 = param1.readString();
         this.var_2482 = param1.readBoolean();
         this.var_2483 = param1.readBoolean();
         param1.readString();
         this.var_2484 = param1.readInteger();
         this.var_2485 = param1.readString();
         this.var_2481 = param1.readString();
         this.var_1702 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2252;
      }
      
      public function get avatarName() : String
      {
         return this.var_1964;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2486;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2482;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2483;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2484;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2485;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2481;
      }
      
      public function get realName() : String
      {
         return this.var_1702;
      }
   }
}
