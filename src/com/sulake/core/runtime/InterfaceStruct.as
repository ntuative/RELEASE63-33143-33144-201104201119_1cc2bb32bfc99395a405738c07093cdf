package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1367:IID;
      
      private var var_1636:String;
      
      private var var_110:IUnknown;
      
      private var var_719:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1367 = param1;
         this.var_1636 = getQualifiedClassName(this.var_1367);
         this.var_110 = param2;
         this.var_719 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1367;
      }
      
      public function get iis() : String
      {
         return this.var_1636;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_110;
      }
      
      public function get references() : uint
      {
         return this.var_719;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_110 == null;
      }
      
      public function dispose() : void
      {
         this.var_1367 = null;
         this.var_1636 = null;
         this.var_110 = null;
         this.var_719 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_719;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_719) : uint(0);
      }
   }
}
