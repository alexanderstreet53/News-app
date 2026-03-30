import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class UrlHelper {
  UrlHelper._();

  static Future<bool> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  static Future<void> shareArticle({
    required String title,
    required String url,
  }) async {
    await Share.share(
      '$title\n\n$url\n\nShared via TLDR News App',
    );
  }
}
