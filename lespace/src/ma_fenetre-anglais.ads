--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 06 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.

package ma_fenetre.anglais is

   type fenetre_lespace_anglais is new fenetre_lespace_record with private;
   type fenetre_anglaise is access all fenetre_lespace_anglais'class;

   procedure create_window (Object : fenetre_anglaise);
   procedure open_window (Object : fenetre_anglaise);

private

   type fenetre_lespace_anglais is new fenetre_lespace_record with null record;

   procedure create_button_my_box (box : fenetre_anglaise);
   function button_my_box (box : fenetre_anglaise) return Gtk_Button;

   procedure create_button_contact_us (contact : fenetre_anglaise);
   function button_contact_us (contact : fenetre_anglaise) return Gtk_Button;

   procedure create_button_francais (french : fenetre_anglaise);
   function button_francais (french : fenetre_anglaise) return Gtk_Button;

   procedure create_button_connect_you (connect : fenetre_anglaise);
   function button_connect_you (connect : fenetre_anglaise) return Gtk_Button;

   procedure create_button_order_box (box : fenetre_anglaise);
   function button_order_box (box : fenetre_anglaise) return Gtk_Button;

   procedure create_button_subscription (sub : fenetre_anglaise);
   function button_subscription (sub : fenetre_anglaise) return Gtk_Button;

end ma_fenetre.anglais;