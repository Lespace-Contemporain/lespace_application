pragma Ada_2022;

package ma_fenetre.configuration.anglais is

type ma_config_anglais_record is new ma_configuration_record with private;
type ma_config_anglais is access all ma_config_anglais_record'class;

procedure create_window (F : ma_config_anglais);
procedure open_window (F : ma_config_anglais);

private

type ma_config_anglais_record is new ma_configuration_record with null record;

end ma_fenetre.configuration.anglais;