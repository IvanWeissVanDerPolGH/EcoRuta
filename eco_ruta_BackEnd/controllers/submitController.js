
const admin = require('firebase-admin');


exports.submitInfo = async (req, res) => {
    try {
      const picture = req.file; // Access the uploaded file
      const { gpsLocation, tags } = req.body;
  
      // Process the picture and other data here
      // For example, store the picture in cloud storage and save the URL in your database
  
      // Convert tags to an array if it's not already
      const tagsArray = Array.isArray(tags) ? tags : tags.split(',');
  
      // Save the information to your database
      // ...
  
      res.status(200).send({ message: 'Information submitted successfully' });
    } catch (error) {
      res.status(500).send({ message: 'Error submitting information', error: error.message });
    }
  };

  


exports.getAllLocations = async (req, res) => {
  try {
    const submissionsRef = admin.firestore().collection('submissions'); // Adjust 'submissions' to your collection name
    const snapshot = await submissionsRef.get();

    let locations = [];
    snapshot.forEach(doc => {
      let data = doc.data();
      locations.push({
        uuid: doc.id, // Assuming doc.id is your UUID
        gpsLocation: data.gpsLocation // Make sure 'gpsLocation' matches your field name
      });
    });

    res.status(200).send(locations);
  } catch (error) {
    res.status(500).send({ message: 'Error retrieving locations', error: error.message });
  }
};
