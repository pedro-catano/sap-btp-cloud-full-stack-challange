const fs = require('node:fs');

module.exports = (srv) => {

  const validate = (req) => {
    const { stardustCollection_code, wormholeNavigationSkill, originPlanet } = req.data;
    let msg;
    switch (originPlanet) {
      case "PlanetX":
        if (wormholeNavigationSkill > 8 || wormholeNavigationSkill < 3) {
          msg = "Valid Wormhole Navigation value is [3..8]"
        }
        break;
      case "PlanetY":
        if (stardustCollection_code > 3 || stardustCollection_code < 2) {
          msg = "Valid Stardust Collection value is [2..3]"
        }
        break;
      default:

    }
    if (msg) {
      req.error(400, msg);
    }
  }

  const enhance = (req) => {
    if (req.data.stardustCollection_code < 4) {
      req.data.stardustCollection_code += 1;
    }
    req.data.wormholeNavigationSkill += 1;
    req.info("Values increased as a result of the training");
  }

  const attachmentIsRequested = (req) => {
    return req?.query?.SELECT?.columns?.[0]?.ref?.[0] === 'attachmentXlsx';
  }

  srv.on('READ', 'Books', (req, next) => {
    if (attachmentIsRequested(req)) {
      const readable = fs.createReadStream('files/test.xlsx');
      return {
        value: readable,
        $mediaContentType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        $mediaContentDispositionFilename: 'test.xlsx', // > optional
        $mediaContentDispositionType: 'inline' // > optional
      }
    }
    return next()
  });

  /*srv.before('NEW', 'Spacefarers.drafts', (req) => {
    validate(req)
    enhance(req)
  });*/

  srv.before(['CREATE', 'UPDATE'], 'Spacefarers', (req) => {
    validate(req)
  });

  srv.before('CREATE', 'Spacefarers', (req) => {
    enhance(req)
  });

  srv.after('CREATE', 'Spacefarers', (spacefarer) => {
    // TODO: add email sending with e.g. Twilio
    console.log(`Sending email to ${spacefarer.name}, congratulating them on their cosmic adventure.`);
  });


};
