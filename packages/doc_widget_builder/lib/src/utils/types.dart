import 'package:analyzer/dart/element/type.dart';

bool hasType(List<InterfaceType> superTypes, String type) =>
    superTypes.any((superType) => superType.getDisplayString() == type);
bool isWidget(List<InterfaceType> superTypes) => hasType(superTypes, 'Widget');
