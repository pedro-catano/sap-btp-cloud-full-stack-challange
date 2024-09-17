using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with @UI: {
  FieldGroup #CosmicDetails: {Data: [
    {Value: status_code},
    {Value: stardustCollection_code},
    {Value: spacesuitColor}
  ]},
  FieldGroup #OtherDetails : {Data: [
    {Value: name},
    {Value: wormholeNavigationSkill},
    {Value: originPlanet},
    {Value: department_ID},
    {Value: position_ID}
  ]},
  Facets                   : [
    { // cosmic details
      $Type : 'UI.ReferenceFacet',
      ID    : 'CosmicDetails',
      Target: '@UI.FieldGroup#CosmicDetails',
      Label : '{i18n>CosmicDetails}'
    },
    { // other details
      $Type : 'UI.ReferenceFacet',
      ID    : 'OtherDetails',
      Target: '@UI.FieldGroup#OtherDetails',
      Label : '{i18n>OtherDetails}'
    }
  ],
  LineItem                 : [
    {
      Value         : name,
      @UI.Importance: #High
    },
    {
      Value         : stardustCollection_code,
      @UI.Importance: #High
    },
    {
      Value         : spacesuitColor,
      @UI.Importance: #High
    },
    {
      Value         : status_code,
      @UI.Importance: #High
    }
  ],
  HeaderInfo               : {
    TypeName      : '{i18n>Spacefarer}',
    TypeNamePlural: '{i18n>Spacefarers}',
    Title         : {
      Value: name,
      Label: '{i18n>SpacefarerName}'
    },
    Description   : {
      Value: originPlanet,
      Label: '{i18n>OriginPlanet}'
    }
  },
  PresentationVariant      : {
    Text          : 'Default',
    Visualizations: ['@UI.LineItem'],
    SortOrder     : [{
      $Type     : 'Common.SortOrderType',
      Property  : name,
      Descending: false
    }],
    MaxItems      : 1
  },
};
