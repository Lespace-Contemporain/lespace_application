package ma_fenetre.paiement_mode.anglais is

     type mode_paiement_anglais_record is new mode_paiement_record with private;
     type mode_paiement_anglais is access all mode_paiement_anglais_record'class;

     procedure create_window (F : mode_paiement_anglais);
     procedure open_window (F : mode_paiement_anglais);
     
     private

      type mode_paiement_anglais_record is new mode_paiement_record with null record;

      end ma_fenetre.paiement_mode.anglais;