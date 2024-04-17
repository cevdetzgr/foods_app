
import 'package:bloc/bloc.dart';

class DetaySayfaCubit extends Cubit<int> {
  DetaySayfaCubit() : super(0);

  Future<void> adetArttir() async {
    emit(state + 1);
  }

  Future<void> adetAzalt() async {
    if (state > 0) {
      emit(state - 1);
    } else {}
  }
}