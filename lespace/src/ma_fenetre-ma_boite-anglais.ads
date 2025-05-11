--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 07 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.

package ma_fenetre.ma_boite.anglais is

   type fenetre_boite_anglais_record is new fenetre_ma_boite_record with private;
   type fenetre_boite_anglais is access all fenetre_boite_anglais_record'class;

   procedure creer_fenetre (F : fenetre_boite_anglais);

   private

   package Pu is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, fenetre_boite_anglais);

    use Pu;

   type fenetre_boite_anglais_record is new fenetre_ma_boite_record with null record;

end ma_fenetre.ma_boite.anglais;