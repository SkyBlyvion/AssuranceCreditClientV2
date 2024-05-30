table 50008 "Assurance Credit Client"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry ID"; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true; // This field will auto-increment
        }
        field(2; "Code Client"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(3; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Decision Assurance"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Decision Org Assurance Client"."Code";
        }
        field(5; "Valeur"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Raison"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Case Number"; Text[12])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Designation FR"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Decision Org Assurance Client"."Designation FR" WHERE("Code" = FIELD("Decision Assurance")));
            Editable = false;
        }
        field(9; "Designation ES"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Decision Org Assurance Client"."Designation ES" WHERE("Code" = FIELD("Decision Assurance")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry ID")
        {
            Clustered = true;
        }
        key(CustomerDate; "Code Client", "Date")
        {
            // This key will allow for efficient searches by client and date
        }
    }
}
