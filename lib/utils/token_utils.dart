import '../exports.dart';

abstract interface class TokenUtils{
  String generateDevToken(String userId);
}
class TokenUtilsImpl extends TokenUtils {
  @override
  String generateDevToken(String userId) {
    // const String apiKey = Config.apiKey;
    const String apiSecret = Config.secret;

    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = {
      'user_id': userId,
      'iss': 'stream',
      'iat': now,
      'exp': now + 24 * 60 * 60,
    };

    final jwt =
    JWT(payload).sign(SecretKey(apiSecret), algorithm: JWTAlgorithm.HS256);
    return jwt;
  }
}