// To parse this JSON data, do
//
//     final getProductResponse = getProductResponseFromJson(jsonString);

import 'dart:convert';

List<GetProductResponse> getProductResponseFromJson(String str) =>
    List<GetProductResponse>.from(
        json.decode(str).map((x) => GetProductResponse.fromJson(x)));

String getProductResponseToJson(List<GetProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  int quantity = 0;

  GetProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.quantity = 0,
  });

  factory GetProductResponse.fromJson(Map<String, dynamic> json) =>
      GetProductResponse(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        price: json["price"] != null ? json["price"].toDouble() : 0.0,
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        image: json["image"] ?? "",
        rating: json["rating"] != null ? Rating.fromJson(json["rating"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "title": title ?? "",
        "price": price ?? 0.0,
        "description": description ?? "",
        "category": category ?? "",
        "image": image ?? "",
        "rating": rating?.toJson(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"] != null ? json["rate"].toDouble() : 0.0,
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "rate": rate ?? 0.0,
        "count": count ?? 0,
      };
}
