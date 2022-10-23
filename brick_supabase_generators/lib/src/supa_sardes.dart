import 'package:analyzer/dart/element/element.dart';
import 'package:brick_build/generators.dart';
import 'package:source_gen/source_gen.dart';

import 'supa_deserialize.dart';
import 'supa_fields.dart';
import 'supa_serialize.dart';

/// In a real-world scenario, this would be a class containing model-level config information
class SupaSerializable {
  const SupaSerializable();
  static const defaults = SupaSerializable();
}

/// This class would be invoked and created for a build step or function
class SupaSerdes extends ProviderSerializableGenerator<SupaSerializable> {
  /// Repository prefix passed to the generators. `Repository` will be appended and
  /// should not be included.
  final String repositoryName;

  SupaSerdes(
    Element element,
    ConstantReader reader, {
    required this.repositoryName,
  }) : super(element, reader, configKey: 'supaConfig');

  @override
  List<SerdesGenerator> get generators {
    final classElement = element as ClassElement;
    final fields = SupaFields(classElement);
    return [
      SupaDeserialize(classElement, fields, repositoryName: repositoryName),
      SupaSerialize(classElement, fields, repositoryName: repositoryName),
    ];
  }
}
