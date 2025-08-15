import 'package:get_it/get_it.dart';
import 'package:get_stream/utils/token_utils.dart';

final GetIt getIt = GetIt.instance;

abstract interface class DI{
  static Future<void> execute() async{
    getIt.registerSingleton<TokenUtils>(TokenUtilsImpl());
  }
}