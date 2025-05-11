with Gdk.Pixbuf;           use Gdk.Pixbuf;
with Glib.Error;           use Glib.Error;
with Gtk.Window;           use Gtk.Window;
with Gtk.Enums;            use Gtk.Enums;
with Ada.Text_IO;          use Ada.Text_IO;
with Gtk.Style_Provider;   use Gtk.Style_Provider;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

package body ma_fenetre.configuration is

-------------
-- entree  --
-------------

procedure entree (F : ma_configuration) is
begin

Gtk_New (F.Entree);

end entree;

-------------
--  label1  ---
--------------

function Label1 (F : ma_configuration) return Gtk_Label is
begin

Gtk_New (F.Label, "Configuration rapide");
return F.label;

end Label1;

--------------
--  label2  --
--------------

function Label2 (F : ma_configuration) return Gtk_Label is
begin

Gtk_New (F.Label, "Nouveau mot de passe");
return F.Label;

end Label2;

--------------
--  label3  --
--------------

function Label3 (F : ma_configuration) return Gtk_Label is
begin

Gtk_New (F.label, "Confirmez le nouveau mot de passe");
return F.label;

end Label3;

--------------
--  entree  --
--------------

function entree (F : ma_configuration) return Gtk_Entry is
begin

entree (F);
return F.entree;

end entree;

function bouton_changer (F : ma_configuration) return Gtk_Link_Button is
begin

Gtk_New (F.Link_Button, "Changez");
return F.Link_Button;

end bouton_changer;

------------------------------
--  callback_bouton_fermer  --
------------------------------

procedure callback_bouton_fermer
 (Widget : access Gtk_Widget_Record'Class; Window : Gtk_Window) is
 pragma Unreferenced (Widget);
begin

fermer_fenetre (Window);

end callback_bouton_fermer;

procedure affiche_mdp (F : ma_configuration) is
begin

Gtk_New (F.Link_button, "afficher mot de passe");

end affiche_mdp;

----------------------------
--  callback_changer_mdp  --
----------------------------

procedure callback_changer_mdp
 (Widget : access Gtk_Widget_Record'Class) is
 pragma Unreferenced (Widget);

 Mdp, Confirmez : integer;
 begin

 Put_Line ("entrez nouveau mot de passe");
 Get (Mdp);
 Skip_Line;

Put_line ("confirmez nouveau mot de passe");
Get (Confirmez);
Skip_line;

while Confirmez /= Mdp loop

Mdp := 0;
confirmez := 0;
Put_Line ("les mots de passes ne sont pas correct");

if Confirmez = Mdp then
--  envoi des donnees au reseau.
null;
exit;
end if;
end loop;

end callback_changer_mdp;

procedure affiche_numero_id (F : ma_configuration) is
begin

Gtk_New (F.Link_Button, "afficher numero id");

end affiche_numero_id;

-----------------------
--  etat_abonnement  --
-----------------------

procedure etat_abonnement (F : ma_configuration) is
begin

Gtk_New (F.Link_Button, "etat de mon abonnement");

end etat_abonnement;

---------------------
--  creer_fenetre  --
---------------------

procedure creer_fenetre (F : ma_configuration) is 
begin

      Gtk_New (F.Win);
      F.Win.Fullscreen;

      Gtk_New (F.Grid);

      style_fenetre (F);
      Add_Provider_For_Screen (Get_Default,
      +F.Provider, Gtk.Style_Provider.Priority_Application);

      Set_Row_Spacing (F.Grid, 30);
      Set_Column_Spacing (F.Grid, 30);

      ajouter_une_image (F, "logo lespace.png", 190, 100);
      Gtk_New (F.logo, image_ajouter (F));

      F.Grid.Attach (F.logo, 0, 0);
      F.Grid.Attach (Label1 (F), 0, 100);

      Gtk_New (F.Link_button, "Changer mot de passe");
      Connect (F.Link_button, Signal_Clicked, callback_changer_mdp'access);

      F.Grid.Attach (F.Link_button, 0, 150);

      affiche_mdp (F);
      F.Grid.Attach (F.Link_button, 0, 350);

      affiche_numero_id (F);
      F.Grid.Attach (F.Link_Button, 0, 400);

      etat_abonnement (F);
      F.Grid.Attach (F.Link_Button, 0, 450);

      Gtk_New (F.Button, "Fermer");
    ajouter_une_image (F, "angle-gauche.png", 20, 20);
    Gtk_New (F.logo, image_ajouter (F));
    Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

      F.Grid.Attach (F.Button, 0, 500);

      Connect (F.Button, Signal_Clicked, callback_bouton_fermer'access, F.Win);
      
      F.Win.Add (F.Grid);

end creer_fenetre;

----------------------
--  ouvrir_fenetre  --
----------------------

procedure ouvrir_fenetre (F : ma_configuration) is
begin

     F.Win.Show_All;

 end ouvrir_fenetre;
end ma_fenetre.configuration;
