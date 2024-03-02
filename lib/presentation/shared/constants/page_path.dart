class PagePath {
  static const initial = "/";
  static const signIn = "/signIn";
  static const signUp = "/signUp";
  static const emailVerification = "/emailVerification";
  static const permissionRequest = "/permissionRequest";
  static const initialUserSetting = "/initialUserSetting";
  static const matched = "/matched";
  static const myProfile = "/myProfile";
  static const calendar = "/calendar";

  static profilePage({final String targetUid = ":targetUid"}) =>
      "/profile/$targetUid";

  static memoryDetail({final String targetMemoryId = ":targetMemoryId"}) =>
      "/memoryDetail$targetMemoryId";
}
