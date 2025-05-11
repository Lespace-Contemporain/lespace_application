with Gtk.Dialog;  use Gtk.Dialog;

package body ma_fenetre.abonnement_effectue is 

      procedure initialise1 (Object : mon_abonnements) is  
      begin

         Gtk_New (Object.info, null, 0, message_info,
         buttons_close, message);
         Object.Info.Show;
             if Object.Info.Run = Gtk_Response_Close then

                 Object.Info.Destroy;
            
             end if;

        
      end initialise1;

      procedure initialise2 (Object : mon_abonnements) is  
     begin

         Gtk_New (Object.info, null, 0, message_info,
         buttons_close, message2);
         Object.Info.Show;
             if Object.Info.Run = Gtk_Response_Close then

                 Object.Info.Destroy;
            
             end if;

        
     end initialise2;
end ma_fenetre.abonnement_effectue;
