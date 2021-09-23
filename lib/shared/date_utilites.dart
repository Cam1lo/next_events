class DateUtilities {
  static String formatTimeRemaining(DateTime date) {
    String result = '';

    Duration diff2 = date.difference(DateTime.now());
    int minutes = ((diff2.inMinutes % 60).abs());
    int hours = (diff2.inHours % 24.abs());
    int days = (diff2.inDays % 30.abs());
    int months = ((diff2.inDays / 30) % 12.abs()).floor();
    int years = (diff2.inDays / 365.abs()).floor();

    if (years != 0) {
      result += "${years}y ";
      if (months != 0) {
        result += "${months}m ";
      }
    } else if (months != 0) {
      result += "${months}m ";
      if (days != 0) {
        result += "${days}d ";
      }
    } else if (days != 0) {
      result += "${days}d ";
      if (hours != 0) {
        result += "${hours}h ";
      }
    } else if (hours != 0) {
      result += "${hours}h ";
      if (minutes != 0) {
        result += "${minutes}min";
      }
    } else if (minutes != 0) {
      result += "${minutes}min";
    }

    return result;
  }
}
