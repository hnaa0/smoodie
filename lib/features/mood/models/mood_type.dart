enum MoodType {
  happy,
  grateful,
  calm,
  free,
  excited,
  confident,
  sad,
  angry,
  stressed,
  tired,
  anxious,
  content,
  lonely,
  confused,
  depressed;

  int get color => switch (this) {
        MoodType.happy => 0xffF9DC5C,
        MoodType.calm => 0xffD9ED92,
        MoodType.sad => 0xffA0C4FF,
        MoodType.angry => 0xffFFADAD,
        MoodType.stressed => 0xffE2E2DF,
        MoodType.tired => 0xffDAB894,
        MoodType.excited => 0xffF8AD34,
        MoodType.anxious => 0xffBDB2FF,
        MoodType.content => 0xff9CEAEF,
        MoodType.lonely => 0xffEA9AB2,
        MoodType.confused => 0xff7DCFB6,
        MoodType.grateful => 0xffF7D08A,
        MoodType.depressed => 0xff457B9D,
        MoodType.confident => 0xff93E5AB,
        MoodType.free => 0xffAAE0EF,
      };
}

extension MoodTypeExtension on MoodType {
  static MoodType fromString(String mood) {
    switch (mood) {
      case "happy":
        return MoodType.happy;
      case "calm":
        return MoodType.calm;
      case "sad":
        return MoodType.sad;
      case "angry":
        return MoodType.angry;
      case "stressed":
        return MoodType.stressed;
      case "tired":
        return MoodType.tired;
      case "excited":
        return MoodType.excited;
      case "anxious":
        return MoodType.anxious;
      case "content":
        return MoodType.content;
      case "lonely":
        return MoodType.lonely;
      case "confused":
        return MoodType.confused;
      case "grateful":
        return MoodType.grateful;
      case "depressed":
        return MoodType.depressed;
      case "confident":
        return MoodType.confident;
      case "free":
        return MoodType.free;
      default:
        throw Exception('Invalid mood type');
    }
  }
}
