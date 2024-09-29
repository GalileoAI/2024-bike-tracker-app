import 'package:anty_rower/providers/driver_screen_provider.dart';
import 'package:anty_rower/ui/driver/audio_player.dart';
import 'package:anty_rower/ui/driver/radar_circle.dart';
import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  final DriverScreenProvider driverScreenProvider;

  const DriverScreen({
    super.key,
    required this.driverScreenProvider,
  });

  @override
  State<StatefulWidget> createState() => DriverScreenState();
}

class DriverScreenState extends State<DriverScreen>
    with SingleTickerProviderStateMixin {
  RepetetiveAudioPlayer repetetiveAudioPlayer =
      RepetetiveAudioPlayer("sounds/scary.mp3");
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Half of total height - AppBar height
    final double screenMiddleVertical =
        (MediaQuery.of(context).size.height / 2 - 56);

    // Half of total width - half of the bicycle icon width
    final double screenMiddleHorizontal =
        (MediaQuery.of(context).size.width / 2 - 15);

    repetetiveAudioPlayer.setWaitTime(
      widget.driverScreenProvider.proximity / 10,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Colors.transparent,
              Colors.lightBlue.shade100,
              Colors.transparent,
            ],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              RadarCircle(
                radius: ((MediaQuery.of(context).size.width - 10) / 2).floor(),
              ),
              RadarCircle(
                radius: ((MediaQuery.of(context).size.width - 100) / 2).floor(),
              ),
              RadarCircle(
                radius: ((MediaQuery.of(context).size.width - 200) / 2).floor(),
              ),
              const Center(
                child: VerticalDivider(
                  color: Colors.black45,
                ),
              ),
              const Center(
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              RotationTransition(
                turns:
                    Tween(begin: 0.0, end: 2.0).animate(_animationController),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: SweepGradient(colors: [
                      Colors.grey.withAlpha(0).withOpacity(0),
                      Colors.lightBlue.shade100,
                      Colors.grey.withAlpha(0).withOpacity(0),
                    ], stops: const [
                      0.2,
                      0.25,
                      0.3,
                    ]),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: screenMiddleVertical +
                    widget.driverScreenProvider.bikePositionRelativeToUser.$1 *
                        30,
                left: screenMiddleHorizontal +
                    widget.driverScreenProvider.bikePositionRelativeToUser.$2 *
                        30,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.red.withOpacity(0.8)),
                  child: const Icon(
                    Icons.pedal_bike,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          repetetiveAudioPlayer.run();
        },
        child: const Icon(Icons.radar),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
