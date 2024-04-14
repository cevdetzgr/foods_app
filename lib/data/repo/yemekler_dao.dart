//Sepete ekleme, silme güncelleme işlermleri

import 'package:cloud_firestore/cloud_firestore.dart';

class YemeklerDao {

  var collectionYemekler = FirebaseFirestore.instance.collection("yemekler");
  int addToCartCount = 0;


  Future<void> sepeteEkle(String yemek_id) async {

  }

  Future<void> sepettenSil(String yemek_id) async {

  }

  Future<void> adetArttir() async {
    addToCartCount++;
  }

  Future<void> adetAzalt() async {
    if (addToCartCount > 0) {
      addToCartCount--;
    }else {}
  }
}