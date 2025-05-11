pragma Ada_2022;

with Ada.Finalization;  use Ada.Finalization;

package identifiant is

type network_address is new Controlled with private;
type numero_id is new Integer;

function identification_number
 (adresse : network_address) return numero_id;

private

type network_address is new Controlled with record

Id_reseau : numero_id;

end record;

overriding
procedure Initialize (Objet : in out network_address);

end identifiant;