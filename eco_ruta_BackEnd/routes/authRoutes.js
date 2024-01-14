const express = require('express');
const upload = require('../multerConfig'); // Make sure this path is correct
const authController = require('../controllers/authController');
const submitController = require('../controllers/submitController');

const router = express.Router();

router.post('/login', authController.loginUser);
router.post('/register', authController.registerUser);
router.post('/forgot-password', authController.resetPassword);
router.post('/google-sign-in', authController.googleSignIn);
router.get('/user/:uid', authController.getUserInfo); // Make sure the getUserInfo function is exported from authController
router.post('/submit-info', upload.single('picture'), submitController.submitInfo);
router.get('/locations', getAllLocations);

module.exports = router;
