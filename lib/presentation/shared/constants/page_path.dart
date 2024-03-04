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
  static const chatList = "/chatList";
  static const friendList = "/friendList";

  static profile({final String targetUid = ":targetUid"}) =>
      "/profile/$targetUid";

  static chatRoom({final String chatId = ":chatId"}) => "/chatRoom/$chatId";

  static memoryDetail({final String targetMemoryId = ":targetMemoryId"}) =>
      "/memoryDetail$targetMemoryId";
}
