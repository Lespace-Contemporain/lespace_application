pragma Ada_2022;

with Gtk.GEntry;             use Gtk.GEntry;
with Gtk.Grid;               use Gtk.Grid;
with Gtk.Label;              use Gtk.Label;
with identifiant;            use identifiant;
with Gtk.Combo_Box_Text;     use Gtk.Combo_Box_Text;
with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
with Gtk.Radio_Button;       use Gtk.Radio_Button;

package ma_fenetre.abonnement is

   type mon_abonnement_record is new fenetre_lespace_record with private;
   type mon_abonnement is access all mon_abonnement_record'class;

   procedure creer_fenetre (F : mon_abonnement);
   
   procedure ouvrir_fenetre (F : mon_abonnement);

   private

   package P1_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Combo_Box_Text_Record, mon_abonnement);
   use P1_Callback;

   package P2_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, mon_abonnement);
   use P2_Callback;

   type mon_abonnement_record is new fenetre_lespace_record with record

     Monnaie : Gtk_Combo_Box_Text;
     offre1 : Gtk_Radio_Button;
     offre2 : Gtk_Radio_Button;
     offre3 : Gtk_Radio_Button;
     offre4 : Gtk_Radio_Button;
     Entree : Gtk_Entry;
     Grid : Gtk_Grid;
     select1 : Gtk_Radio_Button;
     select2 : Gtk_Radio_Button;
     Label_Titre : Gtk_Label;
     address : network_address;
     Label : Gtk_Label;
     
   end record;

   procedure mes_offres (F : mon_abonnement);

   procedure destinataire (F : mon_abonnement);

   procedure bouton_retour (F : mon_abonnement);
   function bouton_retour (F : mon_abonnement) return Gtk_Button;

   procedure bouton_suivant (F : mon_abonnement);
   function bouton_suivant (F : mon_abonnement) return Gtk_Button;

   procedure logo_lespace (F : mon_abonnement);
   function logo_lespace (F : mon_abonnement) return Gtk_Image;

   procedure style_fenetre_abonnement
    (F : not null access mon_abonnement_record'Class);

   procedure callback_bouton_retour
       (widget : access Gtk_Widget_Record'Class;
        window : Gtk_Window);
   
   procedure callback_bouton_suivant
       (widget : access Gtk_Widget_Record'Class);

   procedure callback_offre2
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement);

   procedure callback_offre3
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement);

   procedure callback_offre4
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement);

   procedure callback_select2
     (widget : access Gtk_Widget_Record'Class);

   procedure callback_monnaie
    (widget : access Gtk_Combo_Box_Text_Record'Class;
     F :mon_abonnement);

     S : Unbounded_String;
     box : Unbounded_String;
     id : numero_id;
    Prix : Unbounded_String;
    Choix_Monnaie : Unbounded_String;

end ma_fenetre.abonnement;