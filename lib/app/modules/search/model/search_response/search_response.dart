import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  SearchResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  SearchResponse copyWith({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) =>
      SearchResponse(
        products: products ?? this.products,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
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

  Product copyWith({
    int? id,
    String? title,
    double? price,
    double? discountPercentage,
    double? rating,
    List<Review>? reviews,
    String? availabilityStatus,
    List<String>? images,
    String? thumbnail,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        reviews: reviews ?? this.reviews,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        images: images ?? this.images,
        thumbnail: thumbnail ?? this.thumbnail,
      );

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

  Review copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) =>
      Review(
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        date: date ?? this.date,
        reviewerName: reviewerName ?? this.reviewerName,
        reviewerEmail: reviewerEmail ?? this.reviewerEmail,
      );

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
