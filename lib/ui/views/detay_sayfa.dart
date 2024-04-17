
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
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
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
                //20px boşluk bırakacak spacer ekle
                const SizedBox(height: 20),
                Text("₺${widget.yemek.yemek_fiyat}",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500
                )),
                Text(
                    widget.yemek.yemek_ad,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                    )
                ),
                const SizedBox(height: 15),
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
                      style: const TextStyle(fontSize: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<DetaySayfaCubit>().adetArttir();
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row( mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Toplam:" , style: TextStyle(fontSize: 20)),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(opacity: animation, child: child,);
                          },
                          child: Text(
                            "${widget.yemek.yemek_fiyat * context.watch<DetaySayfaCubit>().state}₺",
                            key: ValueKey<int>(context.watch<DetaySayfaCubit>().state),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ]
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Sepete ekleme işlemi

                      },
                      child: const Text("Sepete Ekle", style: TextStyle(fontSize: 20)),
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

