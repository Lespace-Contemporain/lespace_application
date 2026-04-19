--                     Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 09 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with Gtk.Enums;              use Gtk.Enums;
with Gdk.Pixbuf;             use Gdk.Pixbuf;
with Glib.Error;             use Glib.Error;
with Ada.Text_IO;            use Ada.Text_IO;
with Gtk.Style_Provider;     use Gtk.Style_Provider;
with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

package body ma_fenetre.ma_boite.order_box.anglais is

   function nom_champ_nom (F : order_my_box_english) return Gtk_Label is
   begin

     Gtk_New (F.Label, "Name and first name");
     Set_Margin_top (F.Label, 100);
     return F.Label;
     
  end nom_champ_nom;

  procedure champ_saisir_nom (F : order_my_box_english) is
  begin

    Gtk_New (F.Entree);

   end champ_saisir_nom;

   function champ_saisir_nom (F : order_my_box_english) return Gtk_Entry is
   begin

   champ_Saisir_nom (F);
   return F.Entree;

   end champ_saisir_nom;

   function nom_champ_numero (F : order_my_box_english) return Gtk_Label is
   begin
   
   Gtk_New (F.Label, "Number or Mail (Phone number is recommanded)");
   return F.Label;

   end nom_champ_numero;

   procedure champ_saisir_numero (F : order_my_box_english) is
   begin

   Gtk_New (F.Entree1);

   end champ_saisir_numero;

   function champ_saisir_numero (F : order_my_box_english) return Gtk_Entry is
   begin

   champ_saisir_numero (F);
   return F.Entree1;

   end champ_saisir_numero;
   
   procedure callback_champ_pays
    (widget : access Gtk_Combo_Box_Text_Record'Class;
    F : order_my_box_english) is
    pragma Unreferenced (widget);

    --P : Unbounded_String;
    begin

    P := To_Unbounded_String (Get_Active_Text (Widget));
    Put_Line (To_String (P));

   end callback_champ_pays;

   function nom_champ_pays (F : order_my_box_english) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Your country");
   return F.Label;

   end nom_champ_pays;

   procedure champ_saisir_pays (F : order_my_box_english) is
   begin

   Gtk_New (F.Combo_box);
   Append_Text (F.Combo_box,"Afghanistan");
   Append_Text (F.Combo_box, "Albania");
   Append_text (F.Combo_box, "Algeria");
   Append_Text (F.Combo_box, "Andorra");
   Append_Text (F.Combo_box, "Angola");
   Append_Text (F.Combo_box, "Antigua and Barbuda");
   Append_Text (F.Combo_box, "Argentina");
   Append_Text (F.Combo_box, "Armenia");
   Append_Text (F.Combo_box, "Australia");
   Append_Text (F.combo_box, "Austria");
   Append_Text (F.Combo_box, "Austrian Empire");
   Append_Text (F.Combo_box, "Azerbaijan");
   Append_Text (F.Combo_box, "Baden");
   Append_Text (F.Combo_box, "Bahamas, The");
   Append_Text (F.Combo_box, "Bahrain");
   Append_Text (F.Combo_box, "Bangladesh");
   Append_Text (F.Combo_box, "Barbados");
   Append_Text (F.Combo_box, "Bavaria");
   Append_Text (F.Combo_box, "Balarus");
   Append_Text (F.Combo_box, "Belgium");
   Append_Text (F.Combo_box, "Belize");
   Append_Text (F.Combo_box, "Benin");
   Append_Text (F.Combo_box, "Bolivia");
   Append_Text (F.combo_box, "Bosnia and Herzegovina");
   Append_Text (F.Combo_box, "Botswana");
   append_Text (F.Combo_box, "Brazil");
   Append_Text (F.Combo_box, "Brunei");
   Append_Text (F.Combo_box, "Brunswick and Lüneburg");
   Append_Text (F.combo_box, "Bulgaria");
   Append_Text (F.Combo_box, "Burkina Faso");
   Append_Text (F.Combo_box, "Burma");
   Append_Text (F.combo_box, "Burundi");
   Append_Text (F.combo_box, "Cabo Verde");
   append_Text (F.Combo_box, "Combodia");
   Append_Text (F.combo_box, "Cameroon");
   Append_Text (F.Combo_box, "Canada");
   Append_Text (F.Combo_box, "Cayman Islands, The");
   Append_Text (F.combo_box, "Central African Republic");
   Append_Text (F.Combo_box, "Central American Federation");
   Append_Text (F.Combo_box, "Chad");
   Append_Text (F.Combo_box, "Chile");
   Append_Text (F.Combo_box, "China");
   Append_Text (F.Combo_box, "Colombia");
   Append_Text (F.Combo_box, "Comoros");
   Append_Text (F.Combo_box, "Congo Free State, The");
   Append_Text (F.Combo_box, "Cook Islands");
   Append_Text (F.Combo_box, "Costa Rica");
   Append_Text (F.Combo_box, "Ivory Coast");
   Append_Text (F.Combo_box, "Croatia");
   Append_Text (F.Combo_box, "Cuba");
   Append_Text (F.combo_box, "Cyprus");
   Append_Text (F.Combo_box, "Czechia");
   Append_Text (F.combo_box, "Czechoslovakia");
   Append_Text (F.combo_box, "Democratic Republic of the Congo");
   Append_Text (F.combo_box, "Denmark");
   Append_Text (F.Combo_box, "Djibou");
   Append_Text (F.Combo_box, "Dominica");
   Append_Text (F.Combo_box, "Dominican Republic");
   Append_Text (F.Combo_box, "Duchy  Of Parma, The");
   Append_Text (F.Combo_box, "East Germany (German Democratic Republic)");
   Append_Text (F.Combo_box, "Ecuador");
   Append_text (F.Combo_box, "Egypt");
   Append_Text (F.Combo_box, "El Salvador");
   Append_Text (F.Combo_box, "Equatorial Guinea");
   Append_Text (F.combo_box, "Eritrea");
   Append_Text (F.combo_box, "Estonia");
   Append_Text (F.Combo_box, "Eswatini");
   Append_Text (F.combo_box, "Ethopia");
   Append_Text (F.Combo_box, "Federal Government of Germany (1848-49)");
   Append_Text (F.Combo_box, "Fiji");
   Append_Text (F.Combo_box, "Finland");
   Append_Text (F.Combo_box, "France");
   Append_Text (F.Combo_box, "Gabon");
   Append_Text (F.Combo_box, "Gambia");
   Append_Text (F.combo_box, "Georgia");
   Append_Text (F.Combo_box, "Germany");
   Append_Text (f.Combo_box, "Ghana");
   Append_Text (F.combo_box, "Grand Duchy of Tuscany, The");
   Append_Text (F.Combo_box, "Greece");
   Append_Text (F.Combo_box, "Grenade");
   Append_Text (F.Combo_box, "Guatemala");
   Append_Text (F.Combo_box, "Guinea");
   Append_Text (F.Combo_box, "Guinea-Bissau");
   Append_Text (F.Combo_box, "Guyanna");
   Append_Text (F.Combo_box, "Haiti");
   Append_text (F.Combo_box, "Hanover");
   Append_Text (F.combo_box, "Hanseatic Republics");
   Append_Text (F.combo_box, "Hawaii");
   Append_Text (F.Combo_box, "Hesse");
   Append_Text (F.Combo_box, "Holy See");
   Append_Text (F.Combo_box, "Honduras");
   Append_Text (F.Combo_box, "Hungray");
   Append_Text (f.Combo_box, "Iceland");
   Append_Text (F.Combo_box, "India");
   Append_Text (F.Combo_box, "Indonesia");
   Append_Text (F.Combo_box, "Iran");
   Append_Text (F.combo_box, "Iraq");
   Append_Text (F.combo_box, "Ireland");
   Append_Text (F.Combo_box, "Israel");
   Append_Text (F.combo_box, "Italy");
   Append_Text (F.combo_box, "Jamaica");
   Append_Text (F.Combo_box, "Japan");
   Append_Text (F.Combo_box, "Jordan");
   Append_Text (F.combo_box, "Kazakhstan");
   Append_Text (F.Combo_box, "Kenya");
   Append_Text (F.Combo_box, "Kingdom of Serbia/Yugoslavia");
   Append_Text (F.combo_box, "Kiribati");
   Append_Text (F.Combo_box, "Korea");
   Append_Text (F.combo_box, "Kosovo");
   Append_Text (F.Combo_box, "Kuwait");
   Append_Text (F.Combo_box, "Kyrgyzstan");
   Append_Text (F.Combo_box, "Laos");
   Append_Text (F.Combo_box, "Latvia");
   Append_Text (F.Combo_box, "Lebanon");
   Append_Text (F.combo_box, "Lesotho");
   Append_Text (F.Combo_box, "Lew Chew (Loochoo)");
   Append_Text (F.Combo_box, "Liberia");
   Append_Text (F.Combo_box, "Libya");
   Append_Text (F.Combo_box, "Liechtenstein");
   Append_Text (F.combo_box, "Lithuania");
   Append_Text (F.Combo_box, "Luxembourg");
   Append_text (F.Combo_box, "Madagascar");
   Append_Text (F.Combo_box, "Malawi");
   Append_Text (F.Combo_box, "Malaysia");
   Append_Text (F.combo_box, "Maldives");
   Append_Text (F.combo_box, "Mali");
   Append_Text (F.Combo_box, "Malta");
   Append_Text (F.combo_box, "Marshall Islands");
   Append_Text (F.Combo_box, "Mauritania");
   Append_Text (F.Combo_box, "Mauritius");
   Append_Text (F.Combo_box, "Mecklenburg-Schwerin");
   Append_Text (F.combo_box, "Mecklenburg-Strelitz");
   Append_Text (F.Combo_box, "Mexico");
   Append_Text (F.Combo_box, "Micronesia");
   Append_Text (F.Combo_box, "Moldova");
   Append_Text (F.combo_box, "Monaco");
   Append_Text (F.combo_box, "Mongolia");
   Append_Text (f.Combo_box, "Montenegro");
   Append_Text (F.Combo_box, "Morocco");
   Append_Text (F.combo_box, "Mozambique");
   Append_Text (F.Combo_box, "Namibia");
   Append_Text (F.Combo_box, "Nassau");
   Append_Text (F.Combo_box, "Nauru");
   Append_Text (F.combo_box, "Nepal");
   Append_Text (F.combo_box, "Netherlands, The");
   Append_Text (F.Combo_box, "New Zealand");
   Append_Text (F.Combo_box, "Nicaragua");
   Append_Text (F.combo_box, "Niger");
   Append_Text (F.Combo_box, "Nigeria");
   Append_Text (F.Combo_box, "Niue");
   Append_Text (F.combo_box, "North German Confederation");
   Append_Text (F.combo_box, "North German Union");
   Append_Text (F.Combo_box, "North Macedonia");
   Append_Text (F.Combo_box, "Norway");
   Append_Text (F.combo_box, "Oldenburg");
   Append_Text (F.Combo_box, "Oman");
   Append_Text (F.Combo_box, "Orange Free State");
   Append_Text (F.combo_box, "Pakistan");
   Append_Text (F.Combo_box, "Palau");
   Append_Text (F.Combo_box, "Panama");
   Append_Text (F.Combo_box, "Papal States");
   Append_Text (F.combo_box, "Papua New Guinea");
   Append_Text (F.Combo_box, "Papua New Guinea");
   Append_Text (F.combo_box, "Paraguay");
   Append_Text (F.Combo_box, "Peru");
   Append_Text (F.Combo_box, "Philipppines");
   Append_Text (F.combo_box, "Piedmont-Sardinia");
   Append_text (F.Combo_box, "Poland");
   Append_Text (F.Combo_box, "Portugal");
   Append_Text (F.Combo_box, "Qatar");
   Append_Text (F.combo_box, "Republic of Genoa");
   Append_Text (F.Combo_box, "Republic of Korea (South Korea)");
   Append_Text (F.combo_box, "Republic of the Congo");
   Append_Text (F.Combo_box, "Romania");
   Append_Text (F.Combo_box, "Russia");
   Append_Text (F.combo_box, "Rwanda");
   Append_Text (F.combo_box, "Saint Kitts and Nevis");
   Append_Text (F.combo_box, "Saint Lucia");
   Append_Text (F.Combo_box, "Saint Vincent and the Grenadines");
   Append_Text (F.Combo_box, "Samoa");
   Append_Text (F.Combo_box, "San Madrino");
   Append_Text (F.Combo_box, "Sao Tome and Principe");
   Append_Text (F.Combo_box, "Saudi Arabia");
   Append_Text (F.Combo_box, "Schaumburg-Lippe");
   Append_Text (F.Combo_box, "Senegal");
   Append_Text (F.Combo_box, "Serbia");
   Append_Text (F.Combo_box, "Seychelles");
   Append_Text (F.Combo_box, "Sierra Leone");
   Append_Text (F.Combo_box, "Singapore");
   Append_Text (F.Combo_box, "Slovakia");
   Append_Text (F.Combo_box, "Slovenia");
   Append_Text (F.Combo_box, "Solomon Islands, The");
   Append_Text (F.Combo_box, "Somalie");
   Append_Text (F.Combo_box, "South Africa");
   Append_Text (F.Combo_box, "South Sudan");
   Append_Text (F.Combo_box, "Spain");
   Append_Text (F.Combo_box, "Sri Lanka");
   Append_Text (F.Combo_box, "Sudan");
   Append_Text (f.combo_box, "Suriname");
   Append_Text (F.Combo_box, "Sweden");
   Append_Text (F.Combo_box, "Switzerland");
   Append_Text (F.Combo_box, "Syria");
   Append_Text (F.Combo_box, "Tajikistan");
   Append_Text (F.Combo_box, "Tanzania");
   Append_Text (F.Combo_box, "Texas");
   Append_Text (F.Combo_box, "Thailand");
   Append_Text (F.Combo_box, "Timor-Leste");
   Append_Text (F.Combo_box, "Togo");
   Append_Text (F.Combo_box, "Tonga");
   Append_Text (F.Combo_box, "Trinidad and Tobago");
   Append_Text (F.combo_box, "Tunisia");
   Append_Text (F.Combo_box, "Turkey");
   Append_Text (F.combo_box, "Turkmenistan");
   Append_Text (F.Combo_box, "Tuvalu");
   Append_Text (F.combo_box, "Two Sicilies");
   Append_Text (F.Combo_box, "Uganda");
   Append_Text (F.Combo_box, "Ukraine");
   Append_text (F.Combo_box, "Union of Soviet Socialist Republics");
   Append_Text (F.Combo_box, "United Kingdom, The");
   Append_Text (F.Combo_box, "Uruguay");
   Append_Text (F.Combo_box, "Uzbekistan");
   Append_Text (F.Combo_box, "Vanuatu");
   Append_Text (F.Combo_box, "Venezuela");
   Append_Text (F.Combo_box, "Vietnam");
   Append_Text (F.Combo_box, "Württemberg");
   Append_Text (F.Combo_box, "Yemen");
   Append_text (F.Combo_box, "Zambia");
   Append_Text (F.combo_box, "Zimbabwe");

   Connect (F.Combo_box, Signal_Changed, callback_champ_pays'Access, F);

   end champ_saisir_pays;

   function champ_saisir_pays (F : order_my_box_english) return Gtk_Combo_Box_Text is
   begin
   
   champ_saisir_pays (F);
   return F.Combo_box;

   end champ_saisir_pays;

   function nom_champ_ville (F : order_my_box_english) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Name your province");
   return F.Label;

   end nom_champ_ville;

   procedure champ_saisir_ville (F : order_my_box_english) is
   begin

   Gtk_New (F.Entree2);

   end champ_saisir_ville;

   function champ_saisir_ville (F : order_my_box_english) return Gtk_Entry is
   begin

   champ_saisir_ville (F);
   return F.Entree2;

   end champ_saisir_ville;

   function nom_champ_quartier (F : order_my_box_english) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Name your town");
   return F.Label;

   end nom_champ_quartier;

   procedure champ_saisir_quartier (F : order_my_box_english) is
   begin

   Gtk_New (F.Entree3);

   end champ_saisir_quartier;

   function champ_saisir_quartier (F : order_my_box_english) return Gtk_Entry is
   begin

   champ_saisir_quartier (F);
   return F.Entree3;

   end champ_saisir_quartier;

   function nom_champ_adresse (F : order_my_box_english) return Gtk_Label is
   begin

   Gtk_New (F.Label, "Name your street");
   return F.Label;

   end nom_champ_adresse;

   procedure champ_saisir_adresse (F : order_my_box_english) is
   begin

   Gtk_New (F.Entree4);

   end champ_saisir_adresse;

   function champ_saisir_adresse (F : order_my_box_english) return Gtk_Entry is
   begin

   champ_saisir_adresse (F);
   return F.Entree4;

   end champ_saisir_adresse;

   procedure callback_suivant
    (widget : access Gtk_Widget_Record'Class;
    F : order_my_box_english) is

    type Pointeur is access String;
   
    message : constant string := "i want order a box";
    message_recu : Pointeur;
    Check : integer := 0;
    F_network : dialogue_boite;

    P0, P1, P2, P3, P4 : Pointeur;
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
          Message => "An error occurred during your subscription request. Please try again later.");
         F_network.Msg.Show_All;
      end if;

   end callback_suivant;

   procedure bouton_suivant (F : order_my_box_english) is

   Pixbuf, Pixbuf2 : Gdk_Pixbuf;
   Erreur : GError;

   begin

   Gtk_New (F.Button, "Next");
   Pu.Connect (F.Button, Signal_Clicked, callback_suivant'Access, F);

   -- Gdk_New_From_File (Pixbuf, "angle-droit.png", Erreur);
   -- Pixbuf2 := Scale_Simple (Pixbuf, 20, 20);
   -- Gtk_New (F.logo, Pixbuf2);
   -- Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

   end bouton_suivant;

   function bouton_suivant (F : order_my_box_english) return Gtk_Button is
   begin
   
   bouton_suivant (F);
   return F.Button;

   end bouton_suivant;

   procedure open_window (F : order_my_box_english) is
   begin

     F.Win.Show_All;

   end open_window;

   procedure bouton_retour (F : order_my_box_english) is

   Pixbuf, Pixbuf2 : Gdk_Pixbuf;
   Erreur : GError;
   
   begin

   Gtk_New (F.Button, "Back");
   Connect (F.Button, Signal_Clicked, fermer_fenetre'Access);

   -- Gdk_New_From_File (Pixbuf, "angle-gauche.png", Erreur);
   -- Pixbuf2 := Scale_Simple (Pixbuf, 20, 20);
   -- Gtk_New (F.logo, Pixbuf2);
   -- Set_Image (F.Button, F.logo);
    Set_Relief (F.Button, Relief_None);
    Set_Always_Show_Image (F.Button, True);

   end bouton_retour;

   function bouton_retour (F : order_my_box_english) return Gtk_Button is
   begin

      bouton_retour (F);
      return F.Button;

    end bouton_retour;

   procedure create_window (F : order_my_box_english) is
    
    Pixbuf, Pixbuf2 : Gdk_Pixbuf;
    Erreur : GError;
   begin

   Gtk_New (F.Win);
   F.Win.Fullscreen;
   Connect (F.Win, Signal_Destroy, fermer_fenetre'access);
   style_fenetre (F);
   --Add_Provider_For_Screen (Get_Default,
   --+F.Provider, Gtk.Style_Provider.Priority_Application);
   Gtk_New (F.Srolled_Bar);
   Set_Policy (F.Srolled_Bar,Policy_Always,Policy_Always);
   Gtk_New (F.Box);
   Set_Row_Spacing (F.Box, 50);
   F.Srolled_Bar.Add (F.Box);
   F.Win.Add (F.Srolled_Bar);
   Gtk_New (F.Label, "order a internet box");
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

   end create_window;
end ma_fenetre.ma_boite.order_box.anglais;