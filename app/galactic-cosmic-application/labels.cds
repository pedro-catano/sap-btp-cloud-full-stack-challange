using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with @title: '{i18n>Specefarers}' {
  department              @title        : '{i18n>Department}'          @Common.Text: department.name          @Common.TextArrangement: #TextOnly;
  position                @title        : '{i18n>Position}'            @Common.Text: position.title           @Common.TextArrangement: #TextOnly;
  originPlanet            @title        : '{i18n>OriginPlanet}';
  wormholeNavigationSkill @title        : '{i18n>WormholeNavigationSkill}';
  spacesuitColor          @title        : '{i18n>SpacesuitColor}';
  stardustCollection      @title        : '{i18n>StardustCollection}'  @Common.Text: stardustCollection.name  @Common.TextArrangement: #TextOnly;
  name                    @title        : '{i18n>Name}';
  status                  @title        : '{i18n>Status}'              @Common.Text: status.name              @Common.TextArrangement: #TextOnly;
}

annotate service.StardustCollection {
  code  @Common.Text: name  @Common.TextArrangement: #TextOnly;
}

annotate service.SpacefarerStatus with {
  code  @Common.Text: name  @Common.TextArrangement: #TextOnly
}
