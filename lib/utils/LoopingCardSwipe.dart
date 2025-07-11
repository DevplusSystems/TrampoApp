import 'package:flutter/material.dart';

class LoopingCardSwipe extends StatefulWidget {
  final List<String> cardContents;
  final Duration animationDuration;

  const LoopingCardSwipe({
    required this.cardContents,
    this.animationDuration = const Duration(seconds: 2),
    Key? key,
  }) : super(key: key);

  @override
  _LoopingCardSwipeState createState() => _LoopingCardSwipeState();
}

class _LoopingCardSwipeState extends State<LoopingCardSwipe> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(reverse: true); // Repeat the animation to create a looping effect
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = 0; i < widget.cardContents.length; i++)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Adjust the position of each card
              double position = (i - currentCardIndex) * 100.0;

              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: (i == currentCardIndex)
                    ? position + (_controller.value * 100) // Animate swipe
                    : position, // Keep other cards in place
                child: SwipeCard(content: widget.cardContents[i]),
              );
            },
          ),
      ],
    );
  }

  // Trigger to move to the next card in the loop
  void swipeCard() {
    setState(() {
      currentCardIndex = (currentCardIndex + 1) % widget.cardContents.length;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SwipeCard extends StatelessWidget {
  final String content;

  const SwipeCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Text(content)),
      ),
    );
  }
}
