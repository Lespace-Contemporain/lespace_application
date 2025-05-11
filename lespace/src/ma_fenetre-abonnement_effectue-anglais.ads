package ma_fenetre.abonnement_effectue.anglais is

   type mon_abonnement_anglais_record is new mon_abonnements_record with private;
   type mon_abonnement_anglais is access all mon_abonnement_anglais_record;

   procedure initialize1 (Object : mon_abonnement_anglais);

   procedure initialize2 (Object : mon_abonnement_anglais);

   private

   type mon_abonnement_anglais_record is new mon_abonnements_record with null record;

   message_anglais : constant String := "your subscription will do it with successfuly on your box.";
   message_anglais2 : constant String := "your subscription will do it with successfuly from destinatary.";

   end ma_fenetre.abonnement_effectue.anglais;