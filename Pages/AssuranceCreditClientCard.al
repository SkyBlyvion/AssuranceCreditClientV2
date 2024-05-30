/* Cette page affiche les détails d'un enregistrement spécifique de la table "Assurance Credit Client".
   Elle permet aux utilisateurs de visualiser et de modifier les informations relatives à l'assurance crédit d'un client. */

page 50006 "Assurance Credit Client Card"
{
    PageType = Card; // Définir le type de page comme une fiche (Card)
    SourceTable = "Assurance Credit Client"; // Définir la table source de la page
    ApplicationArea = All; // Rendre la page accessible dans toutes les zones d'application
    Editable = true; // Permettre l'édition des champs sur la page

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Code Client"; Rec."Code Client")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                    Editable = false; // Ne permet pas de modifier le Code Client
                    TableRelation = Customer."No."; // Relation de table pour l'intégrité référentielle
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                }
                field("Decision Assurance"; Rec."Decision Assurance")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                    TableRelation = "Decision Org Assurance Client".Code; // Relation de table pour l'intégrité référentielle
                }
                field("Valeur"; Rec."Valeur")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                }
                field("Raison"; Rec."Raison")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                }
            }
        }
    }
}
