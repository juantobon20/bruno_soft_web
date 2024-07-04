import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0XFFEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700)
                const SideBar(),
          
              Expanded(
                child: Column(
                  children: [
                    const NavBar(),
                    //View
                    Expanded(child: Container(
                      
                      child: Center(
                        child: Column(
                          children: [
                            PrimaryButton(text: "Hola", onPressedCallback: () {},),
                            SeconadyButton(text: "Hola", onPressedCallback: () {},),
                            TertiaryButton(text: "Hola", onPressedCallback: () {},),

                            CustomTextField(
                              labelText: "Esto es una prueba",
                            ),

                            CustomPasswordTextField(
                              labelText: "Esto es una prueba",
                            ),

                            titleText(text: "Prueba1"),
                            primaryText(text: "Prueba1"),
                            secondaryText(text: "Prueba1"),
                            tertiaryText(text: "Prueba1"),
                          ],
                        )
                      ),
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}