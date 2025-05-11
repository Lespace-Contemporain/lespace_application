with Gtk.Dialog;  use Gtk.Dialog;

package body ma_fenetre.commande_effectue is 

     procedure initialise (Object : commande_effectuer) is  
     begin

         Gtk_New (Object.info, null, 0, message_info,
         buttons_close, message);

             if Object.Info.Run = Gtk_Response_Close then

                 Object.Info.Destroy;
            
             end if;

             Object.Info.Show;
        
     end initialise;

end ma_fenetre.commande_effectue;
        
