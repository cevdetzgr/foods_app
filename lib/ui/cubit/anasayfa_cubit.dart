
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foods_app/data/entity/yemekler.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit() : super(<Yemekler>[]);

  var collectionYemekler = FirebaseFirestore.instance.collection('yemekler');
  final storageRef = FirebaseStorage.instance.ref();

  Future<void> yemekleriGetir() async {
    collectionYemekler.snapshots().listen((event) {
      var yemeklerListesi = <Yemekler>[];
      var documents = event.docs;

      for (var document in documents) {
        var key = document.id;
        var data = document.data();
        var yemek = Yemekler.fromJson(data, key);
        yemeklerListesi.add(yemek);
      }
      emit(yemeklerListesi);
    });
  }


  Future<void> yemekAra(String aramaKelimesi) async {
    collectionYemekler.snapshots().listen((event) {
      var yemeklerListesi = <Yemekler>[];
      var documents = event.docs;

      for (var document in documents) {
        var key = document.id;
        var data = document.data();
        var yemek = Yemekler.fromJson(data, key);
        if (yemek.yemek_ad.toLowerCase().contains(aramaKelimesi.toLowerCase())) {
          yemeklerListesi.add(yemek);
        }
      }
      emit(yemeklerListesi);
    });
  }
}