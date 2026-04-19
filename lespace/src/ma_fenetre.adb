--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 30 septembre 09 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with Gtk.Enums;             use Gtk.Enums;
with Gtk;                   use Gtk;
with Gtk.Main;              use Gtk.Main;
with ma_fenetre;            use ma_fenetre;
with Glib.Error;            use Glib.Error;
with aws.response;          use aws.response;
with ma_fenetre.anglais;    use ma_fenetre.anglais;
with Ada.Directories;       use Ada.Directories;
with Ada.Text_IO;           use Ada.Text_IO;
with ma_fenetre.ma_boite;   use ma_fenetre.ma_boite;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Gtk.Style_Provider;    use Gtk.Style_Provider;
with ma_fenetre.contactez;  use ma_fenetre.contactez;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with ma_fenetre.ma_boite.order_box;
with System;                 use System;

package body ma_fenetre is

------------------------
--  Creer_Container  --
------------------------

   procedure creer_container (F : in out fenetre_lespace) is
   begin

      Gtk_New (F.Table, 0, 0, True);
      
      --  ajoute le bouton_lien_contactez_nous au container
      
      Gtk_New (F.Align (2), 0.5, 0.1, 0.0, 0.0);
      F.Align (2).Add (bouton_lien_contactez_nous (F));
      F.Table.Add (F.Align (2));

      --  ajoute le bouton_commander_une_boite au container
      
      Gtk_New (F.Align (3), 0.5, 0.6, 0.0, 0.0);
      F.Align (3).Add (bouton_commander_une_boite (F));
      F.Table.Add (F.Align (3));

      --  ajoute le bouton_nouvel_abonnement au container
      
      Gtk_New (F.Align (4), 0.5, 0.5, 0.0, 0.0);
      F.Align (4).Add (bouton_nouvel_abonnement (F));
      F.Table.Add (F.Align (4));

      -- ajoute le logo_lespace au container
      
      --Gtk_New (F.Align (5), 0.0, 0.0, 0.0, 0.0);
     -- F.Align (5).Add (logo_lespace (F));
      --F.Table.Add (F.Align (5));

   end creer_container;

