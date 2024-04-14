import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/yemekler.dart';
import '../cubit/anasayfa_cubit.dart';
import 'detay_sayfa.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

var collectionYemekler = FirebaseFirestore.instance.collection("yemekler");

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().yemekAra(aramaSonucu);
          },
        ) :
        const Text("Anasayfa"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().yemekleriGetir();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            return GridView.builder(
                itemCount: yemeklerListesi.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                ),
              itemBuilder: (context, index) {
                  var yemek = yemeklerListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetaySayfa(yemek: yemek)));
                    },
                    child: Card(
                      child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FadeInImage(
                            placeholder: const AssetImage('resimler/placeholder.png'),
                            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/yemekler-6b8ce.appspot.com/o/yemekler%2F${yemek.yemek_resim_adi}?alt=media',),
                            fit: BoxFit.cover,
                            height: 128,
                            width: 128,
                            fadeOutDuration: const Duration(milliseconds: 150),
                            fadeInDuration: const Duration(milliseconds: 300),
                          ),
                          Text(yemek.yemek_ad,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const Text(
                              "Ücretsiz Gönderim",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12)),
                          Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("₺ ${yemek.yemek_fiyat}",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 15)
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_shopping_cart,),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  );
              }
            );
          } else {
            return const Center();
          }
        },
      )
    );
  }
}
