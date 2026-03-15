pragma Ada_2022;

-------------------------------------------------------------------------------------
--                                                                                  -
--                   LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT                      -
--                                                                                  -
--    Ecrit par : Zokoualoumba Moussounda Emmanuel Dimitri                          -
--                                                                                  -
--    Ce package permet la creation d'un socket client pour l'envoi et la reception -
--    des donnees echangees entre le logiciel et le serveur du logiciel.            -
--                                                                                  -
--    NOTE : La communication entre le logiciel et son serveur s'effectue via TCP   -
--                                                                                  -
-------------------------------------------------------------------------------------

with GNAT.Sockets;  use GNAT.Sockets;
with Ada.Streams;   use Ada.Streams;
with Gtk.Window;    use Gtk.Window;
with Gtk.Button;    use Gtk.Button;
with Gtk.Label;     use Gtk.Label;
with Gtk.Widget;    use Gtk.Widget;
with Gtk.GEntry;    use Gtk.GEntry;
with Gtk.Box;       use Gtk.Box;
with Gtk.Enums;     use Gtk.Enums;
with System;
with Gtk.Handlers;
with Ada.Unchecked_Deallocation;

package reseaux is


type network_t is record

Socket : Socket_Type;
Address : Sock_Addr_Type;
Channel : Stream_Access;

end record;

type window_network_record is private;
type Window_network_t is access all window_network_record;

Sock : network_t;

--    Cette fonction sert pour la creation du socket. Ce socket est du type TCP protocol.
--    Parametre "Net" est un type network_t
procedure creation_reseau (net : in out network_t);

--    Cette fonction permet d'ouvrir le socket cree a partir de la fonction "creation_reseau".
--    Cette ouverture lance une connexion avec le serveur du logiciel, avant d'etablir une
--    communication. please, appelez cette fonction apres avoir cree le socket.
--    Parametre "Net" est un type network_t
procedure ouverture_reseau (net : out network_t);

--    Cette fonction envoi les donnees au reseau. Elle appelle tout simplement la fonction "send".
--    Parametre "net" est un type network_t.
--    Parametre "data" est la donnee a envoyer.
procedure envoyer_donnees_reseau (net : network_t; data : access System.Address);

--    Cette fonction recoit les donnees du reseau. Elle appelle tout simplement la fonction "recv".
--    Parametre "net" est un type network_t.
--    Parametre "data" est la donnee recue.
procedure recevoir_donnees_reseau (net : network_t; data : out Gtk_Window);

--    Cette fonction permet la fermeture du socket.
--    N.B : Cette fonction doit-etre appelee apres que le socket fut cree et
--    la connexion avec le serveur soit etablie.
procedure fermeture_reseau (net : network_t);

--------------------------------------------
--    Network Window Creation Functions   --
--------------------------------------------

--   These function allows to initialize and create one GTK_Window which display
--   the server messages. These Window is temporary.
--   "Window" parameter is Window_Network_t type.
--   "message_from_server" parameter is the message to display to the Window.

procedure space_fenetre_reseau_one
 (net : network_t; Window : Window_network_t; Message_from_server : String);


private

   type string_access is access String;
   procedure free is new Ada.Unchecked_Deallocation(String, String_access);

   package P_Callback is new Gtk.Handlers.Callback (Gtk_Widget_Record);
   use P_Callback;

   package U2_Callback is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, window_network_t);
   use U2_Callback;


   type window_network_record is record

      Win : GTK_Window;
      Button : GTK_Button;
      Label : GTK_Label;
      Box : GTK_Box;
      entree : GTK_Entry;

   end record;


end reseaux;