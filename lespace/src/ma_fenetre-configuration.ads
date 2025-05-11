with Gtk.GEntry;             use Gtk.GEntry;
with Gtk.Grid;               use Gtk.Grid;
with Gtk.Label;              use Gtk.Label;


package ma_fenetre.configuration is 

type ma_configuration_record is new fenetre_lespace_record with private;
type ma_configuration is access all ma_configuration_record'class;

procedure creer_fenetre (F : ma_configuration);
procedure ouvrir_fenetre (F : ma_configuration);

private

type ma_configuration_record is new fenetre_lespace_record with record 

Entree : Gtk_Entry;
label : Gtk_Label;
Grid : Gtk_Grid;

end record;

end ma_fenetre.configuration;