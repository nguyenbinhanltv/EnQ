import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:EnQ/services/user_service.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    this.currentUser = (await _auth.signInWithCredential(credential)).user;
    await UserService().createUser(currentUser.uid, currentUser.displayName,
        currentUser.photoUrl, 1, 0, [], currentUser.email);
  }

  Future handleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
