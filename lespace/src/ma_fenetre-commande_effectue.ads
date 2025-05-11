with Gtk.Message_Dialog;  use Gtk.Message_Dialog;

package ma_fenetre.commande_effectue is

    type commande_effectuer_record is new fenetre_lespace_record with private;
    type commande_effectuer is access all commande_effectuer_record'Class;

    procedure initialise (Object : commande_effectuer);

    private

    type commande_effectuer_record is new fenetre_lespace_record with record

    Info : Gtk_Message_Dialog;

    end record;

    Message : constant String := "Votre commande de la boite internet Lespace, s'est effectuer avec succes. " &
                                  "Gardez votre numero de telephone actif, nous vous contacterons dans" &
                                  "un delai maximum, deux semaines.";

    end ma_fenetre.commande_effectue;