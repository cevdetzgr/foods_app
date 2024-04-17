
import 'package:bloc/bloc.dart';
import '../../data/entity/sepet.dart';
import '../../data/repo/yemekler_dao.dart';

class SepetSayfaCubit extends Cubit<List<Sepet>> {
  SepetSayfaCubit() : super(<Sepet>[]);

  var yrepo = YemeklerDao();

  Future<void> sepetiGetir () async {
    var sepetList = await yrepo.sepetiGetir();
    emit(sepetList);
  }

  Future<void> sepettenCikar(String yemekId) async {
    await yrepo.sepettenCikar(yemekId);
    await sepetiGetir();
  }

}