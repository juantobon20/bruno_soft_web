import 'package:flutter/material.dart';

import '../../../configs/config.dart';
import '../widgets.dart';

class MenuItem extends StatefulWidget {

  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const MenuItem({
    super.key, 
    required this.text, 
    required this.icon, 
    this.isActive = false,
    required this.onPressed
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorSchemeFromContext();
    final Color background = isHovered
        ? colorScheme.primary.withOpacity(0.1)
        : widget.isActive ? colorScheme.primary 
        : Colors.transparent;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: _buildBoxDecoration(color: background),
      child: Container(
        decoration: _buildBoxDecoration(color: background),
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) => _updateIsHovered(true),
              onExit: (_) => _updateIsHovered(false),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon, 
                    color: widget.isActive ? Colors.white : CustomColors.primaryText
                  ),
                  
                  const SizedBox(width: 10),

                  secondaryText(
                    text: widget.text,
                    textColor: widget.isActive ? Colors.white : CustomColors.primaryText
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  BoxDecoration _buildBoxDecoration({
    required Color color,
  }) => BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(16)
  );

  void _updateIsHovered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}