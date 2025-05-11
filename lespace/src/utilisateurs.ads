pragma Ada_2022;

with Ada.Calendar;           use Ada.Calendar;
with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

package utilisateurs is

type user_lespace is private;

procedure affiche_user (User : user_lespace);

procedure nom_complet_user (User : out user_lespace; Name : String);
function nom_complet_user (User : user_lespace) return String;

procedure contacte_user (User : out user_lespace; Contact :  String);
function contacte_user (User : user_lespace) return String;

procedure pays_user (User : out user_lespace; Country : String);
function pays_user (User : user_lespace) return String;

procedure ville_user (User : out user_lespace; ville : String);
function ville_user (User : user_lespace) return String;

procedure quartier_user (User : out user_lespace; quartier : String);
function quartier_user (User : user_lespace) return String;

procedure adresse_user (User : out user_lespace; adresse : String);
function adresse_user (User : user_lespace) return String;

function jour_livraison_user (User : user_lespace) return Time;
function jour_commande_user (User : user_lespace) return Time;

function abonnement_en_attente (User : user_lespace) return Time;
function abonnement_en_cours (User : user_lespace) return boolean;

function mot_passe_boite (User : user_lespace) return String;
function identifiant_boite (User : user_lespace) return Integer;

private

type user_lespace is record

Nom_Complet : Unbounded_String;
pays : Unbounded_String;
ville : Unbounded_String;
quartier : Unbounded_String;
adresse_postal : Unbounded_String;
contacte : Unbounded_String;
Jour_boite_commandee : Time;
jour_boite_livree : Time;
internet_en_attente : Time;
internet_en_cours : Boolean;
identifiant_boite : Integer;
mot_passe_boite : Unbounded_String;

end record;

end utilisateurs;
