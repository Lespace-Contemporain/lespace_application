with Gtk.Adjustment;          use Gtk.Adjustment;
with Gtk.Style_Provider;      use Gtk.Style_Provider;
with Gtk.Button;              use Gtk.Button;
with Gtk.Label;               use Gtk.Label;
with Gdk.Pixbuf;              use Gdk.Pixbuf;

package body ma_fenetre.paiement_mode is

      procedure creer_conteneur (F : mode_paiement) is
      begin

        Gtk_New (F.Container);
        F.Container.Set_Row_Spacing (3);
        F.Container.Set_column_Spacing (10);
      
      end creer_conteneur;

      procedure creer_bouton_airtel
       (airtel : access mode_paiement_record'Class) is

       Pixbuf, Pixbuf2 : Gdk_Pixbuf;
       Erreur : GError;
       begin

      Gtk_New (airtel.Button);
      Gdk_New_From_File (Pixbuf2, "Airtel-Money.jpeg", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (airtel.Img, Pixbuf);
      Set_Image (airtel.Button, airtel.Img);
      Set_Always_Show_Image (airtel.Button, True);

      end creer_bouton_airtel;

      function bouton_airtel
       (airtel : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_airtel (airtel);

       return airtel.Button;
       end bouton_airtel;

       procedure creer_bouton_paypal
        (paypal : access mode_paiement_record'Class) is 
        
        Pixbuf, Pixbuf2 : Gdk_Pixbuf;
        Erreur : GError;

        begin

      Gtk_New (paypal.Button);
      Gdk_New_From_File (Pixbuf2, "paypal.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,170,100);
      Gtk_New (paypal.Img, Pixbuf);
      Set_Image (paypal.Button, paypal.Img);
      Set_Always_Show_Image (paypal.Button, True);

      end creer_bouton_paypal;

      function bouton_paypal
       (paypal : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_paypal (paypal);

       return paypal.Button;
      end bouton_paypal;

       procedure creer_bouton_paysera
        (paysera : access mode_paiement_record'Class) is

        Pixbuf, Pixbuf2 : Gdk_Pixbuf;
        Erreur : GError;

        begin

      Gtk_New (paysera.Button);
      Gdk_New_From_File (Pixbuf2, "paysera.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (paysera.Img, Pixbuf);
      Set_Image (paysera.Button, paysera.Img);
      Set_Always_Show_Image (paysera.Button, True);

      end creer_bouton_paysera;

      function bouton_paysera
       (paysera : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_paysera (paysera);

       return paysera.Button;
      end bouton_paysera;

      procedure creer_bouton_skrill
       (skrill : access mode_paiement_record'Class) is
      
      Pixbuf, Pixbuf2 : Gdk_Pixbuf;
      Erreur : GError;

      begin

      Gtk_New (skrill.Button);
      Gdk_New_From_File (Pixbuf2, "Skrill.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (skrill.Img, Pixbuf);
      Set_Image (skrill.Button, skrill.Img);
      Set_Always_Show_Image (skrill.Button, True);

      end creer_bouton_skrill;

      function bouton_skrill
       (skrill : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_skrill (skrill);

       return skrill.Button;
      end bouton_skrill;

      procedure creer_bouton_carte_visa
       (visa : access mode_paiement_record'Class) is

      Pixbuf, Pixbuf2 : Gdk_Pixbuf;
      Erreur : GError;

      begin

      Gtk_New (visa.Button);
      Gdk_New_From_File (Pixbuf2, "Visa New 2021.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (visa.Img, Pixbuf);
      Set_Image (visa.Button, visa.Img);
      Set_Always_Show_Image (visa.Button, True);

      end creer_bouton_carte_visa;

      function bouton_carte_visa
       (visa : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_carte_visa (visa);

       return visa.Button;
      end bouton_carte_visa;

      procedure creer_bouton_mastercard
       (mastercard : access mode_paiement_record'Class) is

      Pixbuf, Pixbuf2 : Gdk_Pixbuf;
      Erreur : GError;

      begin

      Gtk_New (mastercard.Button);
      Gdk_New_From_File (Pixbuf2, "mastercard.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (mastercard.Img, Pixbuf);
      Set_Image (mastercard.Button, mastercard.Img);
      Set_Always_Show_Image (mastercard.Button, True);

      end creer_bouton_mastercard;

      function bouton_mastercard
       (mastercard : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_mastercard (mastercard);

       return mastercard.Button;
      end bouton_mastercard;

      procedure creer_bouton_mobicash
       (mobicash : access mode_paiement_record'Class) is
      begin
      null;
      end creer_bouton_mobicash;

      function bouton_mobicash
       (mobicash : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_mobicash (mobicash);

       return mobicash.Button;
      end bouton_mobicash;

      procedure creer_bouton_payza
       (payza : access mode_paiement_record'Class) is

      Pixbuf, Pixbuf2 : Gdk_Pixbuf;
      Erreur : GError;

      begin

      Gtk_New (payza.Button);
      Gdk_New_From_File (Pixbuf2, "payza.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (payza.Img, Pixbuf);
      Set_Image (payza.Button, payza.Img);
      Set_Always_Show_Image (payza.Button, True);

      end creer_bouton_payza;

      function bouton_payza
       (payza : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_payza (payza);

       return payza.Button;
      end bouton_payza;

      procedure creer_bouton_virement_bancaire
       (bank : access mode_paiement_record'Class) is

      Pixbuf, Pixbuf2 : Gdk_Pixbuf;
      Erreur : GError;

      begin
      Gtk_New (bank.Button);
      Gdk_New_From_File (Pixbuf2, "virement-bancaire.png", Erreur);
      Pixbuf := Scale_Simple (Pixbuf2,190,100);
      Gtk_New (bank.Img, Pixbuf);
      Set_Image (bank.Button, bank.Img);
      Set_Always_Show_Image (bank.Button, True);

      end creer_bouton_virement_bancaire;

      function bouton_virement_bancaire
       (bank : access mode_paiement_record'Class) return Gtk_Button is
       begin

       creer_bouton_virement_bancaire (bank);

       return bank.Button;
      end bouton_virement_bancaire;

      procedure creer_fenetre (F : mode_paiement) is

        Ajuste : Gtk_Adjustment;
        Label : Gtk_Label;
        Pixbuf, Pixbuf2 : Gdk_Pixbuf;
        Erreur : GError;
      begin

      Gtk_New (F.Win);
      F.Win.Fullscreen;
      Connect (F.Win, Signal_Destroy, fermer_fenetre'access);
      Gtk_New (F.Container);
      style_fenetre (F);
      Add_Provider_For_Screen (Get_Default,
      +F.Provider, Gtk.Style_Provider.Priority_Application);
      creer_Conteneur (F);
      F.Win.Add (F.Container);

      F.Container.Attach (logo_lespace (F), 0, 0);

      Gtk_New (Label, "Paiement par :");
      F.Container.Attach (Label, 0,10);

      F.Container.Attach (bouton_skrill (F),0,100);
      F.Container.Attach (bouton_virement_bancaire (F),10,100);
      F.Container.Attach (bouton_carte_visa (F),20,100);
      F.Container.Attach (bouton_paypal (F),30,100);
      F.Container.Attach (bouton_paysera (F),40,100);
      F.Container.Attach (bouton_payza (F),0,110);
      F.Container.Attach (bouton_mastercard (F),10,110);
      F.Container.Attach (bouton_airtel (F),20,110);
      
      end creer_fenetre;

      procedure ouvrir_fenetre (F : mode_paiement) is
      begin

      F.Win.Show_All;
      end ouvrir_fenetre;

      procedure callback_paypal
      (Widget : access Gtk_Widget_record'Class) is
      begin
      null;
      end callback_paypal;

      procedure callback_payza
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_payza;

      procedure callback_skrill
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_skrill;

      procedure callback_airtel_money
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_airtel_money;

      procedure callback_mastercard
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_mastercard;

      procedure callback_carte_visa
      (widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_carte_visa;

      procedure callback_virement_bancaire
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_virement_bancaire;

      procedure callback_paysera
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_paysera;

      procedure callback_mobi_cash
      (Widget : access Gtk_Widget_Record'Class) is
      begin
      null;
      end callback_mobi_cash;
end ma_fenetre.paiement_mode;