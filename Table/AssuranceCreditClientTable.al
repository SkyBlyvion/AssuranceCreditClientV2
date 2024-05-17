table 50008 "Assurance Credit Client"
{
    DataClassification = CustomerContent; // General classification for the table

    fields
    {
        field(1; "Code Client"; Code[20])
        {
            DataClassification = CustomerContent;
            // Relation avec la table Customer, champ "No."
            TableRelation = Customer."No.";
        }
        field(2; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Decision Assurance"; Code[10])
        {
            DataClassification = CustomerContent;
            // Relation avec la table "Decision Org Assurance Client", champ "Code"
            TableRelation = "Decision Org Assurance Client"."Code";
        }
        field(4; "Valeur"; Decimal)
        {
            DataClassification = CustomerContent; // Assuming Valeur relates to customer transactions
        }
        field(5; "Raison"; Text[50])
        {
            DataClassification = CustomerContent; // Assuming Reason includes customer-specific details
        }
        field(6; "Case Number"; Text[12])
        {
            DataClassification = CustomerContent; // Assuming this is a reference number relevant to the customer
        }
        field(7; "Designation FR"; Text[50])
        {
            // Défini comme un champ de type FlowField
            FieldClass = FlowField;
            // Calcule la valeur en faisant une recherche dans la table "Decision Org Assurance Client"
            // Since "Code", "Designation FR" and "Designation ES" are all in the same table ans same row, it can calculate 
            CalcFormula = Lookup("Decision Org Assurance Client"."Designation FR" WHERE("Code" = FIELD("Decision Assurance")));
            Editable = false;
        }
        field(8; "Designation ES"; Text[50])
        {
            // Défini comme un champ de type FlowField
            FieldClass = FlowField;
            // Calcule la valeur en faisant une recherche dans la table "Decision Org Assurance Client"
            CalcFormula = Lookup("Decision Org Assurance Client"."Designation ES" WHERE("Code" = FIELD("Decision Assurance")));
            Editable = false;
        }
    }

    keys
    {
        // Clé primaire pour la table, basée sur le champ "Code Client"
        key(PK; "Code Client")
        {
            Clustered = true;
        }
    }


}
