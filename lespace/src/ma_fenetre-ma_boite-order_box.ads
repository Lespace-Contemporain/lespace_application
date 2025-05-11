--                     Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 07 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with Gtk.Scrolled_Window;   use Gtk.Scrolled_Window;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with utilisateurs;          use utilisateurs;
with Gtk.Combo_Box_Text;    use Gtk.Combo_Box_Text;
with Gtk.Grid;              use Gtk.Grid;

package ma_fenetre.ma_boite.order_box is


   type order_my_box_record is new fenetre_ma_boite_record with private;
   type order_my_box is access all order_my_box_record'class;

   procedure creer_fenetre (F : order_my_box);

   procedure ouvrir_fenetre (F : order_my_box);

   private

   Package P4_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Combo_Box_Text_Record, order_my_box);
    use P4_Callback;

   package P5_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, order_my_box);
    use P5_Callback;

   type order_my_box_record is new fenetre_ma_boite_record with record

     Entree3, Entree4 : Gtk_Entry;
     Srolled_Bar : Gtk_Scrolled_Window;
     Box : Gtk_Grid;
     Combo_box : Gtk_Combo_Box_Text;
     User : user_lespace;
     Valign : Alignements (1..16);


     end record;

     procedure champ_saisir_nom (F : order_my_box);
     function champ_saisir_nom (F : order_my_box) return Gtk_Entry;
     function nom_champ_nom (F : order_my_box) return Gtk_Label;

     procedure champ_saisir_numero (F : order_my_box);
     function champ_saisir_numero (F : order_my_box) return Gtk_Entry;
     function nom_champ_numero (F : order_my_box) return Gtk_Label;

     procedure champ_saisir_pays  (F : order_my_box);
     function champ_saisir_pays (F : order_my_box) return Gtk_Combo_Box_Text;
     function nom_champ_pays (F : order_my_box) return Gtk_Label;
     
     procedure callback_champ_pays
      (widget : access Gtk_Combo_Box_Text_Record'Class;
       F : order_my_box);

     procedure champ_saisir_ville (F : order_my_box);
     function champ_saisir_ville (F : order_my_box) return Gtk_Entry;
     function nom_champ_ville (F : order_my_box) return Gtk_Label;

     procedure champ_saisir_quartier (F : order_my_box);
     function champ_saisir_quartier (F : order_my_box) return Gtk_Entry;
     function nom_champ_quartier (F : order_my_box) return Gtk_Label;

     procedure champ_saisir_adresse (F : order_my_box);
     function champ_saisir_adresse (F : order_my_box) return Gtk_Entry;
     function nom_champ_adresse (F : order_my_box) return Gtk_Label;

     procedure bouton_suivant (F : order_my_box);
     function bouton_suivant (F : order_my_box) return Gtk_Button;

     procedure callback_suivant
      (widget : access Gtk_Widget_Record'Class;
      F : order_my_box);


     procedure bouton_retour (F : order_my_box);
     function bouton_retour (F : order_my_box) return Gtk_Button;

     procedure callback_retour
      (widget : access Gtk_Widget_Record'Class;
      window : Gtk_Window);

      P : Unbounded_String;

    end ma_fenetre.ma_boite.order_box;