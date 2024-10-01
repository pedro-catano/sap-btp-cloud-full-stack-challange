namespace galactic.spacefarer;

using { sap.common.CodeList } from '@sap/cds/common';

entity StardustCollection : CodeList {
    key code : Integer enum {
            None   = 0;
            Low    = 1;
            Medium = 2;
            High   = 3;
            Master = 4;
        };
}

entity GalacticSpacefarer @(restrict: [
    { grant: '*', to: 'admin'},
    { grant: ['READ', 'WRITE'], where: 'originPlanet = $user.originPlanet'}
]) {
    key ID : UUID;
    name : String(100) @mandatory;
    stardustCollection : Association to StardustCollection default 0 @assert.target;
    wormholeNavigationSkill : Integer @assert.range: [1, 10];
    originPlanet : String(50);
    spacesuitColor : String(30);
    department : Association to Department @assert.target;
    position : Association to Position @assert.target;
    status : Association to SpacefarerStatus;
    address : Composition of many {
        key ID: Integer;
        line: String(100);
        owner: Association to GalacticSpacefarer;
    }
}

entity Address {
    key ID: Integer;
    line: String(100);
    owner: Association to GalacticSpacefarer;
}

@cds.odata.valuelist
@UI.Identification: [{ Value: name }]
entity Department {
    @Common.Text: 'name'
    key ID : Integer;
    name : String(100);
    positions : Composition of many Position on positions.department = $self;
}

@cds.odata.valuelist
@UI.Identification: [ { Value: title } ]
entity Position {
    @Common.Text: 'title'
    key ID : Integer;
    title : String(100);
    department : Association to Department;    
}

entity SpacefarerStatus : CodeList {
    key code                    : String enum {
            Candidate = 'C';
            Trainee   = 'T';
            Active    = 'A';
            Retired   = 'R';
        } default 'C'; //> will be used for foreign keys as well
        criticality             : Integer; //  2: yellow colour,  3: green colour, 0: unknown
        fieldControl            : Integer @odata.Type: 'Edm.Byte'; // 1: #ReadOnly, 7: #Mandatory
        createDeleteHidden      : Boolean;
        insertDeleteRestriction : Boolean; // = NOT createDeleteHidden
}
