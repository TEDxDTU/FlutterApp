import 'package:flutter/material.dart';

class TriviaCardWidget extends StatelessWidget {
  const TriviaCardWidget({
    Key? key,
    required this.title,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.grey,
        ),
        // color: Colors.red,
      ),
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.95),
                Colors.black,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                // flex: 0,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                // flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Play Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
