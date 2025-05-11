with Gtk.Scrolled_Window;  use Gtk.Scrolled_Window;
with Gtk.Image;            use Gtk.Image;
with Glib.Error;           use Glib.Error;
with Gtk.Grid;             use Gtk.Grid;

package ma_fenetre.paiement_mode is

  type mode_paiement_record is new fenetre_lespace_record with private;
  type mode_paiement is access all mode_paiement_record'class;

  procedure creer_fenetre (F : mode_paiement);
  procedure ouvrir_fenetre (F : mode_paiement);

  --  Les modes de paiements

  
  private

  type mode_paiement_record is new fenetre_lespace_record with record
    
    Srollbar : Gtk_Scrolled_Window;
    Img : Gtk_Image;
    Container : Gtk_Grid;
  end record;

  --  Les boutons de paiements

procedure creer_bouton_airtel
 (airtel : access mode_paiement_record'Class);
function bouton_airtel
 (airtel : access mode_paiement_record'class) return Gtk_Button;

procedure creer_bouton_mobicash
 (mobicash : access mode_paiement_record'Class);
function bouton_mobicash
 (mobicash : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_paypal
 (paypal : access mode_paiement_record'Class);
function bouton_paypal
 (paypal : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_virement_bancaire
 (bank : access mode_paiement_record'Class);
function bouton_virement_bancaire
 (bank : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_carte_visa
 (visa : access mode_paiement_record'Class);
function bouton_carte_visa
 (visa : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_paysera
 (paysera : access mode_paiement_record'class);
function bouton_paysera
 (paysera : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_mastercard
 (mastercard : access mode_paiement_record'Class);
function bouton_mastercard
 (mastercard : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_skrill
 (skrill : access mode_paiement_record'Class);
function bouton_skrill
 (skrill : access mode_paiement_record'Class) return Gtk_Button;

procedure creer_bouton_payza
 (payza : access mode_paiement_record'Class);
function bouton_payza
 (payza : access mode_paiement_record'Class) return Gtk_Button;

procedure callback_paypal
 (widget : access Gtk_Widget_Record'Class);

procedure callback_payza
 (widget : access Gtk_Widget_Record'Class);

procedure callback_skrill
 (widget : access Gtk_Widget_Record'Class);

procedure callback_airtel_money
 (widget : access Gtk_Widget_Record'Class);

procedure callback_mastercard
 (widget : access Gtk_Widget_Record'Class);

procedure callback_carte_visa
 (widget : access Gtk_Widget_Record'Class);

procedure callback_virement_bancaire
 (widget : access Gtk_Widget_Record'Class);

procedure callback_paysera
 (widget : access Gtk_Widget_Record'Class);

procedure callback_mobi_cash
 (widget : access Gtk_Widget_Record'Class);

end ma_fenetre.paiement_mode;