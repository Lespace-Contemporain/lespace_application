with GNAT.Sockets;  use GNAT.Sockets;
with Ada.Streams;   use Ada.Streams;

package reseaux is

type network is private;

procedure creation_reseau (net : in out network);

procedure ouverture_reseau (net : network);

procedure fermeture_reseau (net : network);

function reseau (net : in out network) return Stream_Access;

function adresse_reseau (net : network) return Sock_Addr_Type;

private

type network is record

Socket : Socket_Type;
Address : Sock_Addr_Type;
Channel : Stream_Access;

end record;

end reseaux;