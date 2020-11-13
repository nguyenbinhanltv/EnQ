import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:EnQ/services/user_service.dart';
import 'package:http/http.dart' as http;

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
    http.Response response = await UserService().createUser(
        currentUser.uid,
        currentUser.displayName,
        currentUser.photoUrl,
        0,
        0,
        [],
        currentUser.email);
    print('${response.statusCode} ${response.body}');
  }

  Future handleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
