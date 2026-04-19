--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 06 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with ma_fenetre.ma_boite.anglais;    use ma_fenetre.ma_boite.anglais;
with Ada.Integer_Text_IO;            use Ada.Integer_Text_IO;
with ma_fenetre.contactez.anglais;   use ma_fenetre.contactez.anglais;
with Ada.Strings.Unbounded;          use Ada.Strings.Unbounded;
with Ada.Text_IO;                    use Ada.Text_IO;
with Gdk.Pixbuf;                     use Gdk.Pixbuf;
with Glib.Error;                     use Glib.Error;
with Gtk.Enums;                      use Gtk.Enums;
with ma_fenetre.ma_boite.order_box.anglais;

package body ma_fenetre.anglais is

   procedure callback_commander_boite
    (widget : access Gtk_Widget_Record'Class) is

      F : ma_fenetre.ma_boite.order_box.anglais.order_my_box_english;
   begin
      
      F := new ma_fenetre.ma_boite.order_box.anglais.order_my_box_english_record;

      ma_fenetre.ma_boite.order_box.anglais.create_window (F);
      ma_fenetre.ma_boite.order_box.anglais.open_window (F);

   end callback_commander_boite;

   procedure callback_nouvel_abonnement
    (widget : access Gtk_Widget_Record'Class) is

      Message : constant String := "i want a subscription";
      Message_recu : access String;

      msg : Gtk_Message_Dialog;
      F : fenetre_anglaise;

   begin

      creation_reseau (Sock);
      ouverture_reseau (Sock);
      
      -- envoi de la demande au serveur

     String'Output (Sock.Channel, Message);
     delay 0.2;

      -- reception de la reponse du serveur.

      Message_recu := new String'(String'Input (Sock.Channel));

   --   Put_Line (Message_recu.all);

      if message_recu.all /= " " then
         F := new fenetre_lespace_anglais;
         F.Win_abonnement := new window_network_record;
         reseaux.space_fenetre_reseau_one (sock, F.Win_abonnement, message_recu.all);
     else
         Gtk.Message_Dialog.Gtk_New (Msg,null,0,message_error,buttons_ok,
          Message => "An error occurred during your subscription request. Please try again later.");
         msg.Show_All;
      end if;
       
      if Msg.Run = Gtk_Response_ok then
         Msg.Destroy;
      else
         Msg.Destroy;
      end if;


   end callback_nouvel_abonnement;

   procedure callback_lien_francais
    (F : access Gtk_Widget_Record'class) is
      pragma Unreferenced (F);

      Foo : fenetre_lespace;
   begin

      Foo := new fenetre_lespace_record;
      creer_fenetre (Foo);
      ouvrir_fenetre (Foo);

   end callback_lien_francais;

   procedure callback_contact_us
    (Widget : access Gtk_Widget_Record'class) is
      pragma Unreferenced (Widget);
      F : service_client_anglais;
   begin

      F := new service_client_anglais_record;
      Initialize (F);

   end callback_contact_us;

   procedure callback_my_box
    (Widget : access Gtk_Widget_Record'class) is
      pragma Unreferenced (Widget);

      F : fenetre_boite_anglais;
   begin

      F := new fenetre_boite_anglais_record;

      creer_fenetre (F);

   end callback_my_box;

   procedure create_button_order_box (box : fenetre_anglaise) is
   begin

      Gtk_New (box.Button, "Order your box");
      Connect (box.Button, Signal_Clicked, callback_commander_boite'Access);

      --ajouter_une_image (box, "panier.png", 30, 30);
      --Gtk_New (box.logo, image_ajouter (box));

      --Set_Image (box.Button, box.logo);
      Set_Relief (box.Button, Relief_None);
      Set_Always_Show_Image (box.Button, True);

   end create_button_order_box;

   function button_order_box (box : fenetre_anglaise) return Gtk_Button is
   begin

   create_button_order_box (box);

    return box.Button;
   end button_order_box;
   
   procedure create_button_contact_us (contact : fenetre_anglaise) is
   begin

      Gtk_New (contact.Button, "Contact us");

      --ajouter_une_image (contact, "enveloppe.png", 50, 50);
      --Gtk_New (contact.logo, image_ajouter (contact));

      --Set_Image (contact.Button, contact.logo);
      Set_Relief (contact.Button, Relief_None);
      Set_Image_Position (contact.Button, Pos_Top);
      Set_Always_Show_Image (contact.Button, True);

      Connect (contact.Button, Signal_Clicked, callback_contact_us'Access);

   end create_button_contact_us;

   function button_contact_us (contact : fenetre_anglaise) return Gtk_Button is
   begin

    create_button_contact_us (contact);

    return contact.Button;
   end button_contact_us;

   procedure create_button_subscription (sub : fenetre_anglaise) is
   begin

      Gtk_New (sub.Button, "New subscription");
      Connect (sub.Button,
               Signal_Clicked,
               callback_nouvel_abonnement'Access);
      
      --ajouter_une_image (sub, "subscription.png", 30, 30);
      --Gtk_New (sub.logo, image_ajouter (sub));

      --Set_Image (sub.Button, sub.logo);
      Set_Relief (sub.Button, Relief_None);
      Set_Always_Show_Image (sub.Button, True);

   end create_button_subscription;

   function button_subscription (sub : fenetre_anglaise) return Gtk_Button is
   begin

    create_button_subscription (sub);

    return sub.Button;
   end button_subscription;

   procedure create_window (Object : fenetre_anglaise) is
   begin
       
       --  main window

      Gtk_New (Object.Win);
      modifier_langue (langues, English);
      Object.Win.Fullscreen;
      Connect (Object.Win, Signal_Destroy, fermer_fenetre'Access);

      --  container

      Gtk_New (Object.Table, 0, 0, True);
      Gtk_New (Object.Table, 0, 0, True);

      --  contact us

      Gtk_New (Object.Align (2), 0.5, 0.1, 0.0, 0.0);
      Object.Align (2).Add (button_contact_us (Object));
      Object.Table.Add (Object.Align (2));

      --  Order your box

      Gtk_New (Object.Align (3), 0.5, 0.6, 0.0, 0.0);
      Object.Align (3).Add (button_order_box (Object));
      Object.Table.Add (Object.Align (3));

      --    New Subscriber

      Gtk_New (Object.Align (4), 0.5, 0.5, 0.0, 0.0);
      Object.Align (4).Add (button_subscription (Object));
      Object.Table.Add (Object.Align (4));

      --   logo

      Gtk_New (Object.Align (5), 0.0, 0.0, 0.0, 0.0);
     -- Object.Align (5).Add (logo_lespace (Object));
      Object.Table.Add (Object.Align (5));
      
      Object.Win.Add (Object.Table);

   end create_window;

   procedure open_window (Object : fenetre_anglaise) is
   begin

   Object.Win.Show_All;

   end open_window;
end ma_fenetre.anglais;