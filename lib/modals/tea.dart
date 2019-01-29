import 'dart:math';

class Tea {
  final String id;
  final String code;
  final String name;
  final String brand;
  final int receipt;
  final String description;
  final String mediaUrl;
  final String status;
  final int category;
  final bool isPurchasable;
  final double tinPrice;
  final double refillPrice;

  const Tea(
      {this.id,
      this.code,
      this.name,
      this.brand,
      this.receipt,
      this.description,
      this.mediaUrl,
      this.status,
      this.category,
      this.isPurchasable,
      this.tinPrice,
      this.refillPrice});

  Tea.fromJson(Map json)
      : id = json['id'],
        brand = json['brand'],
        name = json['name'],
        code = json['code'],
        mediaUrl = json['mediaUrl'],
        receipt = new Random().nextInt(300), // todo: remove it
        description = json['description'],
        status = json['status'],
        category = json['category'],
        isPurchasable = json['isPurchasable'],
        tinPrice = json['tinPrice'].toDouble(),
        refillPrice = json['refillPrice'].toDouble();
}
