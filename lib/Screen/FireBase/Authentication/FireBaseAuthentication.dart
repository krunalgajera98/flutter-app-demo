import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthentication {
  static final FireBaseAuthentication instance = FireBaseAuthentication.init();

  factory FireBaseAuthentication() => instance;

  FireBaseAuthentication.init();

  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static String? otpVerificationId;

  //////////////     Login Anonymously     /////////////////////

  static Future<UserCredential> loginAnonymously() async {
    UserCredential userCredential = await auth.signInAnonymously();
    return userCredential;
  }

  //////////////     Login Google      /////////////////////

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

  //////////////     Login Email      /////////////////////

  static Future<UserCredential> signInWithEmail({String? email, String? password}) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return userCredential;
  }

  static Future<UserCredential> registerWithEmail({String? email, String? password}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return userCredential;
  }

  //////////////     Login MobileNumber      /////////////////////

  static Future<void> loginWithMobileNOTP({String? phoneNumber}) async {
    print("phoneNumber 00 : $phoneNumber");
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneNumber}",
      timeout: Duration(seconds: 60),
      ////////
      verificationCompleted: (PhoneAuthCredential credential) {
        auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {
            print("Varification Complte sucsessful With Mobile number");
          }
        });
      },
      ////////
      codeSent: (String verificationId, int? forceResendingToken) {
        print("codeSent ==> verificationId : $verificationId && forceResendingToken : $forceResendingToken");
        otpVerificationId = verificationId;
      },

      ////////
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout ==> verificationId : $verificationId");
        otpVerificationId = verificationId;
      },
      ////////
      verificationFailed: (FirebaseAuthException e) {
        print("verificationFailed ==> e : $e");
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
    );
    print("phoneNumber 01 : $phoneNumber");
  }

  //////////////     OTP Verification      /////////////////////

  static Future<void> otpVerification({String smsCode = '0'}) async {
    try {
      await auth
          .signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: otpVerificationId!,
          smsCode: smsCode.toString(),
        ),
      )
          .then((value) async {
        if (value.user != null) {
          print("User login with mobile number successfully");
        }
      });
    } catch (e) {
      print("Invalid OTP ==>>${e}");
    }
  }

  //////////////     LogOut      /////////////////////

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
