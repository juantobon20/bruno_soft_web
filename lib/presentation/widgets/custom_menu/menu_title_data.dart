import 'menu_data.dart';

class MenuTitleData {

  final String menuTitle;
  final List<MenuData> options;

  MenuTitleData({
    required this.menuTitle, 
    required this.options
  });

  MenuTitleData copyWith({
    String? menuTitle,
    List<MenuData>? options
  }) => MenuTitleData(
    menuTitle: menuTitle ?? this.menuTitle, 
    options: options ?? this.options
  );
}