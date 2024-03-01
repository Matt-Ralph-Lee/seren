class PagePath {
  static const initial = "/";
  static const signIn = "/signIn";
  static const signUp = "/signUp";
  static const emailVerification = "/emailVerification";
  static const permissionRequest = "/permissionRequest";
  static const initialUserSetting = "/initialUserSetting";
  static const matched = "/matched";

  static profilePage({final String targetUid = ":targetUid"}) =>
      "/profilePage/$targetUid";
}
