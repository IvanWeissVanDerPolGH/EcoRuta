const admin = require('firebase-admin');

exports.loginUser = async (req, res) => {
  try {
    const { email, password } = req.body;
    const userRecord = await admin.auth().getUserByEmail(email);
    // El usuario existe, ahora intentamos iniciar sesión
    await admin.auth().signInWithEmailAndPassword(userRecord.uid, password);
    console.log('Inicio de sesión exitoso');
    res.status(200).send({ message: 'Login successful', user });
  } catch (error) {
    res.status(400).send({ message: 'Login failed', error: error.message });
  }
};

// exports.googleSignIn = async (req, res) => {
//     try {
//       const { idToken } = req.body;
//       const decodedToken = await admin.auth().verifyIdToken(idToken);
//       const uid = decodedToken.uid;
  
//       // Check if user already exists in Firestore
//       const usersRef = admin.firestore().collection('users');
//       const userSnapshot = await usersRef.doc(uid).get();
  
//       if (!userSnapshot.exists) {
//         // User does not exist, create a new user
//         const newUser = {
//           uid: uid,
//           email: decodedToken.email,
//           name: decodedToken.name,
//           profilePicture: decodedToken.picture,
//           createdAt: new Date(),
//           // Any other user info you want to store
//         };
  
//         // Add the new user to Firestore
//         await usersRef.doc(uid).set(newUser);
//         res.status(201).send({ message: 'New user created', user: newUser });
//       } else {
//         // User exists
//         res.status(200).send({ message: 'User logged in', user: userSnapshot.data() });
//       }
//     } catch (error) {
//       res.status(400).send({ message: 'Google sign-in failed', error: error.message });
//     }
//   };
    

// exports.registerUser = async (req, res) => {
//   try {
//     const { email, password, additionalData } = req.body;
//     const userRecord = await admin.auth().createUser({ email, password });
//     // Store additionalData in Firestore if needed
//     res.status(201).send({ message: 'User created successfully', userRecord });
//   } catch (error) {
//     res.status(400).send({ message: 'Registration failed', error: error.message });
//   }
// };

// exports.resetPassword = async (req, res) => {
//   try {
//     const { email } = req.body;
//     const link = await admin.auth().generatePasswordResetLink(email);
//     // Send link to user's email
//     res.status(200).send({ message: 'Password reset email sent', link });
//   } catch (error) {
//     res.status(400).send({ message: 'Failed to send password reset email', error: error.message });
//   }
// };


// exports.getUserInfo = async (req, res) => {
//     try {
//       const uid = req.params.uid;
//       const usersRef = admin.firestore().collection('users');
//       const userSnapshot = await usersRef.doc(uid).get();
  
//       if (!userSnapshot.exists) {
//         return res.status(404).send({ message: 'User not found' });
//       }
  
//       const userData = userSnapshot.data();
//       res.status(200).send({
//         message: 'User data retrieved successfully',
//         user: {
//           name: userData.name,
//           email: userData.email,
//           profilePicture: userData.profilePicture,
//           // Additional standard user information fields
//           phoneNumber: userData.phoneNumber || 'Not Provided',
//           address: userData.address || 'Not Provided',
//           dob: userData.dob || 'Not Provided', // Date of Birth
//           gender: userData.gender || 'Not Specified',
//           joinDate: userData.createdAt.toDate().toISOString(), // Convert Firestore Timestamp to ISO String
//           lastLogin: userData.lastLogin ? userData.lastLogin.toDate().toISOString() : 'Never Logged In',
//           // Other custom fields as per your application's requirements
//         }
//       });
//     } catch (error) {
//       res.status(500).send({ message: 'Error retrieving user data', error: error.message });
//     }
//   };
  