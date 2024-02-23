import 'property/gender.dart';
import 'property/long_intro.dart';
import 'property/short_intro.dart';

class Profile {
  final Gender _gender;
  final ShortIntro _shortIntro;
  final LongIntro _longIntro;

  Gender get gender => _gender;
  ShortIntro get shortIntro => _shortIntro;
  LongIntro get longIntro => _longIntro;

  Profile({
    required final Gender gender,
    required final ShortIntro shortIntro,
    required final LongIntro longIntro,
  })  : _gender = gender,
        _shortIntro = shortIntro,
        _longIntro = longIntro;
}
