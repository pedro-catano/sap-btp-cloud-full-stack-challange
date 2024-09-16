using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: '{i18n>Name}',
        Value: name,
      },
      {
        $Type: 'UI.DataField',
        Label: '{i18n>StardustCollection}',
        Value: stardustCollection_code,
      },
      {
        $Type: 'UI.DataField',
        Label: '{i18n>WormholeNavigationSkill}',
        Value: wormholeNavigationSkill,
      },
      {
        $Type: 'UI.DataField',
        Label: '{i18n>OriginPlanet}',
        Value: originPlanet,
      },
      {
        $Type: 'UI.DataField',
        Label: '{i18n>SpacesuitColor}',
        Value: spacesuitColor,
      },
      {
        $Type: 'UI.DataField',
        Label: '{i18n>Department}',
        Value: department_ID,
      },
      {
        $Type: 'UI.DataField',
        Label: '{i18n>Position}',
        Value: position_ID,
      },
    ],
  },
  UI.Facets                    : [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'GeneratedFacet1',
    Label : '{i18n>GeneralInformation}',
    Target: '@UI.FieldGroup#GeneratedGroup',
  }, ],
  UI.LineItem                  : [
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Name}',
      Value: name,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>StardustCollection}',
      Value: stardustCollection_code,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>SpacesuitColor}',
      Value: spacesuitColor,
    }
  ],
  UI.HeaderInfo                : {
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
  UI.PresentationVariant : {
    Text           : 'Default',
    Visualizations : ['@UI.LineItem'],
    SortOrder      : [{
      $Type      : 'Common.SortOrderType',
      Property   : name,
      Descending : false
    }],
    MaxItems: 1
  },  
);
