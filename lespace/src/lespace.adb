-----------------------------------------------------------------------------------------
--                LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT                            --
--                                                                                     --
-- Ecrit par : Zokoualoumba Moussounda Emmanuel Dimitri                                --
--                                                                                     --
-- Ce programme est l'application de Lespace Contemporain qui permet a un              --
-- utilisateur de commander une connexion internet et acheter un abonnement internet.  --
-- NOTE : Ce programme fonctionne en mode connecter. Une connexion a internet est      --
-- necessaire a son usage.                                                             --
-----------------------------------------------------------------------------------------

pragma Ada_2022;

with Gtk.Main;    use Gtk.Main;
with reseaux;     use reseaux;
with ma_fenetre;  use ma_fenetre;
with ma_fenetre.ma_boite.order_box;    use ma_fenetre.ma_boite.order_box;    

procedure lespace is

   Task initialize_reseau;

   Task body initialize_reseau is
   begin
      -- Initialisation du reseau

      creation_reseau (Sock);
      ouverture_reseau (Sock);

   end initialize_reseau;

   --F : fenetre_lespace;
   F : order_my_box;

begin

   F := new order_my_box_record;

   Gtk.Main.Init;

   creer_fenetre (F);
   ouvrir_fenetre (F);

   Gtk.Main.Main;
end lespace;