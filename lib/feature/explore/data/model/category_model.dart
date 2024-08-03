import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/category.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  @JsonKey(name: 'idCategory')
  final String idCategory;

  @JsonKey(name: 'strCategory')
  final String strCategory;

  @JsonKey(name: 'strCategoryThumb')
  final String strCategoryThumb;

  @JsonKey(name: 'strCategoryDescription')
  final String strCategoryDescription;

  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  }) : super(
    id: idCategory,
    name: strCategory,
    thumbnail: strCategoryThumb,
    description: strCategoryDescription,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
