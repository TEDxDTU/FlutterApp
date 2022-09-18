import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_acknowledge_customclipper.dart';

class TriviaAcknowledgeConditions extends StatelessWidget {
  const TriviaAcknowledgeConditions(
      {Key? key,
      required this.child,
      required this.icon,
      required this.image,
      required this.term,
      required this.termDetailed})
      : super(key: key);

  final String term;
  final String termDetailed;
  final IconData icon;
  final Image image;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 40.0,
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Expanded(
                    child: Text(
                      term,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: image),
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: TriviaCustomClipper(),
              child: Container(
                color: const Color(0xffD2D2D2),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Text(
                          termDetailed,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(left: 50, right: 50, bottom: 0, child: child)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
