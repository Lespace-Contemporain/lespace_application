pragma Ada_2022;

with GTK.Widget;     use GTK.Widget;
with Ada.Real_Time;  use Ada.Real_Time;

package body reseaux is


procedure close_window_callback (Window : access Gtk_Widget_Record'Class) is
   pragma Unreferenced (Window);
begin
   --Integer'Output(Sock.Channel, 52);   -- This number indicate to server that communication was cancelled
   fermeture_reseau (Sock);
   Gtk.Widget.Destroy (Window);
end close_window_callback;

-----------------------
--  creation_reseau  --
-----------------------

   procedure creation_reseau (net : in out network_t) is
   begin

      Create_Socket (net.Socket);
      Set_Socket_Option(
         net.Socket,
         Socket_Level,
         (Reuse_Address, True));
   
   
   end creation_reseau;

------------------------
--  ouverture_reseau  --
------------------------

  procedure ouverture_reseau (net : out network_t) is
  begin


   net.Address.Addr := Addresses (Get_Host_By_Name (Host_Name),1);
   net.Address.Port := 5877;

   Connect_Socket (net.Socket, net.Address);
   net.Channel := Stream (net.Socket);

  end ouverture_reseau;

------------------------
--  fermeture_reseau  --
------------------------

  procedure fermeture_reseau (net : network_t) is
  begin
   Close_Socket (net.Socket);
  end fermeture_reseau;

-----------------------------
-- envoyer_donnees_reseau  --
-----------------------------

   procedure envoyer_donnees_reseau (net : network_t; data : access System.Address) is
   begin
      System.Address'Output (net.Channel, data.all);
   end envoyer_donnees_reseau;

-----------------------------
-- recevoir_donnees_reseau --
-----------------------------

   procedure recevoir_donnees_reseau (net : network_t; data : out Gtk_Window) is
   begin
      data := Gtk_Window'Input (net.Channel);
   end recevoir_donnees_reseau;


--------------------------------
--   callback_bouton_suivant  --
--------------------------------

   procedure callback_bouton_suivant
    (Widget : access Gtk_Widget_Record'Class; Window : Window_network_t) is
      pragma Unreferenced (Widget);

      Data : String_access;
      Entier : Integer;
   begin

      Data := new String'(Gtk.GEntry.Get_Text (Window.entree));   -- reception de la reponse de l'utilisateur.
      --loop
      if data.all'length > 0 then
         Entier := Integer'Value (Data.all);
         Integer'Output (Sock.Channel, Entier);
         --free (data);
         -- ici, on peut envoyer les donnees au serveur pour continuer la communication
         Data := new String'(String'Input (Sock.Channel));
         if data.all'length > 0 then
            Window.Label.Set_Text (Data.all);
         else
            Window.win.destroy;
         end if;
         --Data := new String'(String'Input (Sock.Channel));
         --Window.Label.Set_Text (Data.all);
        -- free(data);
         delay 0.2;
      else
         Window.Label.Set_Text ("Please enter a valid number.");
      end if;
      --end loop;
      --free(data);

   end callback_bouton_suivant;

-------------------------------
-- space_fenetre_reseau_one  --
-------------------------------

   procedure space_fenetre_reseau_one
    (net : network_t; Window : Window_network_t; Message_from_server : String) is
   begin

      Gtk_New (Window.Win);
      Set_Position (Window.Win, Win_Pos_Center);
      Window.Win.Set_Title ("Lespace");

      Connect (Window.Win, Gtk.Widget.Signal_Destroy, close_window_callback'Access);

      Gtk_New (Window.Button, "----->");
      Connect (Window.Button, Signal_Clicked, callback_bouton_suivant'Access, Window);

      Gtk_New (Window.Label, message_from_server);

      Gtk_New (Window.entree);

      Gtk_New (Window.Box, Orientation_Vertical, 0);
      Set_Halign (Window.Box, Align_Center);
      Set_Valign (Window.Box, Align_Center);

      Pack_Start (Window.Box, Window.Label, Expand => True, Fill => False, Padding => 0);
      Pack_Start (Window.Box, Window.entree, Expand => True, Fill => False, Padding => 0);
      Pack_Start (Window.Box, Window.Button, Expand => True, Fill => False, Padding => 0);

      Add (Window.Win, Window.Box);

      Window.Win.Show_All;

   end space_fenetre_reseau_one;

end reseaux;