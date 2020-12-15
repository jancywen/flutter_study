

/// 时:分
String shortTime(String timeStr) {
  var date = DateTime.parse(timeStr);
  return "${date.hour.toString()}:${date.minute.toString()}";
}


/// 格式化
/// 1小时内显示：N分钟前
/// 24小时内：N小时前
/// 超过24小时：yyyy-MM-dd
String formattingTime(String timeStr) {
  var date = DateTime.parse(timeStr);
  if (date == null) {
    return "";
  }
  var now = DateTime.now();
  // 计算时间差
  var difference = now.difference(date);
  if (difference.inHours < 1) {
    return "${difference.inMinutes}分钟前";
  }else if (difference.inDays < 1) {
    return "${difference.inHours}小时前";
  }else {
    return "${date.year.toString()}-${date.month.toString()}-${date.day.toString()}";
  }
  
}