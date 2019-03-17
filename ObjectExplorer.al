pageextension 50102 CustomerListExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Content)
        {
            part(FieldList; "Object Explorer Fields")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

page 50100 "Object Explorer"
{
    PageType = List;

    SourceTable = Object;
    Caption = 'Object Explorer';
    SourceTableView = sorting (Type) order(ascending);
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ID; ID)
                {
                    ApplicationArea = All;
                    Editable = false;

                }

                field(Name; Name)
                {
                    Editable = false;
                }

                field(Caption; Caption)
                {

                }
            }

            group(ObjectFields)
            {
                Caption = 'Table Fields';

                part("Object List Fields"; "Object Explorer Fields")
                {
                    ApplicationArea = All;
                    // SubPageLink = TableNo = field (ID);
                }
            }
        }
        area(Factboxes)
        {
            part("Object Fields Factbox"; "Object Explorer Fields")
            {
                ApplicationArea = All;
                // SubPageLink = TableNo = field (ID);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Run)
            {
                ApplicationArea = All;
                Image = Continue;

                trigger OnAction();
                begin
                    case Type of
                        Type::Page:
                            PAGE.RUN(ID);
                        Type::Codeunit:
                            CODEUNIT.RUN(ID);
                        Type::Report:
                            REPORT.RUN(ID);
                        Type::XMLport:
                            XMLPORT.RUN(ID);
                        Type::Table:
                            HYPERLINK(GETURL(CLIENTTYPE::Current, COMPANYNAME, OBJECTTYPE::Table, ID));
                        Type::Query:
                            HYPERLINK(GETURL(CLIENTTYPE::Current, COMPANYNAME, OBJECTTYPE::Query, ID));
                    end;
                end;
            }
        }
    }
}

page 50101 "Object Explorer Fields"
{
    Caption = 'Table Fields';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Field;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(TableName; TableName)
                {
                    ApplicationArea = All;

                }

                field(FieldName; FieldName)
                {

                }

                field("Field Caption"; "Field Caption")
                {

                }

                field(Type; Type)
                {

                }

                field(Len; Len)
                {

                }

                field(Enabled; Enabled)
                {

                }

                field(OptionString; OptionString)
                {

                }

                field(RelationTableNo; RelationTableNo)
                {

                }

                field(RelationFieldNo; RelationFieldNo)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}