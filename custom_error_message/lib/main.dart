import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: CustomErrorMessage()
));

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Error Message"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomErrorMessageContent(errorMessage: "Flutter default snackbar is showing!"),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0
              )
            );
          },
          child: const Text("This is default")
        )
      )
    );
  }
}

class CustomErrorMessageContent extends StatelessWidget {
  const CustomErrorMessageContent({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 90,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          "Oh, snap!",
                          style: TextStyle(fontSize: 18, color: Colors.white)
                      ),
                      const Spacer(),
                      Text(
                        errorMessage,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            )
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
                "assets/icons/bubbles.svg",
                width: 40,
                height: 48,
                color: const Color(0xFF801336)
            ),
          ),
        ),
        Positioned(
            top: -15,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/fail.svg",
                  height: 40,
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    "assets/icons/close.svg",
                    height: 16,
                  ),
                )
              ],
            )
        )
      ],
    );
  }
}
