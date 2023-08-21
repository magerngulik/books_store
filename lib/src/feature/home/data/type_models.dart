// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

TypeModel typeModelFromJson(String str) => TypeModel.fromJson(json.decode(str));

String typeModelToJson(TypeModel data) => json.encode(data.toJson());

class TypeModel {
  final List<Books> data;

  TypeModel({
    required this.data,
  });

  TypeModel copyWith({
    List<Books>? data,
  }) =>
      TypeModel(
        data: data ?? this.data,
      );

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        data: List<Books>.from(json["data"].map((x) => Books.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Books {
  final int id;
  final String isbn;
  final String title;
  final String slug;
  final String cover;
  final String synopsis;
  final int price;
  final String year;
  final String author;
  final String publisher;
  final String category;
  final String type;
  final String discount;

  Books({
    required this.id,
    required this.isbn,
    required this.title,
    required this.slug,
    required this.cover,
    required this.synopsis,
    required this.price,
    required this.year,
    required this.author,
    required this.publisher,
    required this.category,
    required this.type,
    required this.discount,
  });

  Books copyWith({
    int? id,
    String? isbn,
    String? title,
    String? slug,
    String? cover,
    String? synopsis,
    int? price,
    String? year,
    String? author,
    String? publisher,
    String? category,
    String? type,
    String? discount,
  }) =>
      Books(
        id: id ?? this.id,
        isbn: isbn ?? this.isbn,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        cover: cover ?? this.cover,
        synopsis: synopsis ?? this.synopsis,
        price: price ?? this.price,
        year: year ?? this.year,
        author: author ?? this.author,
        publisher: publisher ?? this.publisher,
        category: category ?? this.category,
        type: type ?? this.type,
        discount: discount ?? this.discount,
      );

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        id: json["id"],
        isbn: json["isbn"],
        title: json["title"],
        slug: json["slug"],
        cover: json["cover"],
        synopsis: json["synopsis"],
        price: json["price"],
        year: json["year"],
        author: json["author"],
        publisher: json["publisher"],
        category: json["category"],
        type: json["type"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isbn": isbn,
        "title": title,
        "slug": slug,
        "cover": cover,
        "synopsis": synopsis,
        "price": price,
        "year": year,
        "author": author,
        "publisher": publisher,
        "category": category,
        "type": type,
        "discount": discount,
      };
}
