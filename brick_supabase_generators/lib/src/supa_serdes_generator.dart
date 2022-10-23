import 'package:analyzer/dart/element/element.dart';
import 'package:brick_build/generators.dart';
import 'package:brick_core/core.dart' show Model;

import 'supa_fields.dart';

/// This would be in a separate package
abstract class SupaModel extends Model {}

abstract class SupaSerdesGenerator<_Model extends SupaModel>
    extends SerdesGenerator<Supa, _Model> {
  @override
  final String providerName = 'Supa';

  @override
  final String repositoryName;

  SupaSerdesGenerator(
    ClassElement element,
    SupaFields fields, {
    required this.repositoryName,
  }) : super(element, fields);
}
