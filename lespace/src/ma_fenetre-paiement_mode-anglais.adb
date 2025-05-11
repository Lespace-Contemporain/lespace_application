with Gtk.Adjustment;      use Gtk.Adjustment;
with Gtk.Style_Provider;  use Gtk.Style_Provider;
with Gtk.Label;           use Gtk.Label;
with Gdk.Pixbuf;          use Gdk.Pixbuf;

package body ma_fenetre.paiement_mode.anglais is

      procedure create_window (F : mode_paiement_anglais) is

        Ajuste : Gtk_Adjustment;
        Label : Gtk_Label;
        Pixbuf, Pixbuf2 : Gdk_Pixbuf;
        Erreur : GError;
      begin

      Gtk_New (F.Win);
      F.Win.Fullscreen;
      Connect (F.Win, Signal_Destroy, fermer_fenetre'access);
      Gtk_New (F.Container);
      Set_Row_Spacing (F.Container, 3);
      Set_Column_Spacing (F.Container,10);
      F.Win.Add (F.Container);

      style_fenetre (F);
      Add_Provider_For_Screen (Get_Default,
      +F.Provider, Gtk.Style_Provider.Priority_Application);

      F.Container.Attach (logo_lespace (F), 0, 0);

      Gtk_New (Label, "Payment by :");
      F.Container.Attach (Label, 0,10);

      F.Container.Attach (bouton_skrill (F),0,100);
      F.Container.Attach (bouton_virement_bancaire (F),10,100);
      F.Container.Attach (bouton_carte_visa (F),20,100);
      F.Container.Attach (bouton_paypal (F),30,100);
      F.Container.Attach (bouton_paysera (F),40,100);
      F.Container.Attach (bouton_payza (F),0,110);
      F.Container.Attach (bouton_mastercard (F),10,110);
      F.Container.Attach (bouton_airtel (F),20,110);

      end create_window;

      procedure open_window (F : mode_paiement_anglais) is
      begin

      F.Win.Show_All;

      end open_window;
end ma_fenetre.paiement_mode.anglais;