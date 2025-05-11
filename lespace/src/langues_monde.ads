package langues_monde is

type language_utilisateur is private;
type langue_parlee is (English, Francais);

procedure modifier_langue (F : out language_utilisateur;
                           L : langue_parlee);
function langue (F : language_utilisateur) return langue_parlee;

private

type language_utilisateur is record

L : langue_parlee := Francais;

end record;

end langues_monde;