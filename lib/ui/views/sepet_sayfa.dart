
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/sepet.dart';
import '../cubit/sepet_sayfa_cubit.dart';


class SepetSayfa extends StatefulWidget {
  const SepetSayfa({super.key});

  @override
  State<SepetSayfa> createState() => _SepetSayfaState();
}


class _SepetSayfaState extends State<SepetSayfa> {

  @override
  void initState() {
    super.initState();
    context.read<SepetSayfaCubit>().sepetiGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: const Text("Sepet"),
      ),
      body: BlocBuilder<SepetSayfaCubit, List<Sepet>>(
        builder: (context, sepetListesi) {
          if (sepetListesi.isNotEmpty) {
            return ListView.builder(
                itemCount: sepetListesi.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(sepetListesi[index].yemek_ad),
                    subtitle: Text(sepetListesi[index].yemek_adet.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<SepetSayfaCubit>().sepettenCikar(sepetListesi[index].yemek_id);
                      },
                    )
                  );
                });
          } else {
            return const Center(child: Text("Sepetinizde ürün bulunmamaktadır."));
          }
        },
      ),
    );
  }
}
