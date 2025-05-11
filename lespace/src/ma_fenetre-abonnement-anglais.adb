with Gdk.Pixbuf;            use Gdk.Pixbuf;
with Gtk.Main;              use Gtk.Main;
with Glib;                  use Glib;
with Glib.Error;            use Glib.Error;
with Ada.Text_IO;           use Ada.Text_IO;
with ma_fenetre.ma_boite;   use ma_fenetre.ma_boite;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

package body ma_fenetre.abonnement.anglais is

    procedure callback_bouton_suivant
     (widget : access Gtk_Widget_record'Class) is
      pragma Unreferenced (widget);

      U : String := To_String (S)& " " & To_String (box);
      M : String :=
      "A paye la somme de " & To_String (Prix) & " a : " & To_String (box);
    begin

      Put_line (U);
      Put_Line (M);
      Put_Line (numero_id'Image (Id));

      --
      --  envoie de la variable U et l'attribut Id
      --  vers le reseau
      --
      --
      --  reinitialisation des variables globales.
      id := 0;
    end callback_bouton_suivant;

    procedure callback_select2
     (Widget : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (Widget);

    begin

    Put_Line ("Enter the destinatary id number");
    Get (integer (Id));
    Skip_Line;
    box := To_Unbounded_String ("sur une autre boite");

    end callback_select2;

    procedure callback_offre2
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement_anglais) is
     pragma Unreferenced (widget);
    
    begin

       S := To_Unbounded_String
        ("abonnement de une semaine");

       if Choix_Monnaie = "FCFA" then
        Prix := To_Unbounded_String ("1150,40 FCFA");


       elsif Choix_Monnaie = "Euro" then
        Prix := To_Unbounded_String ("15,99 Euro");

      elsif Choix_Monnaie = "Livre Sterling" then
       Prix := To_Unbounded_String ("17,69 Livres Sterling");

       elsif Choix_Monnaie = "Dollar" then
        Prix := To_Unbounded_String ("13,99 Dollar");

       else null;

       end if;

    end callback_offre2;

    procedure callback_offre3
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement_anglais) is
     pragma Unreferenced (widget);

    begin

    S := To_Unbounded_String
     ("abonnement de quatre 4 jours");

       if Choix_Monnaie = "FCFA" then
        Prix := To_Unbounded_String ("600,30 FCFA");


       elsif Choix_Monnaie = "Euro" then
        Prix := To_Unbounded_String ("7,30 Euro"); 

      elsif Choix_Monnaie = "Livre Sterling" then
       Prix := To_Unbounded_String ("9,30 Livres Sterling");

       elsif Choix_Monnaie = "Dollar" then
        Prix := To_Unbounded_String ("5,30 Dollar");

       else null;

       end if;

    end callback_offre3;

    procedure callback_offre4
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement_anglais) is
     pragma Unreferenced (widget);

    begin
        S := To_Unbounded_String 
        ("abonnement de 2 jours");

        if Choix_Monnaie = "FCFA" then
        Prix := To_Unbounded_String ("300,99 FCFA");


       elsif Choix_Monnaie = "Euro" then
        Prix := To_Unbounded_String ("4,70 Euro");

      elsif Choix_Monnaie = "Livre Sterling" then
        Prix := To_Unbounded_String ("4,70 Livres Sterling");

       elsif Choix_Monnaie = "Dollar" then
        Prix := To_Unbounded_String ("2,99 Dollar");

       else null;

       end if;

    end callback_offre4;

    procedure initialise_Grid (F : mon_abonnement_anglais) is
    begin

    Gtk_New (F.Grid);
    Set_Row_Spacing (F.Grid, 30);

    end initialise_Grid;

    procedure callback_bouton_retour (Widget : access Gtk_Widget_Record'Class;
                                      Window : Gtk_Window) is
    begin
      
      Window.Destroy;

    end callback_bouton_retour;

    procedure fermer_fenetre (F : mon_abonnement_anglais) is
    begin

    Gtk.Main.Main_Quit;

    end fermer_fenetre;

    procedure mes_offres (F : mon_abonnement_anglais) is
    begin

    
    initialise_Grid (F);

    F.Grid.Set_Row_Spacing (30);Gtk_New (F.Monnaie);

    Append_Text (F.Monnaie, "Livre Sterling");
    Choix_Monnaie := To_Unbounded_String ("Livre Sterling");

    Append_Text (F.Monnaie, "Euro");
    Append_Text (F.Monnaie, "Dollar");
    Append_Text (F.Monnaie, "FCFA");

    F.Grid.Attach (F.Monnaie, 0, 90);

    Gtk_New (F.offre1,null, "29,99 Livres Sterling 1/month unlimited");
    S := To_Unbounded_String ("Abonnement de un mois");
    Prix := To_Unbounded_String ("29,99 Livres Sterling");

    Connect (F.Monnaie, Signal_Changed, callback_monnaie'Access, F);

    F.Grid.Attach (F.offre1, 0 ,100);

    Gtk_New (F.offre2, F.offre1, "17,69 Livres Sterling 1/weekly");
    Connect (F.offre2, Signal_Clicked, callback_offre2'Access, F);
    F.Grid.Attach (F.offre2, 0, 110);


    Gtk_New (F.offre3, F.offre2, "9,30 Livres Sterling 4/days");
    Connect (F.offre3, Signal_Clicked, callback_offre3'Access, F);
    F.Grid.Attach (F.offre3, 0, 120);

    Gtk_New (F.offre4, F.offre3, "4,70 Livres Sterling 2/days");
    Connect (F.offre4, Signal_Clicked, callback_offre4'Access, F);
    F.Grid.Attach (F.offre4, 0, 130);


     end mes_offres;

     procedure destinataire (F : mon_abonnement_anglais) is
     begin

        Gtk_New (F.select1,null, "on my box");
        box := To_Unbounded_String ("Sur ma boite");
        Gtk_New (F.select2,F.select1, "on a other box");

    end destinataire;

    procedure create_next_button (F : mon_abonnement_anglais) is
    begin

      Gtk_New (F.Button, "Next");
      Connect (F.Button, Signal_Clicked, callback_bouton_suivant'Access);

    end create_next_button;

    procedure create_back_button (F : mon_abonnement_anglais) is
    begin

      Gtk_New (F.Button, "Back");
      Connect (F.Button, Signal_Clicked, callback_bouton_retour'access, F.Win);
    
    end create_back_button;

    procedure lespace_logo (F : mon_abonnement_anglais) is

    Pixbuf, Pixbuf2 : Gdk_Pixbuf;
    Erreur : GError;

    begin
    
      Gdk_New_From_File (Pixbuf, "logo lespace.png", Erreur);
      Pixbuf2 := Scale_Simple (Pixbuf,190,100);
      Gtk_New (F.logo, Pixbuf2);

    end lespace_logo;

    function back_button (F : mon_abonnement_anglais) return Gtk_Button is
    begin

    create_back_button (F);

    return F.Button;
    end back_button;

    function next_button (F : mon_abonnement_anglais) return Gtk_Button is
    begin

    create_next_button (F);

    return F.Button;
    end next_button;

    function lespace_logo (F : mon_abonnement_anglais) return Gtk_Image is
    begin

    lespace_logo (F);

    return F.logo;
    end lespace_logo;

    procedure open_window (F : mon_abonnement_anglais) is
    begin

    F.Win.Show_All;

    end open_window;

    procedure create_window (F : mon_abonnement_anglais) is

    Pixbuf, Pixbuf2 : Gdk_Pixbuf;
    Erreur : GError;
    begin

       
       Gtk_New (F.Win);
       F.Win.Fullscreen;

       mes_offres (F);
       
       style_fenetre_abonnement (F);

       F.Win.Add (F.Grid);

       Connect (F.Win, Signal_Destroy, fermer_fenetre'access);

       destinataire (F);
       F.Grid.Attach (F.select1,0,200);
       F.Grid.Attach (F.select2,0,250);
       Connect (F.select2, Signal_Clicked, callback_select2'access);
      
      F.Grid.Attach (lespace_logo (F), 0, 0);

      Gtk_New (F.Label, "Subscriber you");

      F.Grid.Attach (F.Label, 0, 50);
      F.Grid.Attach (next_button (F), 0, 300);
      F.Grid.Attach (back_button (F), 0, 400);
      
    end create_window;

    procedure callback_monnaie
     (widget : access Gtk_Combo_Box_Text_Record'Class;
     F : mon_abonnement_anglais) is

    P : Unbounded_String;
    begin

    P := To_Unbounded_String (Get_Active_Text (widget));
    Choix_Monnaie := P;

    if Choix_Monnaie = "Euro" then

    Set_Label (F.offre1, "27,99 Euro 1/month unlimited");
    Set_Label (F.offre2, "13,99 Euro 1/weekly unlimited");
    Set_Label (F.offre3, "7,30 Euro 4/days unlimited");
    Set_Label (F.offre4, "4,70 Euro 2/days unlimited");
    Prix := To_Unbounded_String ("27,99 Euro");

    elsif Choix_Monnaie = "Dollar" then

    Set_Label (F.offre1, "27,99 Dollar 1/month unlimited");
    Set_Label (F.offre2, "13,99 Dollar 1/weekly unlimited");
    Set_Label (F.offre3, "5,30 Dollar 4/days unlimited");
    Set_Label (F.offre4, "2,99 Dollar 2/jours unlimited");
    Prix := To_Unbounded_String ("25,99 Dollar");

    elsif Choix_Monnaie = "FCFA" then

    Set_Label (F.offre1, "3900,99 FCFA 1/month unlimited");
    Set_Label (F.offre2, "1150,40 FCFA 1/weekly unlimited");
    Set_Label (F.offre3, "600,30 FCFA 4/days unlimited");
    Set_Label (F.offre4, "300,99 FCFA 2/days unlimited");
    Prix := To_Unbounded_String ("3900,99 FCFA");


    end if;

   end callback_monnaie;
end ma_fenetre.abonnement.anglais;