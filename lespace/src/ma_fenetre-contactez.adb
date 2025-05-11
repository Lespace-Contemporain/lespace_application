--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 07 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with Gtk.Dialog;   use Gtk.Dialog;

package body ma_fenetre.contactez is 

    procedure initialise (Object : service_client) is
    begin

       Gtk.Message_Dialog.Gtk_New (Object.Info,null,0,message_info,buttons_close,
       Message => "Contactez le service client Lespace a l'adresse mail : Lespace@contemporain.com");
       
       if Object.Info.Run = Gtk_Response_Close then
           Object.Info.Destroy;
        end if;

    end initialise;

end ma_fenetre.contactez;