import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  await _initDependencies();
}

Future<void> _initDependencies() async {
  getIt.registerFactory(AppCubit.new);
}
