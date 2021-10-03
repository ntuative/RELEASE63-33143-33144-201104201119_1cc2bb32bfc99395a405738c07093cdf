package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1846:String;
      
      private var var_2544:int;
      
      private var var_2546:int;
      
      private var var_1851:int;
      
      private var _id:int;
      
      private var var_2542:Boolean;
      
      private var _type:String;
      
      private var var_1848:String;
      
      private var var_1847:int;
      
      private var var_2541:String;
      
      private var var_2545:int;
      
      private var var_2543:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1846 = param1.readString();
         this.var_2544 = param1.readInteger();
         this.var_2546 = param1.readInteger();
         this.var_1851 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2542 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1848 = param1.readString();
         this.var_1847 = param1.readInteger();
         this.var_2541 = param1.readString();
         this.var_2545 = param1.readInteger();
         this.var_2543 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1848 = "";
         this.var_1847 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1846;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2544;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2546;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1851;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2542;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1848;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1847;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2545;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2543;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1846;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2541;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
   }
}
