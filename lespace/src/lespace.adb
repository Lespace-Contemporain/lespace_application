pragma Ada_2022;

with Gtk.Main;    use Gtk.Main;
with ma_fenetre;  use ma_fenetre;

procedure lespace is

F : fenetre_lespace;

begin
Gtk.Main.Init;

F := new fenetre_lespace_record;

creer_fenetre (F);
ouvrir_fenetre (F);

Gtk.Main.Main;
end lespace;