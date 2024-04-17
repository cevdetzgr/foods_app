
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foods_app/data/entity/sepet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YemeklerDao {

  Future<List<Sepet>> sepetiGetir() async {
    var sepetYemek = await SharedPreferences.getInstance();
    var yemekler = await FirebaseFirestore.instance.collection('yemekler').get();
    List<Sepet> sepetList = [];

    for (var yemek in yemekler.docs) {
      int? adet = sepetYemek.getInt(yemek.id);
      if (adet != null) {
        sepetList.add(Sepet.fromJson(yemek.data(), yemek.id, adet));
      }
    }
    return sepetList;
  }

  Future<void> sepeteEkle(String yemek_id, int adet) async {
    var sepetYemek = await SharedPreferences.getInstance();
    adet = adet + (sepetYemek.getInt(yemek_id) ?? 0);
    sepetYemek.setInt(yemek_id, adet);
  }

  Future<void> sepettenCikar(String yemek_id) async {
    var sepetYemek = await SharedPreferences.getInstance();
    int? currentAdet = sepetYemek.getInt(yemek_id);

    if (currentAdet != null && currentAdet > 1) {
      sepetYemek.setInt(yemek_id, currentAdet - 1);
    } else {
      sepetYemek.remove(yemek_id);
    }
  }
}