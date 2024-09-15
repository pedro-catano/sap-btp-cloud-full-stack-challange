module.exports = (srv) => {

  const validate = (req) => {
    const { stardustCollection, wormholeNavigationSkill, originPlanet } = req.data;
    let msg;
    switch (originPlanet) {
      case "PlanetX":
        if (wormholeNavigationSkill > 8 || wormholeNavigationSkill < 3) {
          msg = "Valid Wormhole Navigation value is [3..8]"
        }
        break;
      case "PlanetY":
        if (stardustCollection > 10 || stardustCollection < 6) {
          msg = "Valid Stardust Collection value is [6..10]"
        }
        break;
      default:

    }
    if (msg) {
      req.error(400, msg);
    }
  }

  const enhance = (req) => {
    req.data.stardustCollection += 1;
    req.data.wormholeNavigationSkill += 1;
    req.info("Values increased as a result of the training");
  }

  /*srv.before('NEW', 'Spacefarers.drafts', (req) => {
    validate(req)
    enhance(req)
  });*/

  srv.before('CREATE', 'Spacefarers', (req) => {
    validate(req)
    enhance(req)
  });

  srv.after('CREATE', 'Spacefarers', (spacefarer) => {
    // TODO: add email sending with e.g. Twilio
    console.log(`Sending email to ${spacefarer.name}, congratulating them on their cosmic adventure.`);
  });


};
