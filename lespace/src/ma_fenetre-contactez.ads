--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 30 septembre 09 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with Gtk.Message_Dialog;   use Gtk.Message_Dialog;

package ma_fenetre.contactez is

    type service_client_record is new fenetre_lespace_record with private;
    type service_client is access all service_client_record'class;

    procedure initialise (Object : service_client);

    private

    type service_client_record is new fenetre_lespace_record with record

     Info : Gtk_Message_Dialog;

     end record;
    
end ma_fenetre.contactez;