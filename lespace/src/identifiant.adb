with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

package body identifiant is

procedure Initialize (Objet : in out network_address) is
begin

--
--  comnunication reseau
--
-- Object.Id_reseau prend la valeur que la boite lui transmet.
null;
end Initialize;

function identification_number (adresse : network_address) return numero_id is
begin
return adresse.Id_reseau;
end identification_number;
end identifiant;