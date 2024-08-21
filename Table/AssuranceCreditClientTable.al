// Cette table contient les informations relatives à l'assurance crédit d'un client
table 50008 "Assurance Credit Client"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code Client"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(2; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Decision Assurance"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Decision Org Assurance Client"."Code";
        }
        field(4; "Valeur"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Raison"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Numero Dossier"; Text[12])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Designation FR"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Decision Org Assurance Client"."Designation FR" WHERE("Code" = FIELD("Decision Assurance")));
            Editable = false;
        }
        field(8; "Designation ES"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Decision Org Assurance Client"."Designation ES" WHERE("Code" = FIELD("Decision Assurance")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Code Client", "Date")
        {
            Clustered = true;
        }

    }
}
