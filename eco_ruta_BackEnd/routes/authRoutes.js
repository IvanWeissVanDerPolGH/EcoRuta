const express = require('express');
const authController = require('../controllers/authController');
const submitController = require('../controllers/submitController');

const router = express.Router();

router.post('/login', authController.loginUser);

module.exports = router;
