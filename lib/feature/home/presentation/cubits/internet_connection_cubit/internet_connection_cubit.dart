import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_state.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit() : super(InternetConnectionInitialState());

  static InternetConnectionCubit get(context) => BlocProvider.of(context);

  bool isInternet = true;

  Future<void> checkInternetConnection() async {
    isInternet = await InternetConnectionChecker().hasConnection;
    emit(CheckInternetConnection());
  }
}