---------------------------------
--  bouton_commander_une_boite --
---------------------------------

   procedure bouton_commander_une_boite (F : fenetre_lespace) is
   begin

   --   Ajouter_une_image (F, "panier.png", 30, 30);
   --   Gtk_New (F.logo, image_ajouter (F));

      Gtk_New (F.Button, Nom_bouton_commander_boite);
   
      Connect (F.Button, Signal_Clicked, callback_commander_boite'Access, F);

      Set_Image (F.Button, F.logo);
      Set_Relief (F.Button, Relief_None);
      Set_Always_Show_Image (F.Button, True);

   end bouton_commander_une_boite;

   -- function

   function bouton_commander_une_boite
    (F : fenetre_lespace) return Gtk_Button is
   begin

      bouton_commander_une_boite (F);
      return F.Button;
   end bouton_commander_une_boite;

--------------------------------
--  bouton_nouvel_abonnement  --
--------------------------------

   procedure bouton_nouvel_abonnement (F : fenetre_lespace) is
   begin

   --   Ajouter_une_image (F, "subscription.png", 30, 30);
      
   --   Gtk_New (F.logo, image_ajouter (F));

      Gtk_New (F.Button, Nom_bouton_nouvel_abonnement);

      Connect (F.Button, Signal_Clicked, callback_nouvel_abonnement'Access, F);

      Set_Image (F.Button, F.logo);
      Set_Relief (F.Button, Relief_None);
      Set_Always_Show_Image (F.Button, True);

   end bouton_nouvel_abonnement;

--  function

   function bouton_nouvel_abonnement (F : fenetre_lespace) return Gtk_Button is
   begin

      bouton_nouvel_abonnement (F);
      return F.Button;

   end bouton_nouvel_abonnement;

---------------------------------
--  bouton_lien_contactez_nous --
---------------------------------

   procedure bouton_lien_contactez_nous (F : fenetre_lespace) is
   begin

   --   Ajouter_une_image (F, "enveloppe.png", 50, 50);

   --   Gtk_New (F.logo, image_ajouter (F));

      Gtk_New (F.Button,
               Nom_bouton_lien_contactez_nous);

      Set_Image (F.Button, F.logo);
      Set_Relief (F.Button, Relief_None);
      Set_Image_Position (F.Button, Pos_Top);
      Set_Always_Show_Image (F.Button, True);

      Connect (F.Button, Signal_Clicked, callback_lien_contactez_Nous'Access);

   end bouton_lien_contactez_nous;

-- function

   function bouton_lien_contactez_nous
    (F : fenetre_lespace) return Gtk_Button is
   begin

      bouton_lien_contactez_nous (F);
      return F.Button;

   end bouton_lien_contactez_nous;

---------------------
--  creer_fenetre  --
---------------------

   procedure creer_fenetre (Object : in out fenetre_lespace) is 
   begin

      Gtk_New (Object.Win);
      modifier_langue (langues, Francais);
      Object.Win.Set_Title ("Lespace");
      Object.Win.Fullscreen;
      
      --ajouter_une_image (Object, "logo simple.jpg", 1, 1);
      --Set_Icon (Object.Win, image_ajouter (Object));
      creer_container (Object);
      --style_fenetre (Object);

      Connect (Object.Win, Gtk.Widget.Signal_Destroy, fermer_fenetre'Access);

      Object.Win.Add (container (Object));

      --Add_Provider_For_screen (Get_Default,
      -- +Object.Provider, Gtk.Style_Provider.Priority_Application);

   end creer_fenetre;

---------------------
--  image_ajouter  --
---------------------

   function image_ajouter
    (F : not null access fenetre_lespace_record'Class) return Gdk_Pixbuf is
    begin
    return F.Image2;
    end image_ajouter;

--------------------
--  logo_lespace  --
--------------------

   procedure logo_lespace (F : access fenetre_lespace_record'Class) is
   begin

      --Ajouter_une_image (F, "logo lespace.png", 190, 100);
      
      --Gtk_New (F.logo, image_ajouter (F));

      style_fenetre (F);
      --Add_Provider (Get_Style_Context (F.logo),
      -- +F.Provider, Gtk.Style_Provider.Priority_Application);
   end logo_lespace;

-------------------------
--  ajouter_une_image  --
-------------------------

   procedure ajouter_une_image (F : not null access fenetre_lespace_record'Class;
                                Img_Name : String;
                                Img_Width : Gint;
                                Img_Height : Gint) is

      Erreur : Glib.Error.GError;
   
   begin
  
  Gdk_New_From_File (F.Image, Img_Name, Erreur);
  F.Image2 := Scale_Simple (F.Image, Img_Width, Img_Height);

   end ajouter_une_image;

-----------------------------
--  function logo_lespace  --
-----------------------------

   function logo_lespace (F : access fenetre_lespace_record'Class) return Gtk_Image is
   begin

      logo_lespace (F);
      return F.logo;

   end logo_lespace;

----------------------
--  ouvrir_fenetre  --
----------------------

   procedure ouvrir_fenetre (F : fenetre_lespace) is
   begin

      F.Win.Show_All;

   end ouvrir_fenetre;

----------------------
--  fermer_fenetre  --
----------------------

   procedure fermer_fenetre (F : access Gtk_Widget_Record'class) is
   pragma Unreferenced (F);
   begin

      Main_Quit;

   end fermer_fenetre;

---------------------------
--  fenetre_est_ouverte  --
---------------------------

   function fenetre_est_ouverte (F : fenetre_lespace) return Boolean is
   begin

      if F.Win.Is_Active then

         return True;

      else
         return False;

      end if;
   end fenetre_est_ouverte;

----------------
-- Container  --
----------------
   function container
    (F : not null access fenetre_lespace_record'Class) return Gtk_Table is
   begin
   return F.Table;
   end container;

----------------------------
--  ajouter_a_la_fenetre  --
----------------------------

   procedure Ajouter_a_la_fenetre (F : fenetre_lespace;
    Item : not null access Gtk_Widget_Record'Class) is
   begin

      F.Table.Add (Item);

   end Ajouter_a_la_fenetre;

----------------------
--  langue_fenetre  --
----------------------

   function language_fenetre
    (F : access fenetre_lespace_record'class) return langue_parlee is
   begin
      return langue (langues);
   end language_fenetre;

---------------------
--  style_fenetre  --
---------------------

   procedure style_fenetre
    (F : not null access fenetre_lespace_record'class) is

      Erreur : aliased GError;
      Bool : aliased Boolean;
   begin

      Gtk_New (F.Provider);
      Gtk_New (F.Button);
      Bool := Load_From_Path (F.Provider, "style.css", Erreur'Access);
   end style_fenetre;

--------------------------------
--  callback_commander_boite  --
--------------------------------

   procedure callback_commander_boite
   (widget : access Gtk_Widget_Record'Class;
   F : fenetre_lespace) is

      Fe : ma_fenetre.ma_boite.order_box.order_my_box;
   begin

      Fe := new ma_fenetre.ma_boite.order_box.order_my_box_record;

      ma_fenetre.ma_boite.order_box.creer_fenetre (Fe);
      ma_fenetre.ma_boite.order_box.ouvrir_fenetre (Fe);
      
   end callback_commander_boite;

----------------------------------
--  callback_nouvel_abonnement  --
----------------------------------

   procedure callback_nouvel_abonnement
   (widget : access Gtk_Widget_Record'Class;
   F : fenetre_lespace) is

      Message : constant String := "Je veux m'abonner";

      Message_recu : access string;

      F_network : dialogue_boite;
      var : Gint := 0;

   begin

      creation_reseau (Sock);
      ouverture_reseau (Sock);
      
      -- envoi de la demande au serveur

     String'Output (Sock.Channel, Message);
     delay 0.2;

      -- reception de la reponse du serveur.

      Message_recu := new String'(String'Input (Sock.Channel));

      --Put_Line (Message_recu.all);

      if message_recu.all /= " " then
         F.Win_abonnement := new window_network_record;
         reseaux.space_fenetre_reseau_one (sock, F.Win_abonnement, message_recu.all);
     else
         Gtk.Message_Dialog.Gtk_New (F_network.Msg,F.Win,0,message_error,buttons_ok,
          Message => "Une erreur est survenue lors de votre demande d'abonnement. Veuillez reessayer plus tard.");
         F_network.Msg.Show_All;
      end if;
       
      --if F_network.Msg.Run = Gtk_Response_ok then
      --   F_network.Msg.Destroy;
      --else
      --   F_network.Msg.Destroy;
      ---end if;

      --Win := new Gtk_Window_Record;
      --F.Win.Destroy;

 --     Gtk.Main.Main;

   end callback_nouvel_abonnement;

------------------------------------
--  callback_lien_contactez_nous  --
------------------------------------

   procedure callback_lien_contactez_Nous
    (widget : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (widget);

      F : service_client;
   begin

      F := new service_client_record;
      initialise (F);
   end callback_lien_contactez_Nous;

-----------------------------
--  callabck_lien_english  --
-----------------------------

   procedure callback_lien_english
    (widget : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (widget);

      F : fenetre_anglaise;
   begin

      F := new fenetre_lespace_anglais;
      create_Window (F);
      open_window (F);

   end callback_lien_english;

end ma_fenetre;