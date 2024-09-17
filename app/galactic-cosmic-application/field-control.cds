using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with {
  name           @Common.FieldControl: status.fieldControl;
  originPlanet   @Common.FieldControl: status.fieldControl;
  spacesuitColor @Common.FieldControl: status.fieldControl;
  department     @Common.FieldControl: status.fieldControl;
  position       @Common.FieldControl: status.fieldControl;
}
