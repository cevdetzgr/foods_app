
import 'package:bloc/bloc.dart';
import 'package:foods_app/data/repo//yemekler_dao.dart';

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