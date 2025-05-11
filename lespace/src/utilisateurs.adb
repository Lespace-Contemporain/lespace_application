with Ada.Text_IO;  use Ada.Text_IO;

package body utilisateurs is

procedure affiche_user (User : user_lespace) is

begin

Put_Line (user_lespace'Image (User));

end affiche_user;

procedure nom_complet_user (User : out user_lespace; Name : String) is
begin

User.Nom_complet := To_Unbounded_String (Name);

end nom_complet_user;

function nom_complet_user (User : user_lespace) return String is
begin
return To_String(User.Nom_Complet);
end nom_complet_user;

procedure contacte_user (User : out user_lespace; Contact : String) is
begin

User.Contacte := To_Unbounded_String (Contact);

end contacte_user;

function contacte_user (User : user_lespace) return String is
begin
return To_String (User.Contacte);
end contacte_user;

procedure pays_user (User : out user_lespace; Country : String) is
begin

User.Pays := To_Unbounded_String (Country);

end pays_user;

function pays_user (User : user_lespace) return String is
begin
return To_String (User.Pays);
end pays_user;

procedure ville_user (User : out user_lespace; ville : String) is
begin

User.ville := To_Unbounded_String (Ville);

end ville_user;

function ville_user (User : user_lespace) return String is
begin
return To_String (User.ville);
end ville_user;

procedure quartier_user (User : out user_lespace; quartier : String) is
begin

User.quartier := To_Unbounded_String (quartier);

end quartier_user;

function quartier_user (User : user_lespace) return String is
begin
return To_String (User.quartier);
end quartier_user;

procedure adresse_user (User : out user_lespace; adresse : String) is
begin

User.adresse_postal := To_Unbounded_String (adresse);

end adresse_user;

function adresse_user (User : user_lespace) return String is
begin
return To_String (User.adresse_postal);
end adresse_user;

function jour_livraison_user (User : user_lespace) return Time is
begin
return User.jour_boite_livree;
end jour_livraison_user;

function jour_commande_user (User : user_lespace) return Time is
begin
return User.jour_boite_commandee;
end jour_commande_user;

function abonnement_en_attente (User : user_lespace) return Time is
begin
return User.internet_en_attente;
end abonnement_en_attente;

function abonnement_en_cours (User : user_lespace) return boolean is
begin
--  communication reseau
--
--  la fonction doit connaitre si le reseau a un abonnement actif ou pas.
return false;
end abonnement_en_cours;

function mot_passe_boite (User : user_lespace) return String is
begin
--  renvoie le mot de passe fournit par le reseau
return To_String (User.mot_passe_boite);
end mot_passe_boite;

function identifiant_boite (User : user_lespace) return Integer is
begin
--  renvoie le numero identifiant fournit par le reseau
return User.identifiant_boite;
end identifiant_boite;
end utilisateurs;