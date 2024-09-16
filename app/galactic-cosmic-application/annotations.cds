using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with @UI.SelectionFields : [
  department_ID,
  position_ID,
  originPlanet,
  wormholeNavigationSkill
];