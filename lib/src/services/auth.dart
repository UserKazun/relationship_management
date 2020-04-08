import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class Auth {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    return user.uid;
  }

  static Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    return user.uid;
  }

  static Future<String> googleSignIn() async {
    GoogleSignIn google = GoogleSignIn(
      scopes: <String>['email'],
    );

    try {
      final GoogleSignInAccount googleAccount = await google.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser =
          await _firebaseAuth.currentUser();
      assert(user.uid == currentUser.uid);

      return user.uid;
    } on Exception catch (error) {
      print(error);

      return null;
    }
  }

  static Future<void> googleSignOut() async {
    GoogleSignIn google = GoogleSignIn(
      scopes: <String>['email'],
    );
    await google.signOut();
  }

  static Future<void> signOut() async {

    return _firebaseAuth.signOut();
  }

  static Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();

    return user;
  }

  static Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  static Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    try {
      await user.reload();
    } catch (error) {

      return user.isEmailVerified;
    }

    user = await _firebaseAuth.currentUser();

    return user.isEmailVerified;
  }

  static Future<void> resetPassword(email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
