
const express = require('express');
const admin = require('firebase-admin');
const authRoutes = require('./routes/authRoutes');
const app = express();


// Environment Variables
const port = process.env.PORT || 3000;
const serviceAccountPath = './key.json';



app.use(express.json()); // For parsing application/json

// Initialize Firebase Admin
const serviceAccount = require(serviceAccountPath);
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// Use routes
app.use('/auth', authRoutes);

// Start server
app.listen(port, () => console.log(`Server listening on port ${port}`));
