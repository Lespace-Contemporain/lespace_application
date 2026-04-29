-------------------------------------------------------------------------
--                 LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT           --
--                                                                     --                           
-- Written by : Zokoualoumba Moussounda Emmanuel Dimitri               -- 
-------------------------------------------------------------------------

pragma Ada_2022;

with Gtk.Main;             use Gtk.Main;
with Gtk.Button;           use Gtk.Button;
with Gtk.Window;           use Gtk.Window;
with Gtk.Widget;           use Gtk.Widget;
with reseaux;              use reseaux;
with ma_fenetre;           use ma_fenetre;
with ma_fenetre.anglais;   use ma_fenetre.anglais;
with Gtk.Dialog;           use Gtk.Dialog;


with Gtk.Handlers;

package main is

   procedure space_software_start;

private

   package P_Callbacks is new Gtk.Handlers.Callback (Gtk_Widget_Record);
   use P_Callbacks;

   F : fenetre_lespace;
   F2 : fenetre_anglaise;
   Win : Gtk_Dialog;
   --Box : Gtk_VBox;
   Button, Button2 : Gtk_Button;
   Y : boolean;
   Widget : Gtk_Widget;

end main;