package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_431:int = 1;
      
      public static const const_234:int = 2;
      
      public static const const_320:int = 3;
      
      public static const const_398:int = 4;
      
      public static const const_229:int = 5;
      
      public static const const_378:int = 1;
      
      public static const const_727:int = 2;
      
      public static const const_749:int = 3;
      
      public static const const_735:int = 4;
      
      public static const const_261:int = 5;
      
      public static const const_671:int = 6;
      
      public static const const_914:int = 7;
      
      public static const const_226:int = 8;
      
      public static const const_420:int = 9;
      
      public static const const_1897:int = 10;
      
      public static const const_747:int = 11;
      
      public static const const_628:int = 12;
       
      
      private var var_448:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_448 = new Array();
         this.var_448.push(new Tab(this._navigator,const_431,const_628,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_603));
         this.var_448.push(new Tab(this._navigator,const_234,const_378,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_603));
         this.var_448.push(new Tab(this._navigator,const_398,const_747,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1242));
         this.var_448.push(new Tab(this._navigator,const_320,const_261,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_603));
         this.var_448.push(new Tab(this._navigator,const_229,const_226,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_876));
         this.setSelectedTab(const_431);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_398;
      }
      
      public function get tabs() : Array
      {
         return this.var_448;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_448)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_448)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_448)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
