--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 07 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.

pragma Ada_2022;

with Gtk.GEntry;            use Gtk.GEntry;
with Gtk.Label;             use Gtk.Label;
with Gtk.Entry_Buffer;      use Gtk.Entry_Buffer;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package ma_fenetre.ma_boite is

   type fenetre_ma_boite_record is new fenetre_lespace_record with private;
   type fenetre_ma_boite is access all fenetre_ma_boite_record'class;
   type Pointeur is access String;
   type numero_id_boite is new Integer;

   procedure creer_fenetre (F : fenetre_ma_boite);

private
   
   package P2_Callback is new Gtk.Handlers.User_Callback (Gtk_Widget_Record, fenetre_ma_boite);
   use P2_Callback;

   type Data is record

    Id : Pointeur;
    Passwd : Pointeur;
    Message : String (1..27);
    Langue : language_utilisateur;

   end record;

   type fenetre_ma_boite_record is new fenetre_lespace_record with record

    Entree,Entree1, Entree2 : Gtk_Entry;
    buffer : Gtk_Entry_Buffer;
    Label : Gtk_Label;
    D : Data;

   end record;

   procedure creer_entree1 (F : fenetre_ma_boite);
   function entree1 (F : fenetre_ma_boite) return Gtk_Entry;

   function saisi_entree1 (F : fenetre_ma_boite) return String;
   function Numero_Id (F : fenetre_ma_boite) return Gtk_Label;

   procedure creer_entree2 (F : fenetre_ma_boite);
   function saisi_entree2 (F : fenetre_ma_boite) return String;
   
   function entree2 (F : fenetre_ma_boite) return Gtk_Entry;
   function Mdp (F : fenetre_ma_boite) return Gtk_Label;

   procedure callback_connexion
    (widget : access Gtk_Widget_Record'Class);

   Numero : Unbounded_String;

end ma_fenetre.ma_boite;