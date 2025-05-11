package body langues_monde is

procedure modifier_langue (F : out language_utilisateur;
                           L : langue_parlee) is
begin

F.L := L;

end modifier_langue;

function langue (F : language_utilisateur) return langue_parlee is
begin

return F.L;

end langue;
end langues_monde;