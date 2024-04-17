
class Sepet {
  String yemek_id;
  String yemek_ad;
  String yemek_resim_adi;
  int yemek_fiyat;
  int yemek_adet;

  Sepet({
    required this.yemek_id,
    required this.yemek_ad,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
    required this.yemek_adet,
  });

  factory Sepet.fromJson(Map<dynamic, dynamic> json, String key, int adet) {
    return Sepet(
      yemek_id: key,
      yemek_ad: json['yemek_ad'] != null ? json['yemek_ad'] as String : '',
      yemek_resim_adi: json['yemek_resim_adi'] != null ? json['yemek_resim_adi'] as String : '',
      yemek_fiyat: json['yemek_fiyat'] != null ? json['yemek_fiyat'] as int : 0,
      yemek_adet: adet,
    );
  }
}