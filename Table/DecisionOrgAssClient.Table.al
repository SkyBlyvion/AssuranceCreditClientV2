// Cette table contient les informations relatives aux clients d'assurance d'une organisation.
table 50009 "Decision Org Assurance Client"
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

    fieldgroups // include a FieldGroup for the dropdown display
    {
        fieldgroup(DropDown; "Code", "Designation FR", "Designation ES")
        {

        }
    }
}
