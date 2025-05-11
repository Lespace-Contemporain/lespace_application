with Gtk.Dialog;   use Gtk.Dialog;

package body ma_fenetre.commande_effectue.anglais is

  procedure Initialize (Object : commande_effectuer_anglais) is
  begin

   Gtk_New (Object.info, null, 0, message_info,
         buttons_close, Message_Anglais);
         Gtk_New (Object.info, null, 0, message_info,
         buttons_close, message);

             Object.Info.Show;

             if Object.Info.Run = Gtk_Response_Close then

                 Object.Info.Destroy;
            
             end if;

  end Initialize;
end ma_fenetre.commande_effectue.anglais;