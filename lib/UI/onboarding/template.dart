import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:flutter/material.dart';

import 'data/sliding_data.dart';

class SlidingPages extends StatelessWidget {
  const SlidingPages({
    super.key,
    required this.index,
    required this.goToNext,
    required this.skip,
  });
  final int index;
  final void Function() goToNext;
  final void Function() skip;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          // if (index == 2)
          Positioned(
            top: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: index == 2 ? 60 : 90,
              ),
              child: SizedBox(
                width: size.width,
                height: index == 2 ? size.height * 0.65 : size.height * 0.3,
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.06, 0, size.width * 0.06, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                            color: index >= 0 ? Colors.white : Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Container(
                          height: 4,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                            color: index >= 1 ? Colors.white : Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Container(
                          height: 4,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                            color: index == 2 ? Colors.white : Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.45),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.06, 10, size.width * 0.06, 20),
                    child: Text(
                      titles[index],
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.06, 0, size.width * 0.06, 30),
                    child: Text(
                      descriptions[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.06, 0, size.width * 0.06, 0),
                    child: SizedBox(
                      // width: size.width * 0.8,
                      width: double.infinity,
                      height: 55,
                      child: Button(
                        onPressed: index != 2 ? goToNext : skip,
                        text: 'Continue',
                        loading: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (index != 2)
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: Button(
                        onPressed: skip,
                        text: 'Skip',
                        withoutBackground: true,
                        loading: false,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
