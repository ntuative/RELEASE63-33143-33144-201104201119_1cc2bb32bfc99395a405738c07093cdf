package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1491:int;
      
      private var var_1760:int;
      
      private var var_2197:int;
      
      private var var_1890:int;
      
      private var var_1492:int;
      
      private var var_2198:String = "";
      
      private var var_2199:String = "";
      
      private var var_2200:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1491 = param1.readInteger();
         this.var_2198 = param1.readString();
         this.var_1760 = param1.readInteger();
         this.var_2197 = param1.readInteger();
         this.var_1890 = param1.readInteger();
         this.var_1492 = param1.readInteger();
         this.var_2200 = param1.readInteger();
         this.var_2199 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1491;
      }
      
      public function get points() : int
      {
         return this.var_1760;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2197;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1890;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1492;
      }
      
      public function get badgeID() : String
      {
         return this.var_2198;
      }
      
      public function get achievementID() : int
      {
         return this.var_2200;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2199;
      }
   }
}
