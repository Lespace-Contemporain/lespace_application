package body reseaux is

-----------------------
--  creation_reseau  --
-----------------------

  procedure creation_reseau (net : in out network) is
  begin

    net.Address.Addr := Addresses (Get_Host_By_Name (Host_Name),1);
    net.Address.Port := Any_Port;
    
    Create_Socket (net.Socket);
    
  end creation_reseau;

------------------------
--  ouverture_reseau  --
------------------------

  procedure ouverture_reseau (net : network) is
  begin

   Connect_Socket (net.Socket, net.Address);

  end ouverture_reseau;

------------------------
--  fermeture_reseau  --
------------------------

  procedure fermeture_reseau (net : network) is
  begin
   Close_Socket (net.Socket);
  end fermeture_reseau;

--------------
--  reseau  --
--------------

  function reseau (net : in out network) return Stream_Access is
  begin

    net.Channel := Stream (net.Socket);
    return net.Channel;
  end reseau;

---------------------
--  adresse_reseau --
---------------------

  function adresse_reseau (net : network) return Sock_Addr_Type is
  begin
   return net.Address;
  end adresse_reseau;
end reseaux;