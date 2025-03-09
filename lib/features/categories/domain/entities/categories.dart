import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Category extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int parent;
  final String description;
  final Image image;
  List<Category> children; // ✅ Removed final to allow modification

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.image,
    List<Category>? children, // Accept a nullable list for children
  }) : children = children ?? []; // Initialize as an empty list if null

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        slug,
        parent,
        children,
      ];

  // You can add a copyWith function if you want to modify the children safely.
  Category copyWith({List<Category>? children}) {
    return Category(
      id: id,
      name: name,
      slug: slug,
      parent: parent,
      description: description,
      image: image,
      children: children ?? this.children, // If no new children, keep existing
    );
  }
}

class Image extends Equatable {
  final int id;
  final String dateCreated;
  final String src;
  final String name;

  const Image({
    required this.id,
    required this.dateCreated,
    required this.src,
    required this.name,
  });

  @override
  List<Object?> get props => [id, dateCreated, src, name];
}
