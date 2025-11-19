// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String title;
    String content;
    String thumbnail;
    int price;
    int stock;
    String size;
    String team;
    int productViews;
    DateTime createdAt;
    bool isFeatured;
    int userId;

    ProductEntry({
        required this.id,
        required this.title,
        required this.content,
        required this.thumbnail,
        required this.price,
        required this.stock,
        required this.size,
        required this.team,
        required this.productViews,
        required this.createdAt,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        stock: json["stock"],
        size: json["size"],
        team: json["team"],
        productViews: json["product_views"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "thumbnail": thumbnail,
        "price": price,
        "stock": stock,
        "size": size,
        "team": team,
        "product_views": productViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
