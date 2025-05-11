package body data_configuration is

procedure write_language_data
(data : out data_config; langue : langue_parlee) is
begin

data.langue := langue;

end write_language_data;

procedure write_id_data (data : out data_config; id : String) is
begin

data.numero_id := To_Unbounded_String (id);

end write_id_data;

procedure write_passwd_data (data : out data_config; passwd : String) is
begin

data.passwd := To_Unbounded_String (passwd);

end write_passwd_data;

function language_data (data : data_config) return langue_parlee is
begin
return data.langue;
end language_data;

function id_data (data : data_config) return String is
begin
return To_String (data.numero_id);
end id_data;

function passwd_data (data : data_config) return String is
begin
return To_String (data.passwd);
end passwd_data;

end data_configuration;