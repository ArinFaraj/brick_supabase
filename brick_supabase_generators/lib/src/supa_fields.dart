import 'package:analyzer/dart/element/element.dart';
import 'package:brick_build/generators.dart';
import 'package:brick_core/field_serializable.dart';

// in a real-world equivalent, this is an annotation
class Supa implements FieldSerializable {
  final String? path;

  @override
  final String name;

  @override
  final String? defaultValue;

  @override
  final bool enumAsString;

  @override
  final bool ignore;

  @override
  final bool ignoreFrom;

  @override
  final bool ignoreTo;

  @override
  final String? fromGenerator;

  @override
  final String? toGenerator;

  @override
  final bool nullable;

  const Supa({
    this.path,
    required this.name,
    this.defaultValue,
    this.enumAsString = false,
    this.ignore = false,
    this.ignoreFrom = false,
    this.ignoreTo = false,
    this.fromGenerator,
    this.toGenerator,
    this.nullable = false,
  });
}

/// Convert `@Supa` annotations into digestible code
class _SupaSerdesFinder extends AnnotationFinder<Supa> {
  _SupaSerdesFinder();

  @override
  Supa from(element) {
    final obj = objectForField(element);

    if (obj == null) {
      return const Supa(name: '');
    }

    return Supa(
      name: '',
      path: obj.getField('path')?.toStringValue(),
    );
  }
}

/// Discover all fields with `@Supa`
class SupaFields extends FieldsForClass<Supa> {
  @override
  final finder = _SupaSerdesFinder();

  SupaFields(ClassElement element) : super(element: element);
}
