import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/custom%20widgets/logo_widget.dart';
import 'package:mobile/event_info_card.dart';
import 'package:mobile/models/test_models.dart';
import 'package:mobile/route/rutes.dart';

class SingleEventScreen extends ConsumerStatefulWidget {
  final Event event;

  const SingleEventScreen({
    super.key,
    required this.event,
  });

  @override
  ConsumerState<SingleEventScreen> createState() => _SingleEventScreenState();
}

class _SingleEventScreenState extends ConsumerState<SingleEventScreen> {
  _SingleEventScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 15.0, bottom: 15.0),
            child: LogoWidget(),
          ),
          EventInfoCard(event: widget.event),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce viverra turpis non purus ullamcorper, a feugiat augue varius. In hac habitasse platea dictumst. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus eget sapien sed odio sagittis tempor.\n\nNullam scelerisque urna a metus vestibulum tincidunt. Sed semper scelerisque nibh, nec cursus odio. Sed dignissim justo non mauris tincidunt, at tristique neque vestibulum. Etiam dapibus urna sit amet diam cursus, ac eleifend urna vehicula. Sed pharetra libero et pharetra cursus.\n\nInteger ac varius sem. Sed aliquam ut justo at laoreet. Sed id ex nec risus tincidunt vehicula.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddddddddddddddddddd',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.redAccent,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.payment);
                
                
              },
              child: Center(
                child: Text(
                  'Kupi ulaznicu'.toUpperCase(),
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final eventSenderProvider = StateProvider<List<Event>?>((ref) => []);
