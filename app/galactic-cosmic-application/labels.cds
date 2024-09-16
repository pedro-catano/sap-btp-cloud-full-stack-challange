using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with @title: '{i18n>Specefarers}' {
  department              @title        : '{i18n>Department}'  @Common.Text: department.name  @Common.TextArrangement: #TextOnly;
  position                @title        : '{i18n>Position}'    @Common.Text: position.title   @Common.TextArrangement: #TextOnly;
  originPlanet            @title        : '{i18n>OriginPlanet}';
  wormholeNavigationSkill @title        : '{i18n>WormholeNavigationSkill}';
}

annotate service.Spacefarers with {
  stardustCollection  @(Common: {
    Text           : stardustCollection.name,
    TextArrangement: #TextOnly
  })  @Common.ValueListWithFixedValues
};

annotate service.StardustCollection with {
  code @(Common: {
    Text           : name,
    TextArrangement: #TextOnly
  })
};
