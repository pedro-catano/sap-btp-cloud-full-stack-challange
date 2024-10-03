using { galactic.spacefarer as gs } from '../db/schema';

service GalacticService @(requires: 'authenticated-user') {
    entity Spacefarers as projection on gs.GalacticSpacefarer;
    entity Departments as projection on gs.Department;
    entity Positions as projection on gs.Position;
    entity Books as projection on gs.Books;
}