with Gdk.Pixbuf;            use Gdk.Pixbuf;
with Gtk.Main;              use Gtk.Main;
with Glib;                  use Glib;
with Glib.Error;            use Glib.Error;
with Gtk.Tree_Model;        use Gtk.Tree_Model;
with Gtk.Style_Provider;    use Gtk.Style_Provider;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

package body ma_fenetre.abonnement is

    procedure initialise_Grid (F : mon_abonnement) is
    begin

    Gtk_New (F.Grid);
    Set_Row_Spacing (F.Grid, 30);

    end initialise_Grid;

    procedure fermer_fenetre (F : mon_abonnement) is
    begin

    Gtk.Main.Main_Quit;

    end fermer_fenetre;

    procedure mes_offres (F : mon_abonnement) is
    begin

    
    initialise_Grid (F);
    F.Grid.Set_Row_Spacing (30);

    Gtk_New (F.Monnaie);
    Append_Text (F.Monnaie, "Livre Sterling");
    Choix_Monnaie := To_Unbounded_String ("Livre Sterling");
    Append_Text (F.Monnaie, "Euro");
    Append_Text (F.Monnaie, "Dollar");
    Append_Text (F.Monnaie, "FCFA");

    F.Grid.Attach (F.Monnaie, 0, 90);


    Gtk_New (F.offre1,null, "29,99 Livres Sterling 1/mois illimitee");

    S := To_Unbounded_String ("Abonnement de un mois");
    Prix := To_Unbounded_String ("29,99 Livres Sterling");
    Connect (F.Monnaie, Signal_Changed, callback_monnaie'Access, F);

    F.Grid.Attach (F.offre1, 0 ,100);

    Gtk_New (F.offre2, F.offre1, "17,69 Livres Sterling 1/semaine illimitee");
    Connect (F.offre2, Signal_Clicked, callback_offre2'Access, F);

    F.Grid.Attach (F.offre2, 0, 110);

    Gtk_New (F.offre3, F.offre2, "9,30 Livres Sterling 4/jours illimitee");
    Connect (F.offre3, Signal_Clicked, callback_offre3'Access, F);

    F.Grid.Attach (F.offre3, 0, 120);

    Gtk_New (F.offre4, F.offre3, "4,70 Livres Sterling 2/jours illimitee");
    Connect (F.offre4, Signal_Clicked, callback_offre4'Access, F);

    F.Grid.Attach (F.offre4, 0, 130);

     end mes_offres;

     procedure destinataire (F : mon_abonnement) is
     begin

        Gtk_New (F.select1,null, "Sur ma boite");
        box := To_Unbounded_String ("Sur ma boite");

        Gtk_New (F.select2,F.select1, "Sur une autre boite");

    end destinataire;

    procedure style_fenetre_abonnement
     (F : not null access mon_abonnement_record'Class) is

    Erreur : aliased GError;
    Bool : aliased Boolean;

    begin

    Gtk_New (F.Provider);
    Bool := Load_From_Path (F.Provider, "style_abonnement.css", Erreur'access);
    Add_Provider_For_Screen (Get_Default,
    +F.Provider, Gtk.Style_Provider.Priority_Application);

    end style_fenetre_abonnement;

    procedure ouvrir_fenetre (F : mon_abonnement) is
    begin

    F.Win.Show_All;

    end ouvrir_fenetre;

    procedure bouton_retour (F : mon_abonnement) is
    begin

      Gtk_New (F.Button, "Retour");
      Connect (F.Button, Signal_Clicked, callback_bouton_retour'access, F.Win);

    end bouton_retour;

    function bouton_retour (F : mon_abonnement) return Gtk_Button is
    begin

    bouton_retour (F);

    return F.Button;
    end bouton_retour;

    procedure bouton_suivant (F : mon_abonnement) is
    begin

    Gtk_New (F.Button, "Suivant");
    Connect (F.Button, Signal_Clicked, callback_bouton_suivant'Access);

    end bouton_suivant;

    function bouton_suivant (F : mon_abonnement) return Gtk_Button is
    begin

    bouton_suivant (F);

    return F.Button;
    end bouton_suivant;

    procedure logo_lespace (F : mon_abonnement) is
    begin
    
    ajouter_une_image (F, "logo lespace.png", 190, 100);

    Gtk_New (F.logo, image_ajouter (F));

    end logo_lespace;

    function logo_lespace (F : mon_abonnement) return Gtk_Image is
    begin

    ma_fenetre.logo_lespace (F);

    return F.logo;
    end logo_lespace;

    procedure creer_fenetre (F : mon_abonnement) is
    begin

       
       Gtk_New (F.Win);
       F.Win.Fullscreen;
       mes_offres (F);
       F.Win.Add (F.Grid);

       style_fenetre_abonnement (F);

       Connect (F.Win, Signal_Destroy, fermer_fenetre'access);

       destinataire (F);
       F.Grid.Attach (F.select1,0,200);
       F.Grid.Attach (F.select2,0,250);
       Connect (F.select2, Signal_Clicked, callback_select2'access);

      F.Grid.Attach (ma_fenetre.abonnement.logo_lespace (F), 0, 0);

      Gtk_New (F.Label, "Abonnez-vous");
      F.Grid.Attach (F.Label, 0, 50);

      F.Grid.Attach (bouton_suivant (F), 0, 300);

      F.Grid.Attach (bouton_retour (F), 0, 400);
      
    end creer_fenetre;

    procedure callback_bouton_suivant
     (widget : access Gtk_Widget_record'Class) is
      pragma Unreferenced (widget);

      U : String := To_String (S)& " " & To_String (box);
      M : String :=
      "A paye la somme de " & To_String (Prix) & " a : " & To_String (box);
    begin

      Put_line (U);
      Put_Line (numero_id'Image (Id));
      Put_line (M);

      --
      --  envoie de la variable U et l'attribut Id
      --  vers le reseau
      --
      --
      --  reinitialisation des variables globales.
      id := 0;
    end callback_bouton_suivant;

    procedure callback_bouton_retour
     (Widget : access Gtk_Widget_Record'Class;
      Window : Gtk_Window) is

    begin
      
      Window.Destroy;

    end callback_bouton_retour;

    
    procedure callback_select2
     (Widget : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (Widget);

    begin

    Put_Line ("Entrer le numero Id du destinataire");
    Get (integer (Id));
    Skip_Line;
    box := To_Unbounded_String ("Sur une autre boite");

    end callback_select2;

    procedure callback_offre2
     (widget : access Gtk_Widget_Record'Class;
     F : mon_abonnement) is
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
     F : mon_abonnement) is
     pragma Unreferenced (widget);

    begin
        S := To_Unbounded_String 
        ("abonnement de 4 jours");

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
     F : mon_abonnement) is
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

    procedure callback_monnaie
     (widget : access Gtk_Combo_Box_Text_Record'Class;
     F : mon_abonnement) is

    P : Unbounded_String;
    begin

    P := To_Unbounded_String (Get_Active_Text (widget));
    Choix_Monnaie := P;

    if Choix_Monnaie = "Euro" then

    Set_Label (F.offre1, "27,99 Euro 1/mois illimitee");
    Set_Label (F.offre2, "13,99 Euro 1/semaine illimitee");
    Set_Label (F.offre3, "7,30 Euro 4/jours illmitee");
    Set_Label (F.offre4, "4,70 Euro 2/jours illimitee");
    Prix := To_Unbounded_String ("27,99 Euro");

    elsif Choix_Monnaie = "Dollar" then

    Set_Label (F.offre1, "27,99 Dollar 1/mois illimitee");
    Set_Label (F.offre2, "13,99 Dollar 1/semaine illimitee");
    Set_Label (F.offre3, "5,30 Dollar 4/jours illmitee");
    Set_Label (F.offre4, "2,99 Dollar 2/jours illimitee");
    Prix := To_Unbounded_String ("25,99 Dollar");

    elsif Choix_Monnaie = "FCFA" then

    Set_Label (F.offre1, "3900,99 FCFA 1/mois illimitee");
    Set_Label (F.offre2, "1150,40 FCFA 1/semaine illimitee");
    Set_Label (F.offre3, "600,30 FCFA 4/jours illmitee");
    Set_Label (F.offre4, "300,99 FCFA 2/jours illimitee");
    Prix := To_Unbounded_String ("3900,99 FCFA");


    end if;

   end callback_monnaie;

    end ma_fenetre.abonnement;