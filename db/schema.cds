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
    name : String(100);
    stardustCollection : Association to StardustCollection default 0;
    wormholeNavigationSkill : Integer @assert.range: [1, 10];
    originPlanet : String(50);
    spacesuitColor : String(30);
    department : Association to Department;
    position : Association to Position;
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
