import 'dart:math';

String formatBytes(int bytes) {
  if (bytes <= 0) return "0 B";
  const dimensions = ["B", "KB", "MB"];
  var i = (log(bytes) / log(1000)).floor();
  return '${(bytes / pow(1000, i)).toStringAsFixed(1)} ${dimensions[i]}';
}
