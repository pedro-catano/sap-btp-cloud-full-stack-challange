sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'galacticcosmicapplication/test/integration/FirstJourney',
		'galacticcosmicapplication/test/integration/pages/SpacefarersList',
		'galacticcosmicapplication/test/integration/pages/SpacefarersObjectPage'
    ],
    function(JourneyRunner, opaJourney, SpacefarersList, SpacefarersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('galacticcosmicapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSpacefarersList: SpacefarersList,
					onTheSpacefarersObjectPage: SpacefarersObjectPage
                }
            },
            opaJourney.run
        );
    }
);