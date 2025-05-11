--                      Lespace Contemporain
--  ce package a ete developper par le programmeur : Z.M Dimitri Emmanuel
--  la date du : 07 septembre 10 2024 au lieu de Mboukou (city).
--  ce package contient les differentes methodes qui permettent de creer,
--  modifier les fonctionnalitees de la fenetre principales du logiciels.
with ma_fenetre.contactez;  use ma_fenetre.contactez;

package ma_fenetre.contactez.anglais is

   type service_client_anglais_record is new service_client_record with private;
   type service_client_anglais is access all service_client_anglais_record'class;

   procedure Initialize (Object : service_client_anglais);

   private

   type service_client_anglais_record is new service_client_record with null record;

end ma_fenetre.contactez.anglais;