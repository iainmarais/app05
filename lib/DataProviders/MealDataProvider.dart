//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names, camel_case_types
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app05/DataSources/MealItem_SourceData.dart";

final Provider MealDataProvider = Provider((ref)
{
  return MealItems;
});
