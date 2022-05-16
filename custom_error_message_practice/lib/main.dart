import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MaterialApp(
    home: CustomErrorMessagePractice(),
    debugShowCheckedModeBanner: false,
  ));
}

class CustomErrorMessagePractice extends StatelessWidget {
  const CustomErrorMessagePractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Error Message Practice"),
        backgroundColor: Colors.deepPurple
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomErrorMessagePracticeContent(errorMessage: "Flutter default snackbar is showing!"),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          },
          child: const Text("Click Me!")
        )
      )
    );
  }
}

class CustomErrorMessagePracticeContent extends StatelessWidget {
  const CustomErrorMessagePracticeContent({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            height: 90,
            child: Row(
              children: [
                const SizedBox(width: 48),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Oh! snap",
                        style: TextStyle(fontSize: 18)
                    ),
                    const Spacer(),
                    Text(
                        errorMessage,
                        style: TextStyle(fontSize: 14)
                    ),
                  ],
                ),
              ],
            )
        ),
        Positioned(
          top: -15,
          left: 10,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/fail.svg",
                height: 48,
              ),
              Positioned(
                top: 15,
                child: SvgPicture.asset(
                  "assets/icons/close.svg",
                  height: 16,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0)),
            child: SvgPicture.asset(
                "assets/icons/bubbles.svg",
                width: 40,
                height: 48
            ),
          ),
        )
      ],
    );
  }
}

