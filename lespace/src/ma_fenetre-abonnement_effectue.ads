with Gtk.Message_Dialog;  use Gtk.Message_Dialog;

package ma_fenetre.abonnement_effectue is

   type mon_abonnements_record is new fenetre_lespace_record with private;
   type mon_abonnements is access all mon_abonnements_record'Class;

   procedure Initialise1 (Object : mon_abonnements);

   procedure Initialise2 (Object : mon_abonnements);


   private

   type mon_abonnements_record is new fenetre_lespace_record with record
    
     Info : Gtk_Message_Dialog;
   end record;

   Message : constant String :=
    "Votre abonnement s'est effectue avec succes sur votre boite";

   Message2 : constant String := 
   "Votre abonnement s'est effectue avec succes vers votre detinataire";

end ma_fenetre.abonnement_effectue;