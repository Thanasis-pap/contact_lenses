import 'dart:math';

class Tips {
  static List<String> tipsList = [
    'Don\'t share contact lenses with others.',
    'Don\'t use tap water, saliva or anything than the recommended lens solution to clean and soak lenses.',
    'Don\'t wear your contact lenses longer than instructed.',
    'Don\'t reuse or top up lens solution in the lens storage case.',
    'Don\'t touch the tip of solution bottles with other surfaces - including contact lenses, fingers or eyes.',
    'Don\'t change your contact lens solution without asking the optometrist.',
    'Wash your hands before handling your contact lenses.',
    'Don\'t swim or shower in contact lenses.',
    'Wash your lenses after use with your solution.',
    'If you are wearing lenses, close your eyes when using hairspray.',
  ];

  static String selectTip() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    return tipsList[randomNumber];
  }
}
