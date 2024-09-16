using GalacticService as service from '../../srv/service';

annotate service.Spacefarers with {

  department         @(Common: {
    ValueList #vlDepartment: {
      $Type         : 'Common.ValueListType',
      CollectionPath: 'Departments',
      Parameters    : [
        {
          $Type            : 'Common.ValueListParameterInOut',
          LocalDataProperty: department_ID,
          ValueListProperty: 'ID',
        },
        {
          $Type            : 'Common.ValueListParameterDisplayOnly',
          ValueListProperty: 'name',
        },
      ],
    }
  });

  position           @(Common: {
    ValueList #vlPosition: {
      $Type         : 'Common.ValueListType',
      CollectionPath: 'Positions',
      Parameters    : [
        {
          $Type            : 'Common.ValueListParameterInOut',
          LocalDataProperty: position_ID,
          ValueListProperty: 'ID',
        },
        {
          $Type            : 'Common.ValueListParameterDisplayOnly',
          ValueListProperty: 'title',
        },
        {
          $Type            : 'Common.ValueListParameterIn',
          LocalDataProperty: department_ID,
          ValueListProperty: 'department_ID',
        },
      ],
    }
  });

  stardustCollection @Common.ValueListWithFixedValues;

};
