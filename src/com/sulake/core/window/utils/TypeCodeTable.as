package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_898;
         param1["bitmap"] = const_910;
         param1["border"] = const_826;
         param1["border_notify"] = const_1709;
         param1["button"] = const_585;
         param1["button_thick"] = const_938;
         param1["button_icon"] = const_1785;
         param1["button_group_left"] = const_670;
         param1["button_group_center"] = const_673;
         param1["button_group_right"] = const_751;
         param1["canvas"] = const_790;
         param1["checkbox"] = const_822;
         param1["closebutton"] = const_1182;
         param1["container"] = const_385;
         param1["container_button"] = const_947;
         param1["display_object_wrapper"] = const_687;
         param1["dropmenu"] = const_620;
         param1["dropmenu_item"] = const_556;
         param1["frame"] = const_397;
         param1["frame_notify"] = const_1606;
         param1["header"] = const_753;
         param1["html"] = const_1081;
         param1["icon"] = const_1229;
         param1["itemgrid"] = const_1091;
         param1["itemgrid_horizontal"] = const_512;
         param1["itemgrid_vertical"] = const_806;
         param1["itemlist"] = const_1180;
         param1["itemlist_horizontal"] = const_368;
         param1["itemlist_vertical"] = const_389;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1513;
         param1["menu"] = const_1671;
         param1["menu_item"] = const_1684;
         param1["submenu"] = const_1148;
         param1["minimizebox"] = const_1528;
         param1["notify"] = const_1657;
         param1["null"] = const_824;
         param1["password"] = const_774;
         param1["radiobutton"] = const_775;
         param1["region"] = const_579;
         param1["restorebox"] = const_1696;
         param1["scaler"] = const_610;
         param1["scaler_horizontal"] = const_1627;
         param1["scaler_vertical"] = const_1611;
         param1["scrollbar_horizontal"] = const_572;
         param1["scrollbar_vertical"] = const_866;
         param1["scrollbar_slider_button_up"] = const_1135;
         param1["scrollbar_slider_button_down"] = const_1215;
         param1["scrollbar_slider_button_left"] = const_1268;
         param1["scrollbar_slider_button_right"] = const_1160;
         param1["scrollbar_slider_bar_horizontal"] = const_1114;
         param1["scrollbar_slider_bar_vertical"] = const_1149;
         param1["scrollbar_slider_track_horizontal"] = const_1201;
         param1["scrollbar_slider_track_vertical"] = const_1119;
         param1["scrollable_itemlist"] = const_1591;
         param1["scrollable_itemlist_vertical"] = const_569;
         param1["scrollable_itemlist_horizontal"] = const_1145;
         param1["selector"] = const_759;
         param1["selector_list"] = const_744;
         param1["submenu"] = const_1148;
         param1["tab_button"] = const_754;
         param1["tab_container_button"] = const_1110;
         param1["tab_context"] = const_379;
         param1["tab_content"] = const_1167;
         param1["tab_selector"] = const_684;
         param1["text"] = const_531;
         param1["input"] = const_943;
         param1["toolbar"] = const_1652;
         param1["tooltip"] = const_433;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
