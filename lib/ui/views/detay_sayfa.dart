
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/data/entity/yemekler.dart';
import '../cubit/detay_sayfa_cubit.dart';
import 'package:provider/provider.dart';

class DetaySayfa extends StatefulWidget {
  final Yemekler yemek;
  const DetaySayfa({super.key, required this.yemek});


  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    // Yemek bilgileri (foto, isim, fiyatı, sepete ekle butonu, sepete eklenecek ürün sayısını arttırıp azaltma
    return BlocProvider<DetaySayfaCubit>(
      create: (context) => DetaySayfaCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.yemek.yemek_ad),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                FadeInImage(
                  placeholder: const AssetImage('resimler/placeholder.png'),
                  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/yemekler-6b8ce.appspot.com/o/yemekler%2F${widget.yemek.yemek_resim_adi}?alt=media',),
                  fit: BoxFit.cover,
                  height: 256,
                  width: 256,
                  fadeOutDuration: const Duration(milliseconds: 150),
                  fadeInDuration: const Duration(milliseconds: 300),
                ),
                Text("${widget.yemek.yemek_fiyat}₺"),
                Text(widget.yemek.yemek_ad),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<DetaySayfaCubit>().adetAzalt();
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      "${context.watch<DetaySayfaCubit>().state}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<DetaySayfaCubit>().adetArttir();
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
