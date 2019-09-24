class Utils {
  static String duration2hal(Duration dur) {
    final int days = dur.inDays;
    final int hours = (dur.inHours - dur.inDays * 24);
    final int minutes = (dur.inMinutes - dur.inHours * 60);
    final int seconds = (dur.inSeconds - dur.inMinutes * 60);
    return days > 0
        ? "${days}d ${hours}h ${minutes}m ${seconds}s"
        : hours > 0
            ? "${hours}h ${minutes}m ${seconds}s"
            : minutes > 0
                ? "${minutes}m ${seconds}s"
                : seconds > 0 ? "${seconds}s" : "";
  }
}
