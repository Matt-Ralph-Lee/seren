import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../constants/l10n/get_app_localizations.dart';

String convertFirebaseAuthExceptionToMessage(dynamic e, BuildContext context) {
  String errorMessage = getAppLocalizations(context).errorMessage;

  if (e == null) {
    return "";
  }
  e = e as FirebaseAuthException;

  switch (e.code) {
    case 'user-not-found':
      errorMessage = getAppLocalizations(context).noUserFound;
      break;
    case 'wrong-password':
      errorMessage = getAppLocalizations(context).wrongPassword;
      break;
    case 'email-already-in-use':
      errorMessage = getAppLocalizations(context).emailAlreadyInUse;
      break;
    case 'invalid-email':
      errorMessage = getAppLocalizations(context).invalidEmail;
      break;
    // 他にも必要なエラーコードがあれば追加してください

    default:
      errorMessage =
          '${getAppLocalizations(context).errorMessage}: ${e.message}';
      break;
  }

  return errorMessage;
}
