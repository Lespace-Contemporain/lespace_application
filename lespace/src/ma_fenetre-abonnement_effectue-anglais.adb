with Gtk.Dialog;  use Gtk.Dialog;

package body ma_fenetre.abonnement_effectue.anglais is 

  procedure initialize1 (Object : mon_abonnement_anglais) is  
      begin

         Gtk_New (Object.info, null, 0, message_info,
         buttons_close, message_anglais);
         Object.Info.Show;
             if Object.Info.Run = Gtk_Response_Close then

                 Object.Info.Destroy;
            
             end if;

        
      end initialize1;

      procedure initialize2 (Object : mon_abonnement_anglais) is  
     begin

         Gtk_New (Object.info, null, 0, message_info,
         buttons_close, message_anglais2);
         Object.Info.Show;
             if Object.Info.Run = Gtk_Response_Close then

                 Object.Info.Destroy;
            
             end if;

        
     end initialize2;
end ma_fenetre.abonnement_effectue.anglais;