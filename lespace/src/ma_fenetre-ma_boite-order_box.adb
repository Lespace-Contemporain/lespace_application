--                     Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 09 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with reseaux;                 use reseaux;
with Gtk.Enums;               use Gtk.Enums;
with Gdk.Pixbuf;              use Gdk.Pixbuf;
with Glib.Error;              use Glib.Error;
with Ada.Text_IO;             use Ada.Text_IO;
with Gtk.Combo_Box_Text;      use Gtk.Combo_Box_Text;
with Gtk.Style_Provider;      use Gtk.Style_Provider;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;

package body ma_fenetre.ma_boite.order_box is

   function nom_champ_nom (F : order_my_box) return Gtk_Label is
   begin

     Gtk_New (F.Label, "Nom et Prenom");
     Set_Margin_top (F.Label, 100);
     return F.Label;
     
  end nom_champ_nom;

  procedure champ_saisir_nom (F : order_my_box) is
  begin

    Gtk_New (F.Entree);

   end champ_saisir_nom;

   function champ_saisir_nom (F : order_my_box) return Gtk_Entry is
   begin

   champ_Saisir_nom (F);
   return F.Entree;

   end champ_saisir_nom;

   function nom_champ_numero (F : order_my_box) return Gtk_Label is
   begin
   
   Gtk_New (F.Label, "Numero ou Mail (Numero de telephone recommandé)");
   return F.Label;

   end nom_champ_numero;

   procedure champ_saisir_numero (F : order_my_box) is
   begin

   Gtk_New (F.Entree1);

   end champ_saisir_numero;

   function champ_saisir_numero (F : order_my_box) return Gtk_Entry is
   begin

   champ_saisir_numero (F);
   return F.Entree1;

   end champ_saisir_numero;

   procedure callback_champ_pays
    (widget : access Gtk_Combo_Box_Text_Record'Class;
    F : order_my_box) is
    pragma Unreferenced (widget);
    begin

    P := To_Unbounded_String (Get_Active_Text (Widget));
    Put_Line (To_String (P));

   end callback_champ_pays; 

   function nom_champ_pays (F : order_my_box) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Votre Pays");
   return F.Label;

   end nom_champ_pays;

   procedure champ_saisir_pays (F : order_my_box) is
   begin

   Gtk_New (F.Combo_box);
   Append_Text (F.Combo_box, "Afghanistan");
   Append_Text (F.Combo_box, "Afrique du Sud");
   Append_Text (F.Combo_box, "Albanie");
   Append_Text (F.Combo_box, "Algérie");
   Append_Text (F.Combo_box, "Allemagne");
   Append_Text (F.Combo_box, "Andorre");
   Append_Text (F.Combo_box, "Angola");
   Append_Text (F.Combo_box, "Anguila");
   Append_Text (F.Combo_box, "Antarctique");
   Append_Text (F.Combo_box, "Antiga et Barbuda");
   Append_Text (F.Combo_box, "Arabie Saoudite");
   Append_Text (F.Combo_box, "Argentine");
   Append_Text (F.Combo_box, "Arménie");
   Append_Text (F.Combo_box, "Aruba");
   Append_Text (F.Combo_box, "Austratie");
   Append_Text (F.Combo_box, "Autriche");
   Append_Text (F.Combo_box, "Azerbaïdjan");
   Append_Text (F.Combo_box, "Bahamas");
   Append_Text (F.Combo_box, "Bahreïn");
   Append_Text (F.Combo_box, "Bangladesh");
   Append_Text (F.Combo_box, "Barbade");
   Append_Text (F.Combo_box, "Belgique");
   Append_Text (F.Combo_box, "Bélize");
   Append_Text (F.Combo_box, "Bénin");
   Append_Text (F.Combo_box, "Bermudes");
   Append_Text (F.Combo_box, "Bhoutan");
   Append_Text (F.Combo_box, "Biélorussie");
   Append_Text (F.Combo_box, "Bolivie");
   Append_Text (F.Combo_box, "Bonaire");
   Append_Text (F.Combo_box, "Bosnie - Herzégovine");
   Append_Text (F.Combo_box, "Botswana");
   Append_Text (F.Combo_box, "Brésil");
   Append_Text (F.Combo_box, "Brunei");
   Append_Text (F.Combo_box, "Bulgarie");
   Append_Text (F.Combo_box, "Burkina Faso");
   Append_Text (F.Combo_box, "Burundi");
   Append_Text (F.Combo_box, "Cambodge");
   Append_Text (F.Combo_box, "Cameroun");
   Append_Text (F.Combo_box, "Canada");
   Append_Text (F.Combo_box, "Cap-Vert");
   Append_Text (F.Combo_box, "Chili");
   Append_Text (F.Combo_box, "Chine");
   Append_Text (F.Combo_box, "Chypre");
   Append_Text (F.Combo_box, "Colombie");
   Append_Text (F.Combo_box, "Congo (-Brazzaville)");
   Append_Text (F.Combo_box, "Congo (République Démocratique)");
   Append_Text (F.Combo_box, "Corée du Nord");
   Append_Text (F.Combo_box, "Corée du Sud (République de Corée)");
   Append_Text (F.Combo_box, "Costa Rica");
   Append_Text (F.Combo_box, "Côte d'Ivoire");
   Append_Text (F.Combo_box, "Croatie");
   Append_Text (F.Combo_box, "Cuba");
   Append_Text (F.Combo_box, "Curaçao");
   Append_Text (F.Combo_box, "Danemark et îles Féroé");
   Append_Text (F.Combo_box, "Djibouti");
   Append_Text (F.Combo_box, "Dominique");
   Append_Text (F.Combo_box, "Egypte");
   Append_Text (F.Combo_box, "El Salvador");
   Append_Text (F.Combo_box, "Emirats Arabes Unis");
   Append_Text (F.Combo_box, "Equateur");
   Append_Text (F.Combo_box, "Erythrée");
   Append_Text (F.Combo_box, "Espagne et Iles Canaries");
   Append_Text (F.Combo_box, "Estonie");
   Append_Text (F.Combo_box, "eSwatini (Swaziland)");
   Append_Text (F.Combo_box, "États-Unis d'Amérique");
   Append_Text (F.Combo_box, "Ethiopie");
   Append_Text (F.Combo_box, "Fidji");
   Append_Text (F.Combo_box, "Finland");
   Append_Text (F.Combo_box, "France");
   Append_Text (F.Combo_box, "Gabon");
   Append_Text (F.Combo_box, "Gambie");
   Append_Text (F.Combo_box, "Géorgie");
   Append_Text (F.Combo_box, "Ghana");
   Append_Text (F.Combo_box, "Gibraltar");
   Append_Text (F.Combo_box, "Grèce");
   Append_Text (F.Combo_box, "Grenade");
   Append_Text (F.Combo_box, "Groenland");
   Append_text (F.Combo_box, "Guadeloupe");
   Append_Text (F.Combo_box, "Guam");
   Append_Text (F.Combo_box, "Guatemala");
   Append_Text (F.Combo_box, "Guinée-Bissau");
   Append_Text (F.Combo_box, "Guinée (Conakry)");
   Append_Text (F.Combo_box, "Guinée equatoriale");
   Append_Text (f.Combo_box, "Guyana (Georgetown)");
   Append_Text (F.Combo_box, "Guyane (Française)");
   Append_Text (F.Combo_box, "Haïti");
   Append_Text (F.Combo_box, "Honduras");
   Append_Text (F.Combo_box, "Hong Kong");
   Append_Text (F.Combo_box, "Hongrie");
   Append_Text (F.Combo_box, "Ile Christmas");
   Append_Text (F.Combo_box, "Iles Caïmans");
   Append_Text (F.Combo_box, "Iles Cook");
   Append_Text (F.Combo_box, "Iles Malouines");
   Append_Text (F.Combo_box, "Iles Marshall");
   Append_Text (F.Combo_box, "Iles Salomon");
   Append_Text (F.Combo_box, "Iles Vierges (américaines)");
   Append_Text (F.Combo_box, "Iles Vierges (britanniques)");
   Append_Text (F.Combo_box, "Inde");
   Append_Text (F.Combo_box, "Indonésie");
   Append_Text (F.Combo_box, "Irak");
   Append_text (F.Combo_box, "Iran");
   Append_Text (F.Combo_box, "Irland");
   Append_Text (F.Combo_box, "Island");
   Append_Text (F.Combo_box, "Israël");
   Append_Text (F.Combo_box, "Italie");
   Append_Text (F.Combo_box, "Jamaïque");
   Append_text (F.Combo_box, "Japon");
   Append_Text (F.Combo_box, "Jordanie");
   Append_Text (F.Combo_box, "Kazakhstan");
   Append_Text (F.Combo_box, "Kenya");
   Append_Text (F.combo_box, "Kirghizistan");
   Append_Text (F.Combo_box, "Kiribati");
   Append_Text (F.Combo_box, "Kosovo");
   Append_Text (F.Combo_box, "Koweït");
   Append_Text (F.Combo_box, "Laos");
   Append_text (F.Combo_box, "Lesotho");
   Append_Text (F.Combo_box, "Lettonie");
   Append_Text (F.Combo_box, "Liban");
   Append_Text (F.Combo_box, "Libéria");
   Append_Text (F.combo_box, "Libye");
   Append_Text (F.Combo_box, "Liechtenstein");
   Append_Text (F.Combo_box, "Lituanie");
   Append_Text (F.Combo_box, "Luxembourg");
   Append_Text (F.Combo_box, "Macao (Chine)");
   Append_Text (F.Combo_box, "Macédoine du Nord");
   Append_Text (F.Combo_box, "Madagascar");
   Append_Text (F.Combo_box, "Malaisie");
   Append_Text (f.Combo_box, "Malawi");
   Append_Text (F.Combo_box, "Maldives");
   Append_Text (F.Combo_box, "Mali");
   Append_Text (F.combo_box, "Malte");
   Append_Text (F.Combo_box, "Mariannes du Nord (Iles, américaines)");
   Append_Text (F.Combo_box, "Maroc");
   Append_Text (F.Combo_box, "Martinique");
   Append_Text (F.combo_box, "Maurice");
   Append_Text (F.Combo_box, "Mauritanie");
   Append_Text (F.Combo_box, "Mayotte");
   Append_Text (F.Combo_box, "Mexique");
   Append_Text (F.combo_box, "Micronesie");
   Append_Text (F.Combo_box, "Moldova");
   Append_Text (F.Combo_box, "Monaco");
   Append_Text (F.combo_box, "Mongolie");
   Append_Text (F.Combo_box, "Monténégro");
   Append_Text (F.Combo_box, "Montserrat (britannique)");
   Append_Text (F.Combo_box, "Mozambique");
   Append_Text (F.Combo_box, "Myanmar");
   Append_Text (F.Combo_box, "Namibie");
   Append_Text (F.Combo_box, "Nauru");
   Append_Text (F.Combo_box, "Népal");
   Append_Text (F.Combo_box, "Niger");
   Append_Text (F.Combo_box, "Nigéria");
   Append_Text (F.Combo_box, "Niue");
   Append_Text (F.combo_box, "Norvège");
   Append_Text (F.combo_box, "Nouvelle-Calédonie");
   Append_Text (F.Combo_box, "Nouvelle-Zélande");
   Append_Text (F.Combo_box, "Oman");
   Append_Text (F.combo_box, "Ouganda");
   Append_Text (F.Combo_box, "Ouzbékistan");
   Append_Text (F.Combo_box, "Pakistan");
   Append_Text (F.Combo_box, "Palau");
   Append_Text (F.Combo_box, "Palestine");
   Append_Text (F.Combo_box, "Panama");
   Append_Text (F.combo_box, "Papouasie-Nouvelle-Guinée");
   Append_Text (F.Combo_box, "Paraguay");
   Append_Text (F.Combo_box, "Pays-Bas");
   Append_Text (F.Combo_box, "Pérou");
   Append_Text (F.Combo_box, "Philippines");
   Append_Text (F.combo_box, "Pitcairn");
   Append_Text (F.Combo_box, "Pologne");
   Append_Text (F.Combo_box, "Polynésie (français)");
   Append_Text (F.Combo_box, "Porto Rico");
   Append_Text (F.Combo_box, "Portugal, Açores, Madère");
   Append_Text (F.Combo_box, "Qatar");
   Append_Text (F.combo_box, "République Centrafricaine");
   Append_Text (F.Combo_box, "République Dominicaine");
   Append_Text (F.Combo_box, "République tchèque");
   Append_Text (f.Combo_box, "Réunion");
   Append_Text (F.Combo_box, "Roumanie");
   Append_Text (F.Combo_box, "Royaume-uni");
   Append_Text (F.Combo_box, "Russie");
   Append_Text (F.Combo_box, "Rwanda");
   Append_Text (F.Combo_box, "Sahara occidental");
   Append_Text (F.Combo_box, "Saint-Barthélemy");
   Append_Text (F.combo_box, "Saint-Christophe-et-Niévès");
   Append_Text (F.Combo_box, "Saint-Eustache et Saba");
   Append_Text (F.Combo_box, "Saint-Marin");
   Append_Text (F.Combo_box, "Saint-Martin (France)");
   Append_Text (F.Combo_box, "Saint-Martin (Pays-Bas)");
   Append_Text (F.combo_box, "Saint-Pierre-et-Miquelon");
   Append_Text (F.Combo_box, "Saint-Vincent-et-les-Grenadines");
   Append_Text (F.Combo_box, "Sainte-Hélène - Tristan Da Cunha - Ascension");
   Append_Text (F.Combo_box, "Sainte-Lucie");
   Append_Text (F.Combo_box, "Samoa");
   Append_Text (F.Combo_box, "Samoa (Américain)");
   Append_Text (F.Combo_box, "Sao Tomé et Principe");
   Append_Text (F.Combo_box, "Sénégal");
   Append_Text (F.Combo_box, "Serbie");
   Append_Text (F.Combo_box, "Seychelles");
   Append_Text (F.Combo_box, "Sierra Leone");
   Append_Text (F.Combo_box, "Singapour");
   Append_Text (F.Combo_box, "Slovaquie");
   Append_Text (F.Combo_box, "Slovénie");
   Append_Text (F.combo_box, "Somalie");
   Append_Text (F.Combo_box, "Soudan");
   Append_text (F.Combo_box, "Soudan du Sud");
   Append_Text (F.combo_box, "Sri Lanka");
   Append_Text (F.Combo_box, "Suède");
   Append_Text (F.Combo_box, "Suisse");
   Append_Text (F.Combo_box, "Suriname");
   Append_Text (F.Combo_box, "Syrie");
   Append_Text (F.combo_box, "Tadjikistan");
   Append_Text (F.Combo_box, "Taiwan");
   Append_Text (F.Combo_box, "Tanzanie");
   Append_Text (F.combo_box, "Tchad");
   Append_Text (F.Combo_box, "Thaïlande");
   Append_Text (F.Combo_box, "Timor oriental");
   Append_Text (F.Combo_box, "Togo");
   Append_Text (F.Combo_box, "Tokelau (Nouvelle-Zélande)");
   Append_Text (F.Combo_box, "Tonga");
   Append_Text (F.Combo_box, "Trinité et Tobago");
   Append_Text (F.Combo_box, "Tunisie");
   Append_Text (F.Combo_box, "Turkménistan");
   Append_Text (F.Combo_box, "Turques-et-Caïques (britanniques)");
   Append_Text (F.Combo_box, "Turquie");
   Append_Text (F.combo_box, "Tuvalu");
   Append_Text (F.Combo_box, "Ukraine");
   Append_Text (F.Combo_box, "Uruguay");
   Append_Text (F.Combo_box, "Vanuatu");
   Append_Text (F.Combo_box, "Venezuela");
   Append_Text (F.Combo_box, "Vietnam");
   Append_Text (F.Combo_box, "Wallis-et-Futuna");
   Append_Text (F.Combo_box, "Yémen");
   Append_Text (F.Combo_box, "Zambie");
   Append_Text (F.Combo_box, "Zimbabwe");

   Connect (F.Combo_box, Signal_Changed, callback_champ_pays'Access, F);

   end champ_saisir_pays;

   function champ_saisir_pays (F : order_my_box) return Gtk_Combo_Box_Text is
   begin
   
   champ_saisir_pays (F);
   return F.Combo_box;

   end champ_saisir_pays;

   function nom_champ_ville (F : order_my_box) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Nom de votre province");
   return F.Label;

   end nom_champ_ville;

   procedure champ_saisir_ville (F : order_my_box) is
   begin

   Gtk_New (F.Entree2);

   end champ_saisir_ville;

   function champ_saisir_ville (F : order_my_box) return Gtk_Entry is
   begin

   champ_saisir_ville (F);
   return F.Entree2;

   end champ_saisir_ville;

   function nom_champ_quartier (F : order_my_box) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Nom de votre ville");
   return F.Label;

   end nom_champ_quartier;

   procedure champ_saisir_quartier (F : order_my_box) is
   begin

   Gtk_New (F.Entree3);

   end champ_saisir_quartier;

   function champ_saisir_quartier (F : order_my_box) return Gtk_Entry is
   begin

   champ_saisir_quartier (F);
   return F.Entree3;

   end champ_saisir_quartier;

   function nom_champ_adresse (F : order_my_box) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Nom de votre quartier");
   return F.Label;

   end nom_champ_adresse;

   procedure champ_saisir_adresse (F : order_my_box) is
   begin

   Gtk_New (F.Entree4);
   Set_Text (F.Entree4, "Aucune");

   end champ_saisir_adresse;

   function champ_saisir_adresse (F : order_my_box) return Gtk_Entry is
   begin

   champ_saisir_adresse (F);
   return F.Entree4;

   end champ_saisir_adresse;

   procedure callback_suivant
    (widget : access Gtk_Widget_Record'Class;
    F : order_my_box) is

    type Pointeur is access String;
   
    message : constant string := "je veux commander une boite";
    message_recu : Pointeur;
    P0, P1, P2, P3, P4 : Pointeur;
    Check : integer := 0;
    F_network : dialogue_boite;

    begin

      creation_reseau (Sock);
      ouverture_reseau (Sock);

    P0 := new String'(Get_Text (F.Entree));
    P1 := new String'(Get_Text (F.Entree1));
    P2 := new String'(Get_Text (F.Entree2));
    P3 := new String'(Get_Text (F.Entree3));
    P4 := new String'(Get_Text (F.Entree4));

    String'Output (sock.Channel, message);
    check := Integer'Input(sock.Channel);

     if check = 1 then
       String'Output (sock.Channel, P0.all); -- nom complet
       String'Output (sock.Channel, P1.all); -- numero ou mail
       String'Output (sock.Channel, To_String(P)); -- pays
       String'Output (sock.Channel, P2.all); -- province
       String'Output (sock.Channel, P3.all); -- ville
       String'Output (sock.Channel, P4.all); -- quartier

      end if;

      message_recu := new String'(String'Input (sock.Channel));

      if message_recu.all /= " " then
         F.Win_abonnement := new window_network_record;
         reseaux.space_fenetre_reseau_one (sock, F.Win_abonnement, message_recu.all);
     else
         Gtk.Message_Dialog.Gtk_New (F_network.Msg,F.Win,0,message_error,buttons_ok,
          Message => "Une erreur est survenue lors de votre demande d'abonnement. Veuillez reessayer plus tard.");
         F_network.Msg.Show_All;
      end if;

   end callback_suivant;

   procedure bouton_suivant (F : order_my_box) is

   Pixbuf, Pixbuf2 : Gdk_Pixbuf;
   Erreur : GError;

   begin

   Gtk_New (F.Button, "Suivant");
   Connect (F.Button, Signal_clicked, callback_suivant'Access, F);

   -- Gdk_New_From_File (Pixbuf, "angle-droit.png", Erreur);
   -- Pixbuf2 := Scale_Simple (Pixbuf, 20, 20);
   -- Gtk_New (F.logo, Pixbuf2);
   -- Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

   end bouton_suivant;

   function bouton_suivant (F : order_my_box) return Gtk_Button is
   begin
   
   bouton_suivant (F);
   return F.Button;

   end bouton_suivant;

   procedure bouton_retour (F : order_my_box) is

   Pixbuf, Pixbuf2 : Gdk_Pixbuf;
   Erreur : GError;
   
   begin

   Gtk_New (F.Button, "Retour");

   -- Gdk_New_From_File (Pixbuf, "angle-gauche.png", Erreur);
   -- Pixbuf2 := Scale_Simple (Pixbuf, 20, 20);
   -- Gtk_New (F.logo, Pixbuf2);
   -- Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

   end bouton_retour;

   function bouton_retour (F : order_my_box) return Gtk_Button is
   begin

      bouton_retour (F);
      return F.Button;

    end bouton_retour;

   procedure creer_fenetre (F : order_my_box) is
    
    Pixbuf, Pixbuf2 : Gdk_Pixbuf;
    Erreur : GError;
   begin

   Gtk_New (F.Win);
   F.Win.Fullscreen;
   Connect (F.Win, Signal_Destroy, fermer_fenetre'access);
   Gtk_New (F.Srolled_Bar);

   style_fenetre (F);
   --Add_Provider_For_Screen (Get_Default,
   --+F.Provider, Gtk.Style_Provider.Priority_Application);

   Set_Policy (F.Srolled_Bar,Policy_Always,Policy_Always);

   Gtk_New (F.Box);
   Set_Row_Spacing (F.Box, 50);
   F.Srolled_Bar.Add (F.Box);

   F.Win.Add (F.Srolled_Bar);

   Gtk_New (F.Label, "Commander une boite");
   --Gdk_New_From_File (Pixbuf, "logo lespace.png", Erreur);
   --Pixbuf2 := Scale_Simple (Pixbuf,190,100);
   --Gtk_New (F.logo, Pixbuf2);

   --F.Box.Attach (F.logo, 0,0);
   F.Box.Attach (F.Label, 0,100);
   F.Box.Attach (nom_champ_nom (F),0,200);
   F.Box.Attach (champ_saisir_nom (F),0,400);
   F.Box.Attach (nom_champ_numero (F),0,500);
   F.Box.Attach (champ_saisir_numero (F), 0,600);
   F.Box.Attach (nom_champ_pays (F),0,700);
   F.Box.Attach (champ_saisir_pays (F),0,800);
   F.Box.Attach (nom_champ_ville (F),0,900);
   F.Box.Attach (champ_saisir_ville (F),0,1000);
   F.Box.Attach (nom_champ_quartier (F),0,1100);
   F.Box.Attach (champ_saisir_quartier (F),0,1200);
   F.Box.Attach (nom_champ_adresse (F),0,1300);
   F.Box.Attach (champ_saisir_adresse (F),0,1400);
   F.Box.Attach (bouton_suivant (F),0,1500);
   F.Box.Attach (bouton_retour (F),0,1600);
   Connect (F.Button, Signal_Clicked, callback_retour'Access, F.Win);

   end creer_fenetre;

   procedure ouvrir_fenetre (F : order_my_box) is
   begin

     F.Win.Show_All;

   end ouvrir_fenetre;

   procedure callback_retour
    (widget : access Gtk_Widget_Record'Class;
     window : Gtk_Window) is
     pragma Unreferenced (widget);

   begin

   fermer_fenetre (window);

   end callback_retour;
end ma_fenetre.ma_boite.order_box;