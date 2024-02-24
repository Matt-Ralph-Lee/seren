import '../model/profile.dart';
import '../model/property/gender.dart';
import '../model/property/long_intro.dart';
import '../model/property/short_intro.dart';
import '../model/property/user_id.dart';
import 'database.dart';

class ProfileRepository {
  final db = Database.realtimeDatabaes;

  Future<void> setDefault(final UserId userId) async {
    final gender = Gender("other");
    final shortIntro = ShortIntro("");
    final longIntro = LongIntro("");
    final profile = Profile(
      gender: gender,
      shortIntro: shortIntro,
      longIntro: longIntro,
    );

    await db.child("user/${userId.value}/profile").set({
      "gender": profile.gender.value,
      "shortIntro": profile.shortIntro.value,
      "longIntro": profile.longIntro.value,
    });
  }
}
