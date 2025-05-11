with Ada.Text_IO;  use Ada.Text_IO;

package body abonnee_lespace is 
 
 procedure affiche_tous_abonnees (S : mon_abonnee) is

 function convert (C : user_lespace) return String renames user_lespace'Image;
 begin
 
 for i of S.Liste loop

 Put_Line (convert (i));

 end loop;
 end affiche_tous_abonnees;

 procedure affiche_abonnee_by_name (S : mon_abonnee; Name : String) is
 begin

 for i of S.Liste loop

 if nom_complet_user (i) = Name then

 Put_Line (user_lespace'Image (i));

 end if;
 end loop;
 end affiche_abonnee_by_name;

 procedure ajoute_abonnee (S : out mon_abonnee; A : user_lespace) is
 begin

 Append (S.Liste, A);
 end ajoute_abonnee;

 procedure supprime_abonnee (S : out mon_abonnee; A : user_lespace) is
 begin
 
 S.C := S.Liste.Find (A);

 if S.C /= No_Element then

 S.Liste.Delete (S.C);
 end if;
 
 end supprime_abonnee;

 procedure affiche_abonnee_by_contact (S : mon_abonnee; Contact : String) is
 begin

 for i of S.Liste loop

 if contacte_user (i) = Contact then

 Put_Line (user_lespace'Image (i));

 end if;
 end loop;
 end affiche_abonnee_by_contact;

 function nombres_abonnees (S : mon_abonnee) return Integer is
 begin
 return Integer (Length (S.Liste));
 end nombres_abonnees;

 end abonnee_lespace;