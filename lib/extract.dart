import 'package:archive/archive_io.dart';

Future<void> extract(Map params) async {
  return extractFileToDisk(params["archive"], params["destination"]);
}
