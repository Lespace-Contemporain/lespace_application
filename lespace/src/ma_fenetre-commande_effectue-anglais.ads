package ma_fenetre.commande_effectue.anglais is

    type commande_effectue_anglais_record is new commande_effectuer_record with private;
    type commande_effectuer_anglais is access all commande_effectuer_record'Class;

    procedure Initialize (Object : commande_effectuer_anglais);

    private

    type commande_effectue_anglais_record is new commande_effectuer_record with null record;

    Message_Anglais : constant String := "Your order to internet Lespace box, that's will do "&
                                "with successfully. We contact us in 7 days time out for you take in.";

end ma_fenetre.commande_effectue.anglais;