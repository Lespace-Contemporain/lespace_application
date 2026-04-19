-------------------------------------------------------------------------
--                 LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT           --
--                                                                     --                           
-- Written by : Zokoualoumba Moussounda Emmanuel Dimitri               -- 
-------------------------------------------------------------------------

pragma Ada_2022;

package body main is

   procedure callback_button_anglais (widget : access Gtk_Widget_Record'Class) is
   pragma Unreferenced (widget);
   begin
      F2 := new fenetre_lespace_anglais;

      create_window (F2);
      open_window (F2);
      --Win.Destroy;
   end callback_button_anglais;

   procedure callback_button_francais (widget : access Gtk_Widget_Record'Class) is
   pragma Unreferenced (widget);
   begin
      F := new fenetre_lespace_record;

      creer_fenetre (F);
      ouvrir_fenetre (F);
      --Win.Destroy;
   end callback_button_francais;

   procedure space_software_start is
   begin
--   Y := Set_Default_Icon_From_File("logo simple.png");
      F := new fenetre_lespace_record;
      F2 := new fenetre_lespace_anglais;

      Gtk.Main.Init;


      Gtk.Dialog.Gtk_New (Win, "What is your language ???", Flags => Gtk.Dialog.Modal);
      Widget := Add_Button (Win, "Français", Gtk_Response_OK);
      Widget := Add_Button (Win, "English", Gtk_Response_Cancel);
      P_Callbacks.Connect (Win, Signal_Destroy, fermer_fenetre'Access);
      Win.Show_All;
       
      if Win.Run = Gtk_Response_ok then
         creer_fenetre (F);
         ouvrir_fenetre (F);
         Win.Destroy;
      elsif Win.Run = Gtk_Response_Cancel then
         create_window (F2);
         open_window (F2);
         Win.Destroy;
      end if;

      --Gtk_New (Win);
      --Win.Set_Title ("Lespace");
      --P_Callbacks.Connect (Win, Signal_Destroy, fermer_fenetre'Access);

      --Gtk_New_Vbox (Box);
      --Win.Add (Box);
      --Gtk_New (Button, "Français");
      --Box.Pack_Start (Button, True, True, 0);
      --P_Callbacks.Connect (Button, Signal_Clicked, callback_button_francais'Access);
      --Gtk_New (Button2, "English");
      --Box.Pack_Start (Button2, True, True, 0);
      --P_Callbacks.Connect (Button2, Signal_Clicked, callback_button_anglais'Access);

      Gtk.Main.Main;
   end space_software_start;
end main;
