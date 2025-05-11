with Gdk.Pixbuf;           use Gdk.Pixbuf;
with Glib.Error;           use Glib.Error;
with Gtk.Window;           use Gtk.Window;
with Gtk.Enums;            use Gtk.Enums;
with Ada.Text_IO;          use Ada.Text_IO;
with Gtk.Style_provider;   use Gtk.Style_Provider;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

package body ma_fenetre.configuration.anglais is

--------------
--  entree  --
--------------

procedure entree (F : ma_config_anglais) is
begin

Gtk_New (F.Entree);

end entree;

--------------
--  label1  --
--------------

function Label1 (F : ma_config_anglais) return Gtk_Label is
begin

Gtk_New (F.Label, "Quick configuration");
return F.label;

end Label1;

--------------
--  label2  --
--------------

function Label2 (F : ma_config_anglais) return Gtk_Label is
begin

Gtk_New (F.Label, "Passworld");
return F.Label;

end Label2;

--------------
--  label3  --
--------------

function Label3 (F : ma_config_anglais) return Gtk_Label is
begin

Gtk_New (F.label, "Confirm password");
return F.label;

end Label3;

-----------------------
--  function entree  --
-----------------------

function entree (F : ma_config_anglais) return Gtk_Entry is
begin

entree (F);
return F.entree;

end entree;

----------------------
--  bouton_changer  --
----------------------

function bouton_changer (F : ma_config_anglais) return Gtk_Link_Button is
begin

Gtk_New (F.Link_Button, "Change");
return F.Link_Button;

end bouton_changer;

------------------------------
--  callabck_bouton_fermer  --
------------------------------

procedure callback_bouton_fermer
 (Widget : access Gtk_Widget_Record'Class; Window : Gtk_Window) is
 pragma Unreferenced (Widget);
begin

fermer_fenetre (Window);

end callback_bouton_fermer;

-------------------
--  affiche_mdp  --
-------------------

procedure affiche_mdp (F : ma_config_anglais) is
begin

Gtk_New (F.Link_button, "display password");

end affiche_mdp;

----------------------------
--  callback_changer_mdp  --
----------------------------

procedure callback_changer_mdp
 (Widget : access Gtk_Widget_Record'Class) is
 pragma Unreferenced (Widget);

 Mdp, Confirmez : integer;
 begin

 Put_Line ("Enter the new password");
 Get (Mdp);
 Skip_Line;

Put_line ("confirm the new password");
Get (Confirmez);
Skip_line;

while Confirmez /= Mdp loop

Mdp := 0;
confirmez := 0;
Put_Line ("Password are not corrects");

if Confirmez = Mdp then
--  envoi des donnees au reseau.
null;
exit;
end if;
end loop;

end callback_changer_mdp;

-----------------------------------
--  callback_afficher_numero_id  --
-----------------------------------

procedure affiche_numero_id (F : ma_config_anglais) is
begin

Gtk_New (F.Link_Button, "display id number");

end affiche_numero_id;

procedure etat_abonnement (F : ma_config_anglais) is
begin

Gtk_New (F.Link_Button, "my subscription");

end etat_abonnement;

---------------------
--  create_window  --
---------------------

procedure create_window (F : ma_config_anglais) is 
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

      Gtk_New (F.Link_button, "Change password");
      Connect (F.Link_button, Signal_Clicked, callback_changer_mdp'access);

      F.Grid.Attach (F.Link_button, 0, 150);

      affiche_mdp (F);
      F.Grid.Attach (F.Link_button, 0, 350);

      affiche_numero_id (F);
      F.Grid.Attach (F.Link_Button, 0, 400);

      etat_abonnement (F);
      F.Grid.Attach (F.Link_Button, 0, 450);

      Gtk_New (F.Button, "Close");
    ajouter_une_image (F, "angle-gauche.png", 20, 20);
    Gtk_New (F.logo, image_ajouter (F));
    Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

      F.Grid.Attach (F.Button, 0, 500);

      Connect (F.Button, Signal_Clicked, callback_bouton_fermer'access, F.Win);

      F.Win.Add (F.Grid);

end create_window;

-------------------
--  open_window  --
-------------------

procedure open_window (F : ma_config_anglais) is
begin

     F.Win.Show_All;

end open_window;
end ma_fenetre.configuration.anglais;
