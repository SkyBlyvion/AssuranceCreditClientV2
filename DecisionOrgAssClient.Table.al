table 50100 "Decision Org Assurance Client"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Designation FR"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Designation ES"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
