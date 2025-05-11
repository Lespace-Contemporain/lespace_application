--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 07 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with Gdk.Pixbuf;  use Gdk.Pixbuf;
with Gtk.Enums;   use Gtk.Enums;
with Glib.Error;  use Glib.Error;
with Ada.Text_IO; use Ada.Text_IO;

package body ma_fenetre.ma_boite.anglais is

procedure callback_connexion
    (widget : access Gtk_Widget_Record'class;
    F : fenetre_boite_anglais) is
   
   type Pointeur is access String;
   P1, P2 : Pointeur;

   begin

   P1 := new String'(Get_Text (F.Entree1));
   P2 := new String'(Get_Text (F.Entree2));
   Put_Line (langue_parlee'Image (langue (langues)));

   --  envoie des valeurs au reseau

   Put_Line (P1.all);
   Put_line (P2.all);
   end callback_connexion;

      procedure creer_entree1 (F : fenetre_boite_anglais) is
      begin

         Gtk_New (F.Entree1);

      end creer_entree1;

      function entree1 (F : fenetre_boite_anglais) return Gtk_Entry is
      begin

      creer_entree1 (F);
      return F.Entree1;

      end entree1;

      function Numero_Id (F : fenetre_boite_anglais) return Gtk_Label is
      begin

      Gtk_New (F.Label, "Id number");
      return F.Label;

      end Numero_Id;

      procedure creer_entree2 (F : fenetre_boite_anglais) is
      begin

      Gtk_New (F.Entree2);
      Set_Visibility (F.Entree2, False);

      end creer_entree2;

      procedure callback_bouton_retour (Widget : access Gtk_Widget_Record'Class;
                                        Window : Gtk_Window) is
      pragma Unreferenced (Widget);
      begin

      Window.Destroy;

      end callback_bouton_retour;
        

      function entree2 (F : fenetre_boite_anglais) return Gtk_Entry is
      begin

        creer_entree2 (F);
        return F.Entree2;

      end entree2;

      function Mdp (F : fenetre_boite_anglais) return Gtk_Label is
      begin

      Gtk_New (F.Label, "Password");
      return F.Label;

      end Mdp;

      procedure creer_fenetre (F : fenetre_boite_anglais) is

      Pixbuf, Pixbuf2 : Gdk_Pixbuf;
      Erreur : GError;
      begin

      Gtk_New (F.Win);
      F.Win.Fullscreen;
      Gtk_New (F.Table, 0, 0, True);
      style_fenetre (F);
      Gdk_New_From_File (Pixbuf, "logo simple.jpg", Erreur);
      Pixbuf2 := Scale_Simple (Pixbuf,100,150);
      Gtk_New (F.logo, Pixbuf2);
      Gtk_New (F.logo, Pixbuf2);
      Gtk_New (F.Label, "My box");

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

      Gtk_New (F.Button, "I'm connecting");
      Connect (F.Button, Signal_Clicked, callback_connexion'Access, F);
      Gtk_New (F.Align (7), 0.5, 0.8, 0.0, 0.0);
      F.Align (7).Add (F.Button);
      F.Table.Add (F.Align (7));

      Gtk_New (F.Button, "Back");
      Connect (F.Button, Signal_Clicked, callback_bouton_retour'access, F.Win);

      declare

      A : Gtk_Alignment;

      begin
      Gdk_New_From_File (Pixbuf, "angle-gauche.png", Erreur);
      Pixbuf2 := Scale_Simple (Pixbuf, 20, 20);
      Gtk_New (F.logo, Pixbuf2);
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
end ma_fenetre.ma_boite.anglais;