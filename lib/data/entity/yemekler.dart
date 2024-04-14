
class Yemekler {
  String yemek_id;
  String yemek_ad;
  String yemek_resim_adi;
  int yemek_fiyat;

  Yemekler({
    required this.yemek_id,
    required this.yemek_ad,
    required this.yemek_resim_adi ,
    required this.yemek_fiyat
  });

  factory Yemekler.fromJson(Map<dynamic, dynamic> json, String key) {
    return Yemekler(
      yemek_id: key,
      yemek_ad: json['yemek_ad'] != null ? json['yemek_ad'] as String : '',
      yemek_resim_adi: json['yemek_resim_adi'] != null ? json['yemek_resim_adi'] as String : '',
      yemek_fiyat: json['yemek_fiyat'] != null ? json['yemek_fiyat'] as int : 0,
    );
  }
}