pragma Ada_2022;

package ma_fenetre.abonnement.anglais is

type mon_abonnement_anglais_record is new mon_abonnement_record with private;
type mon_abonnement_anglais is access all mon_abonnement_anglais_record'class;

procedure create_window (F : mon_abonnement_anglais);

procedure open_window (F : mon_abonnement_anglais);

private 

package P3_Callback is new Gtk.Handlers.User_Callback
 (Gtk_Combo_Box_Text_Record, mon_abonnement_anglais);
 use P3_Callback;

 package P4_Callback is new Gtk.Handlers.User_Callback
  (Gtk_Widget_Record, mon_abonnement_anglais);
use P4_Callback;

type mon_abonnement_anglais_record is new mon_abonnement_record with null record;

procedure create_next_button (F : mon_abonnement_anglais);
function next_button (F : mon_abonnement_anglais) return Gtk_Button;

procedure create_back_button (F : mon_abonnement_anglais);
function back_button (F : mon_abonnement_anglais) return Gtk_Button;

procedure lespace_logo (F : mon_abonnement_anglais);
function lespace_logo (F : mon_abonnement_anglais) return Gtk_Image;
 
   procedure callback_bouton_retour
       (widget : access Gtk_Widget_Record'Class;
        window : Gtk_Window);
   
   procedure callback_bouton_suivant
       (widget : access Gtk_Widget_Record'Class);

   procedure callback_offre2
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement_anglais);

   procedure callback_offre3
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement_anglais);

   procedure callback_offre4
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement_anglais);

   procedure callback_select2
     (widget : access Gtk_Widget_Record'Class);

   procedure callback_monnaie
    (widget : access Gtk_Combo_Box_Text_Record'Class;
     F :mon_abonnement_anglais);


end ma_fenetre.abonnement.anglais;