pragma Ada_2022;

package ma_fenetre.ma_boite.order_box.anglais is

    type order_my_box_english_record is new order_my_box_record with private;
    type order_my_box_english is access all order_my_box_english_record'class;

    procedure create_window (F : order_my_box_english);

    procedure open_window (F : order_my_box_english);

    private
   
   package Pu is new Gtk.Handlers.User_Callback
    (Gtk_Widget_Record, order_my_box_english);
    use Pu;

   package Pu1 is new Gtk.Handlers.User_Callback
    (Gtk_Combo_Box_Text_Record, order_my_box_english);
    use Pu1;

    type order_my_box_english_record is new order_my_box_record with null record;

end ma_fenetre.ma_boite.order_box.anglais;