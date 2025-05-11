with langues_monde;          use langues_monde;
with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

package data_configuration is

type data_config is private;

function id_data (data : data_config) return String;

function language_data (data : data_config) return langue_parlee;

function passwd_data (data : data_config) return String;

procedure write_Passwd_data (data : out data_config; passwd : String);

procedure write_language_data (data : out data_config; langue : langue_parlee);

procedure write_id_data (data : out data_config; id : String);

private

type data_config is record

numero_id : Unbounded_String;
passwd : Unbounded_String;
langue : langue_parlee;

end record;

end data_configuration;