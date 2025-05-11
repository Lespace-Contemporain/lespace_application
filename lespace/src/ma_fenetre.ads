--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 30 septembre 09 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principale du logiciel.

with Glib;                   use Glib;
with Gtk.Css_Provider;       use Gtk.Css_Provider;
with Gtk.Application;        use Gtk.Application;
with Gtk.Header_Bar;         use Gtk.Header_Bar;
with Gtk.Style_Context;      use Gtk.Style_Context;
with Gtk.Link_Button;        use Gtk.Link_Button;
with Gtk.Alignment;          use Gtk.Alignment;
with reseaux;                use reseaux;
with Gtk.Widget;             use Gtk.Widget;
with Gdk.Pixbuf;             use Gdk.Pixbuf;
with Gtk.Image;              use Gtk.Image;
with Gtk.Window;             use Gtk.Window;
with Gdk.Display;            use Gdk.Display;
with langues_monde;          use langues_monde;
with Gdk.Screen;             use Gdk.Screen;
with Gtk.Button;             use Gtk.Button;
with Gtk.Table;              use Gtk.Table;
with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;
with Gtk.Handlers;

package ma_fenetre is

   type abstrait_type is abstract tagged null record;
   type fenetre_lespace_record is new abstrait_type with private;
   type fenetre_lespace is access all fenetre_lespace_record'class;
   type langue_fenetre is (english, francais);

   type Alignements is array (Positive range <>) of Gtk_Alignment;

   procedure creer_fenetre (Object : out fenetre_lespace);
   --  Permet d'initialiser la fenetre principale.
   --  Le parametre "Object" est un type fenetre_lespace.
   
   procedure ouvrir_fenetre (F : fenetre_lespace);
   --  Permet d'ouvrir la fenetre.
   --  Le parametre "F" est un type fenetre_lespace.
   
   function fenetre_est_ouverte (F : fenetre_lespace) return Boolean;
   --  Cette fonction renvoie "True" si la fenetre est ouverte.
   --  Le parametre "F" est un type fenetre_lespace.
   
   procedure fermer_fenetre (F : access Gtk_Widget_Record'Class);
   --  Permet de fermer la fenetre.
   --  Le parametre "F" est un type fenetre_lespace.
   
   function language_fenetre
    (F : access fenetre_lespace_record'Class) return langue_parlee;
   --  Cette fonction renvoie le nom de langue utiliser dans la fenetre.
   --  Le parametre "F" est un  type fenetre_lespace
   
   procedure Ajouter_a_la_fenetre
    (F : fenetre_lespace; Item : not null access Gtk_Widget_Record'Class);
   --  Permet d'ajouter un nouveau widget a la fenetre.
   --  Le parametre "F" est un type fenetre_lespace.
   --  Le parametre "Item" est le nouveau widget que l'on ajoute.
      
      procedure ajouter_une_image
       (F : not null access fenetre_lespace_record'Class;
       Img_Name : String;
       Img_Width : Gint;
       Img_Height : Gint);
      -- permet d'ajouter des images, icons ... a la fenetre.
      -- "Img_Name" esl le nom du fichier image de l'on ajoute (avec extension).
      -- "img_width" est un type Glib.Gint.
      -- "img_height" est un type Glib.Gint.
      
      function image_ajouter
       (F : not null access fenetre_lespace_record'Class) return Gdk_Pixbuf;
      --  renvoie l'image ajouter avec la methode "ajouter_une_image".

private

   package P_Callback is new Gtk.Handlers.Callback (Gtk_Widget_Record);
   use P_Callback;

   package U_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, Gtk_Window);
   use U_Callback;

   package U2_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, fenetre_lespace);
   use U2_Callback;

   type Data is record

    Message : Unbounded_String;
    Langue : Language_Utilisateur;

   end record;

   type fenetre_lespace_record is new abstrait_type with record

    Win : Gtk_Window;
    Button : Gtk_Button;
    Button2 : Gtk_Button;
    logo : Gtk_Image;
    Provider : Gtk_Css_Provider;
    Display : Gdk_Display;
    Screen : Gdk_Screen;
    Context : Gtk_Style_Context;
    Link_button : Gtk_Link_Button;
    net : network;
    D1 : Data;
    Table : Gtk_Table;
    Header : Gtk_Header_Bar;
    Align : Alignements (1 .. 7);
    Image : Gdk_Pixbuf;
    Image2 : Gdk_Pixbuf;

   end record;

      procedure bouton_commander_une_boite (F : fenetre_lespace);
      --  Cette methode permet de creer le bouton "commander une boite".
      --  le parametre "F" est un type fenetre_lespace.
      
      function bouton_commander_une_boite
       (F : fenetre_lespace) return Gtk_Button;
      --  renvoie le bouton "commander une boite".
      --  le parametre "F" est un type fenetre_lespace.
      
      procedure callback_commander_boite
       (widget : access Gtk_Widget_Record'Class;
       F : fenetre_lespace);
       --  Permet de connecter le bouton "commander une boite" a un
       --  evenement qui lui permet de se connecter a un reseau quelconque
       --  ou Lespace Contemporain pour effectuer une commande de la boite.
       
      procedure bouton_nouvel_abonnement (F : fenetre_lespace);
      --  Permet de creer le bouton "nouvel abonnement".
      --  le parametre "F" est un type fenetre_lespace.
      
      function bouton_nouvel_abonnement
       (F : fenetre_lespace) return Gtk_Button;
      --  renvoie le bouton "nouvel abonnement".
      --  le parametre "F" est un type fenetre_lespace.
      
      procedure callback_nouvel_abonnement
       (widget : access Gtk_Widget_Record'Class;
       F : fenetre_lespace);
      --  Permet de connecter le bouton "nouvel abonnement" a un evenement
      --  lui permettant d'effectuer une demande de (re)abonnement au
      --  service Lespace Contemporain.
      
      procedure bouton_lien_contactez_nous (F : fenetre_lespace);
      --  permet de creer le bouton lien "contactez-nous".
      --  le parametre "F" est un type fenetre_lespace.
      
      function bouton_lien_contactez_nous
       (F : fenetre_lespace) return Gtk_Button;
      --  renvoie le bouton lien "contactez-nous".
      --  le parametre "F" est un type fenetre_lespace.
      
      procedure callback_lien_contactez_Nous
       (widget : access Gtk_Widget_Record'Class);
       -- Permet de connecter le bouton lien "Contactez-nous" a
       -- un evenement lui permettant d'acceder a la page pour contacter
       -- le service client Lespace Contemporain.
       
      procedure bouton_connexion (F : fenetre_lespace);
      --  Permet de creer le bouton "Connexion".
      --  le parametre "F" est un type fenetre_lespace.
      
      function bouton_connexion (F : fenetre_lespace) return Gtk_Button;
      --  renvoie le bouton "Connexion".
      --  le parametre "F" est un type fenetre_lespace.
      
      procedure callback_bouton_connexion
       (widget : access Gtk_Widget_Record'Class);
      --  Permet de connecter le bouton "Connexion" a un
      --  evenement qui va connecter l'appareil de l'utilisateur
      --  au reseau Lespace Contemporain.
      
      procedure bouton_lien_english (F : fenetre_lespace);
      --  Permet de creer le bouton lien "English".
      --  le parametre "F" est un type fenetre_lespace.
      
      function bouton_lien_english (F : fenetre_lespace) return Gtk_Button;
      --  renvoie le bouton english.
      --  Le parametre "F" est un type fenetre_lespace.
      
      procedure callback_lien_english
       (widget : access Gtk_Widget_Record'Class);
      --  Permet de connecter le bouton lien "English" a
      --  un evenement lui permettant de changer la langue de la fenetre
      --  en langue anglaise.
      
      procedure callback_bouton_ma_boite
      (Widget : access Gtk_Widget_Record'Class);
      --  Permet de connecter le bouton "ma boite" a un evenement
      --  qui va lui permettre d'aller dans les configurations
      --  de sa boite.
      
      procedure logo_lespace
       (F : access fenetre_lespace_record'Class);
      --  Permet d'ajouter un logode lespace
      --  Le parametre "F" est un type fenetre_lespace.
      
      function logo_lespace
       (F : access fenetre_lespace_record'Class) return Gtk_Image;
      --  renvoie le logo de lespace.
      --  Le parametre "F" est un type fenetre_lespace.
      
      procedure style_fenetre
       (F : not null access fenetre_lespace_record'class);
      --  permet d'ajouter du style css a la fenetre et au differentes partie.
      --  Le parametre "F" est un type pointeur sur fenetre_lespace_record.
      
      procedure bouton_ma_boite (F : fenetre_lespace);
      --  Permet de creer le bouton ma boite
      --  Le parametre "F" est un type fenetre_lespace.
      
      function bouton_ma_boite (F : fenetre_lespace) return Gtk_Button;
      --  renvoie le bouton ma boite.
      --  "F" est un type fenetre_lespace.
      
      function container
       (F : not null access fenetre_lespace_record'Class) return Gtk_Table;
      -- renvoie le conteneur et ses elements.

      Nom_bouton_ma_boite : constant String := "Ma boite";
      Nom_bouton_lien_contactez_nous : constant String := "Contactez-nous";
      Nom_bouton_lien_english : constant String := "English";
      Nom_bouton_connexion : constant String := "Connectez-vous";
      Nom_bouton_commander_boite : constant String := "Commander une boite";
      Nom_bouton_nouvel_abonnement : constant String := "Nouvel abonnement";
      Langues : language_utilisateur;

end ma_fenetre;