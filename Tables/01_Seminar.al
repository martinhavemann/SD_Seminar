table 123456701 Seminar
{
    Caption = 'Seminar';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.get;
                    NoSeriesManagement.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DataClassification = ToBeClassified;
        }

        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(90; "Comment"; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            //FieldClass=FlowField;
            //CalcFormula=exist("Seminar Comment Line"
            //where("Table Name"= const("Seminar"),
            // "No."=Field("No.")));
            DataClassification = ToBeClassified;
        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(130; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SK1; "Search Name")
        {

        }
    }

    var
        SeminarSetup: Record "Seminar Setup";
        //CommentLine : Record "Seminar Comment Line";
        Seminar: Record Seminar;
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesManagement.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := WorkDate;
    end;

    trigger OnDelete();
    begin
        //add code to delete seminar comment lines
        //CommentLine.Reset;
        //CommentLine.SetRange("Table Name",
        //CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        // CommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := WorkDate;
    end;

}