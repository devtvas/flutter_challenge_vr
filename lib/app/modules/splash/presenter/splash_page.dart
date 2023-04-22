import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/config/app_routes.dart';
import '../../../core/style/app_style.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final _formKey = GlobalKey<FormState>();
  bool isBlock = false;
  @override
  void initState() {
    super.initState();
    action();
  }

  void action() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      setState(() {
        isBlock = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/splash.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //title
                    const Text("Bem-vindo ao",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 35)),
                    //subtitle
                    Text("VR Education",
                        style: TextStyle(
                            color: AppStyle.primary!,
                            fontWeight: FontWeight.w500,
                            fontSize: 35)),
                    //description
                    const Text(
                      "Estude no conforto da sua casa, com muito aprendizado disponível!",
                      style: TextStyle(
                        color: Color(0xff6F6F79),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    //button
                  ],
                ),
              ),
            ),
            isBlock == false
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed(AppRoute.homeModule);
                    },
                    child: Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppStyle.primary!,
                            Color.fromARGB(255, 228, 191, 147),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Próximo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
