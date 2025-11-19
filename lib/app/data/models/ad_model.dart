import 'dart:convert';

class AdModel {
  final String id;
  final String title;
  final String? arabicDescription;
  final String? englishDescription;
  final double price;
  final bool isNegotiable;
  final bool isAuction;
  final DateTime? auctionEndTime;
  final double? minimumBidIncrease;
  final int countryId;
  final int cityId;
  final int areaId;
  final double latitude;
  final double longitude;
  final String userPhoneId;
  final DateTime createdAt;

  AdModel({
    required this.id,
    required this.title,
    this.arabicDescription,
    this.englishDescription,
    required this.price,
    required this.isNegotiable,
    required this.isAuction,
    this.auctionEndTime,
    this.minimumBidIncrease,
    required this.countryId,
    required this.cityId,
    required this.areaId,
    required this.latitude,
    required this.longitude,
    required this.userPhoneId,
    required this.createdAt,
  });

  /// Convert JSON to model
  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      title: json['title'],
      arabicDescription: json['arabicDescription'],
      englishDescription: json['englishDescription'],
      price: (json['price'] as num).toDouble(),
      isNegotiable: json['isNegotiable'],
      isAuction: json['isAuction'],
      auctionEndTime: json['auctionEndTime'] != null
          ? DateTime.parse(json['auctionEndTime'])
          : null,
      minimumBidIncrease: json['minimumBidIncrease'] != null
          ? (json['minimumBidIncrease'] as num).toDouble()
          : null,
      countryId: json['countryId'],
      cityId: json['cityId'],
      areaId: json['areaId'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      userPhoneId: json['userPhoneId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'arabicDescription': arabicDescription,
      'englishDescription': englishDescription,
      'price': price,
      'isNegotiable': isNegotiable,
      'isAuction': isAuction,
      'auctionEndTime': auctionEndTime?.toIso8601String(),
      'minimumBidIncrease': minimumBidIncrease,
      'countryId': countryId,
      'cityId': cityId,
      'areaId': areaId,
      'latitude': latitude,
      'longitude': longitude,
      'userPhoneId': userPhoneId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Helper for parsing list of ads
  static List<AdModel> listFromJson(List<dynamic> list) {
    return list.map((e) => AdModel.fromJson(e)).toList();
  }

  /// Convert to JSON string
  String toRawJson() => json.encode(toJson());

  /// Parse from JSON string
  factory AdModel.fromRawJson(String str) =>
      AdModel.fromJson(json.decode(str));
}
