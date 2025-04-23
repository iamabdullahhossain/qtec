// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

ProductsResponse productsResponseFromJson(String str) => ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) => json.encode(data.toJson());

class ProductsResponse {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  ProductsResponse copyWith({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductsResponse(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int? id;
  final String? title;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final List<Review>? reviews;
  final String? availabilityStatus;
  final List<String>? images;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.price,
    this.discountPercentage,
    this.rating,
    this.reviews,
    this.availabilityStatus,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    availabilityStatus: json["availabilityStatus"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "availabilityStatus": availabilityStatus,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "thumbnail": thumbnail,
  };
}

class Review {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"],
    comment: json["comment"],
    date: json["date"],
    reviewerName: json["reviewerName"],
    reviewerEmail: json["reviewerEmail"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "comment": comment,
    "date": date,
    "reviewerName": reviewerName,
    "reviewerEmail": reviewerEmail,
  };
}
