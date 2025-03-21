import 'package:caphore/features/categories/domain/entities/categories.dart';

// ignore: must_be_immutable
class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.name,
    required super.parent,
    required super.description,
    required super.slug,
    required super.image,
    required super.children,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        parent: json['parent'] ?? 0,
        description: json['description'] ?? '',
        image: ImageModel.fromJson(
          json['image'] ??
              {
                "id": 0,
                "date_created": "",
                "src": "",
                "name": "",
              },
        ),
        children: [],
      );
}

class ImageModel extends Image {
  const ImageModel(
      {required super.id,
      required super.dateCreated,
      required super.src,
      required super.name});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'],
      dateCreated: json['date_created'],
      src: json['src'],
      name: json['name']);
}
