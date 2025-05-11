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

package body ma_fenetre.anglais is

   procedure callback_commander_boite
    (widget : access Gtk_Widget_Record'Class) is

      type Pointeur is access langue_parlee;
      S : constant String := "je commander une boite";
      P : Pointeur;
      F : fenetre_lespace_anglais;
   begin

      P := new langue_parlee'(langue (langues));
      
      Put_Line (S);
      Put_Line
       ("language utilisee " & langue_parlee'Image (P.all));
      --  envoie du string vers le reseau.
      null;
   end callback_commander_boite;

   procedure callback_nouvel_abonnement
    (widget : access Gtk_Widget_Record'Class) is

      S : constant String := "je veux m'abonner";
      F : fenetre_lespace_anglais;
   begin
      
      Put_line (S);
      Put_line 
      ("language utilisee " & langue_parlee'Image (langue (langues)));
      --  envoie des donneea vers le reseau.
      null;
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

   procedure callback_bouton_connexion
    (widget : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (widget);

      Id : Integer;
      Mdp : Unbounded_String;
   begin
      Put_Line ("Enter the id number");
      Ada.Integer_Text_IO.Get (Id);
      Skip_Line;

      Put_Line ("Enter the password");
      Mdp := To_Unbounded_String (Get_Line);
      Skip_Line;
      --
      --  verification des donnees et accession au reseau
      null;
   end callback_bouton_connexion;

   procedure create_button_my_box (box : fenetre_anglaise) is
   begin

      ajouter_une_image (box, "boite.png", 50, 50);
      Gtk_New (box.logo, image_ajouter (box));

      Gtk_New (box.Button, "My box");
      Set_Image (box.Button, box.logo);
      Set_Relief (box.Button, Relief_None);
      Set_Image_Position (box.Button, Pos_Top);
      Set_Always_Show_Image (box.Button, True);

      Connect (box.Button, Signal_Clicked, callback_my_box'Access);

   end create_button_my_box;

   function button_my_box (box : fenetre_anglaise) return Gtk_Button is
   begin

   create_button_my_box (box);

   return box.Button;
   end button_my_box;
   
   procedure create_button_connect_you (connect : fenetre_anglaise) is
   begin

      Gtk_New (connect.Button, " Connect you");
      Set_Size_Request (connect.Button, 300, 300);
      P_Callback.Connect (connect.Button,
                          Signal_Clicked,
                          callback_bouton_connexion'Access);
   
   end create_button_connect_you;

   function button_connect_you (connect : fenetre_anglaise) return Gtk_Button is
   begin

    create_button_connect_you (connect);

    return connect.Button;
   end button_connect_you;

   procedure create_button_order_box (box : fenetre_anglaise) is
   begin

      Gtk_New (box.Button, "Order your box");
      Connect (box.Button, Signal_Clicked, callback_commander_boite'Access);

      ajouter_une_image (box, "panier.png", 30, 30);
      Gtk_New (box.logo, image_ajouter (box));

      Set_Image (box.Button, box.logo);
      Set_Relief (box.Button, Relief_None);
      Set_Always_Show_Image (box.Button, True);

   end create_button_order_box;

   function button_order_box (box : fenetre_anglaise) return Gtk_Button is
   begin

   create_button_order_box (box);

    return box.Button;
   end button_order_box;

   procedure create_button_francais (french : fenetre_anglaise) is
   begin

      Gtk_New (french.Button, "Francais");

      ajouter_une_image (french, "globe.png", 50, 50);
      Gtk_New (french.logo, image_ajouter (french));

      Set_Image (french.Button, french.logo);
      Set_Relief (french.Button, Relief_None);
      Set_Image_Position (french.Button, Pos_Top);
      Set_Always_Show_Image (french.Button, True);

      Connect (french.Button, Signal_Clicked, callback_lien_francais'Access);

   end create_button_francais;

   function button_francais (french : fenetre_anglaise) return Gtk_Button is
   begin

    create_button_francais (french);

    return french.Button;
   end button_francais;

   procedure create_button_contact_us (contact : fenetre_anglaise) is
   begin

      Gtk_New (contact.Button, "Contact us");

      ajouter_une_image (contact, "enveloppe.png", 50, 50);
      Gtk_New (contact.logo, image_ajouter (contact));

      Set_Image (contact.Button, contact.logo);
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
      
      ajouter_une_image (sub, "subscription.png", 30, 30);
      Gtk_New (sub.logo, image_ajouter (sub));

      Set_Image (sub.Button, sub.logo);
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

      Gtk_New (Object.Align (1), 0.4, 0.1, 0.0, 0.0);
      Object.Align (1).Add (button_my_box (Object));
      Object.Table.Add (Object.Align (1));

      --  francais

      Gtk_New (Object.Align (2), 0.5, 0.1, 0.0, 0.0);
      Object.Align (2).Add (button_francais (Object));
      Object.Table.Add (Object.Align (2));

      --  contact us

      Gtk_New (Object.Align (3), 0.6, 0.1, 0.0, 0.0);
      Object.Align (3).Add (button_contact_us (Object));
      Object.Table.Add (Object.Align (3));

      --  Connect you

      Gtk_New (Object.Align (4), 0.5, 0.5, 0.0, 0.0);
      Object.Align (4).Add (button_connect_you (Object));
      Object.Table.Add (Object.Align (4));

      --  Order your box

      Gtk_New (Object.Align (5), 0.5, 1.0, 0.0, 0.0);
      Object.Align (5).Add (button_order_box (Object));
      Object.Table.Add (Object.Align (5));

      --    New Subscriber

      Gtk_New (Object.Align (6), 0.5, 0.9, 0.0, 0.0);
      Object.Align (6).Add (button_subscription (Object));
      Object.Table.Add (Object.Align (6));

      --   logo

      Gtk_New (Object.Align (7), 0.0, 0.0, 0.0, 0.0);
      Object.Align (7).Add (logo_lespace (Object));
      Object.Table.Add (Object.Align (7));
      
      Object.Win.Add (Object.Table);

   end create_window;

   procedure open_window (Object : fenetre_anglaise) is
   begin

   Object.Win.Show_All;

   end open_window;
end ma_fenetre.anglais;