--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 30 septembre 09 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.

with Gtk.Enums;                     use Gtk.Enums;
with Gdk.Pixbuf;                    use Gdk.Pixbuf;
with Ada.Streams;                   use Ada.Streams;
with reseaux;                       use reseaux;
with Gtk.Widget;                    use Gtk.Widget;
with Glib.Error;                    use Glib.Error;
with Glib;                          use Glib;
with Gtk.Alignment;                 use Gtk.Alignment;
with Ada.Text_IO;                   use Ada.Text_IO;

package body ma_fenetre.ma_boite is 

--------------------------
--  callback_connexion  --
--------------------------

   procedure callback_connexion
    (widget : access Gtk_Widget_Record'class;
    F : fenetre_ma_boite) is

   begin

   F.D.Id := new String'(Get_Text (F.Entree1));
   F.D.Passwd := new String'(Get_Text (F.Entree2));
   Put_line (F.D.Langue'Image);

   --  envoie des valeurs au reseau

   Put_Line (F.D.Id.all);
   Put_line (F.D.Passwd.all);
   end callback_connexion;

---------------------
--  creer_entree1  --
---------------------

   procedure creer_entree1 (F : fenetre_ma_boite) is
   begin

      Gtk_New (F.Entree1);
      Set_Visibility (F.Entree1, True);
      Set_Editable (F.Entree1, True);

   end creer_entree1;

--------------
--  entree1 --
--------------

   function entree1 (F : fenetre_ma_boite) return Gtk_Entry is
   begin

      creer_entree1 (F);
      return F.Entree1;

   end entree1;

---------------------
--  saisi_entree1  --
---------------------

   function saisi_entree1 (F : fenetre_ma_boite) return String is
   begin

      creer_entree1 (F);
      return To_String (Numero);

   end saisi_entree1;

---------------------
--  saisi-entree2  --
---------------------

   function saisi_entree2 (F : fenetre_ma_boite) return String is
   begin

      creer_entree2 (F);
      return F.D.Passwd.all;

   end saisi_entree2;

-----------------
--  numero_id  --
-----------------

   function Numero_Id (F : fenetre_ma_boite) return Gtk_Label is
   begin

      Gtk_New (F.Label, "Numero Id");
      return F.Label;

   end Numero_Id;

---------------------
--  creer_entree2  --
---------------------
   procedure creer_entree2 (F : fenetre_ma_boite) is
   begin

      Gtk_New (F.Entree2);
      Set_Visibility (F.Entree2, false);
      Set_Editable (F.Entree2, True);

   end creer_entree2;

------------------------------
--  callback_bouton_retour  --
------------------------------

   procedure callback_bouton_retour
    (Widget : access Gtk_Widget_Record'Class;
     Window : Gtk_Window) is
      pragma Unreferenced (Widget);

   begin

      Window.Destroy;

   end callback_bouton_retour;

--------------------------
--  callback_connexion  --
--------------------------

-- pour le bouton connexion

   procedure callback_connexion
    (widget : access Gtk_Widget_Record'class) is
      pragma Unreferenced (widget);
      
      F : fenetre_ma_boite;
      Offset : Stream_Element_Offset;
      net : network;
   begin
      F := new fenetre_ma_boite_record;

      creation_reseau (net);
      ouverture_reseau (net);

      Data'Write (reseau (net), F.D);
      -- ^ envoi des donnees au reseau
      
   end callback_connexion;

---------------
--  entree2  --
---------------

   function entree2 (F : fenetre_ma_boite) return Gtk_Entry is
   begin

      creer_entree2 (F);
      return F.Entree2;

   end entree2;

-----------
--  mdp  --
-----------

   function Mdp (F : fenetre_ma_boite) return Gtk_Label is
   begin

      Gtk_New (F.Label, "Mot de passe");
      return F.Label;

   end Mdp;

---------------------
--  creer_fenetre  --
---------------------

   procedure creer_fenetre (F : fenetre_ma_boite) is
   begin

    Gtk_New (F.Win);
    F.Win.Fullscreen;
    Gtk_New (F.Table, 0, 0, True);
    style_fenetre (F);
    ajouter_une_image (F, "logo simple.jpg", 100, 150);
    Gtk_New (F.logo, image_ajouter (F));
    Gtk_New (F.Label, "Ma boite");

    Gtk_New (F.Align (1), 0.5, 0.1, 0.0, 0.0);
    F.Align (1).Add (F.logo);
    F.Table.Add (F.Align (1));
    Gtk_New (F.Align (2), 0.5, 0.3, 0.0, 0.0);
    F.Align (2).Add (F.Label);
    F.Table.Add (F.Align (2));
    Gtk_New (F.Align (3), 0.5, 0.4, 0.0, 0.0);
    F.Align (3).Add (Numero_Id (F));
    F.Table.Add (F.Align (3));
    Gtk_New (F.Align (4), 0.5, 0.5, 0.0, 0.0);
    F.Align (4).Add (entree1 (F));
    F.Table.Add (F.Align (4));
    Gtk_New (F.Align (5), 0.5, 0.6, 0.0, 0.0);
    F.Align (5).Add (Mdp (F));
    F.Table.Add (F.Align (5));
    Gtk_New (F.Align (6), 0.5, 0.7, 0.0, 0.0);
    F.Align (6).Add (entree2 (F));
    F.Table.Add (F.Align (6));

    Gtk_New (F.Button, "Je me connecte");
    Connect (F.Button, Signal_Clicked, callback_connexion'Access, F);
    Gtk_New (F.Align (7), 0.5, 0.8, 0.0, 0.0);
    F.Align (7).Add (F.Button);
    F.Table.Add (F.Align (7));

    Gtk_New (F.Button, "Retour");
    Connect (F.Button, Signal_Clicked, callback_bouton_retour'access, F.Win);

    declare

    A : Gtk_Alignment;

   begin

    ajouter_une_image (F, "angle-gauche.png", 20, 20);
    Gtk_New (F.logo, image_ajouter (F));
    Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

    Gtk_New (A, 0.5, 0.9, 0.0, 0.0);
    A.Add (F.Button);
    F.Table.Add (A);

    F.Win.Add (F.Table);
    F.Win.Show_All;

   end;
   end creer_fenetre;
end ma_fenetre.ma_boite;