/* Cette page affiche les détails d'un enregistrement spécifique de la table "Assurance Credit Client".
   Elle permet aux utilisateurs de visualiser et de modifier les informations relatives à l'assurance crédit d'un client. */
page 50006 "Assurance Credit Client Card"
{
    PageType = Card; // Définir le type de page comme une fiche (Card)
    SourceTable = "Assurance Credit Client"; // Définir la table source de la page
    ApplicationArea = All; // Rendre la page accessible dans toutes les zones d'application
    Editable = true; // Rendre la page modifiable


    layout
    {
        area(content)
        {
            group(General)
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
                field("Numero Dossier"; Rec."Numero Dossier")
                {
                    ApplicationArea = All; // Champ accessible dans toutes les zones d'application
                }
            }
        }
    }

    // Vérifications pour la présence de données dans le champ Date 
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if Rec.Date = 0D then begin
            Message('Le champ Date est obligatoire, merci de le renseigner.');
            exit(false); // Empêcher la fermeture de la page
        end;
        UpdateCustomerCreditLimit(); // Met à jour la limite de crédit avec la valeur la plus récente
        exit(true); // Permettre la fermeture de la page
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        UpdateCustomerCreditLimit();
        exit(true); // Continuer l'insertion
    end;

    trigger OnModifyRecord(): Boolean
    begin
        UpdateCustomerCreditLimit();
        exit(true); // Continuer la modification
    end;

    local procedure UpdateCustomerCreditLimit()
    var
        CustomerRec: Record Customer;
        LastRecord: Record "Assurance Credit Client";
    begin
        // Filtrer les enregistrements pour le client courant et trier par date pour obtenir le plus récent
        LastRecord.SetCurrentKey("Code Client", "Date");
        LastRecord.SetRange("Code Client", Rec."Code Client");

        if LastRecord.FindLast() then
            if CustomerRec.Get(Rec."Code Client") then
                if CustomerRec."Credit Limit (LCY)" <> LastRecord."Valeur" then begin
                    CustomerRec."Credit Limit (LCY)" := LastRecord."Valeur";
                    CustomerRec.Modify(true);
                    COMMIT();

                end;

    end;






}
