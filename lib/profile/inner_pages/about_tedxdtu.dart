import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class AboutTedxDtu extends StatelessWidget {
  const AboutTedxDtu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: Image.asset('assets/images/tedxdtu_with_subtitle.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextWithLottie(
                text:
                    "There is one thing stronger than all the armies in the world, an idea whose time has come. Everything begins with an idea, a thought that provokes action and an intention that brings change.",
                lottie: 'assets/lottie/idea.json',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF383838),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(17),
                child: Column(
                  children: [
                    const Text(
                      "Among many stories that need to be told and a plethora of ideas that need to be implemented, TEDxDTU brings to life the very soul of such eloquent ponderings.\nWe envision delivering impactful and worthwhile ideas that hold the potential to spark a change, ignite ambition and bring about the difference that needs to be made. ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Lottie.asset('assets/lottie/team_whoooa.json'),
                    const Text(
                      "TEDxDTU is a self-organized branch of the humongous non-profit organization TEDx. that bears ideas as tasteful as a fruit that one reaps from a blossoming and ever-growing tree. From hosting the versatile, robust and inspiring Kiran Bedi to world-renowned Indian car designer Dilip Chhabria, from discussing the future of technology to the dilemmas faced by today's youth. TEDxDTU has never failed to convey words of wisdom through influential voices and through the people who have met the thick and thins of life.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 8,
                          child: Text(
                            "Our motto is to enlighten people, to chisel in an idea that can drive necessary change, to impact fellow humans with powerful words, to ask people to keep heart, to ask them to believe that life is worth all the hustle and to appeal to a world that is ready to grow, ready to flourish and to welcome to new and better possibilities.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 7,
                            child:
                                Lottie.asset('assets/lottie/flying_man.json')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWithLottie extends StatelessWidget {
  const TextWithLottie({Key? key, required this.text, required this.lottie})
      : super(key: key);
  final String text;
  final String lottie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(17),
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 17,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: SizedBox(child: Lottie.asset(lottie)),
        ),
      ],
    );
  }
}
