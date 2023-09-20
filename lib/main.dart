//ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names

import "package:flutter/material.dart";

//Program specific namespaces
import "package:app05/Views/MainScreen.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() 
{
  runApp(const ProviderScope(child: MainScreen()));
}

