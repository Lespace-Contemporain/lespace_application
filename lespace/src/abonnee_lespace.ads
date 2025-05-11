with utilisateurs;  use utilisateurs;
with Ada.Containers.Vectors;

package abonnee_lespace is

type mon_abonnee is limited private;

package Listes is new Ada.Containers.Vectors (Positive, user_lespace);
use Listes;

procedure affiche_tous_abonnees (S : mon_abonnee);
function nombres_abonnees (S : mon_abonnee) return Integer;

procedure affiche_abonnee_by_name (S : mon_abonnee; Name : String);

procedure ajoute_abonnee (S : out mon_abonnee; A : user_lespace);

procedure supprime_abonnee (S : out mon_abonnee; A : user_lespace);

procedure affiche_abonnee_by_contact (S : mon_abonnee; Contact : String);

private

type mon_abonnee is record

Liste : Listes.Vector;
C : Listes.Cursor;

end record;

end abonnee_lespace;