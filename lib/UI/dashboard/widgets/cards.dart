import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utils/widgets/text_styles.dart';
import 'buttons.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.onClose,
  });
  final IconData icon;
  final String title;
  final String description;
  final void Function()? onTap;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap ?? () {},
      child: Container(
        height: 150,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: SquaredButton(
                    icon: Icon(icon, size: 15),
                    onPressed: () {},
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onClose,
                  child: const Icon(Icons.close_rounded, size: 18),
                )
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: ThemeTextStyle.bodySmall(
                context,
                bold: true,
              ).copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              maxLines: 3,
              style: ThemeTextStyle.bodySmall(
                context,
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageBanner extends StatelessWidget {
  const ImageBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    required this.image,
    this.onIconTap,
    this.imageWidth,
  });
  final IconData icon;
  final String title;
  final String description;
  final void Function()? onTap;
  final void Function()? onIconTap;
  final String image;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap ?? () {},
      child: Container(
        height: 150,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              right: 0,
              child: SizedBox(
                width: size.width * 0.4 > (imageWidth ?? 110)
                    ? imageWidth ?? 110
                    : size.width * 0.4,
                height: 110,
                child: SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.52,
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: SquaredButton(
                            icon: Icon(icon, size: 15),
                            onPressed: onIconTap ?? () {},
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          title,
                          style: ThemeTextStyle.bodySmall(
                            context,
                            bold: true,
                          ).copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          description,
                          maxLines: 3,
                          style: ThemeTextStyle.bodySmall(
                            context,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquaredCard extends StatelessWidget {
  const SquaredCard({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
    this.isIcon = false,
    required this.svg,
  });
  final IconData? icon;
  final String title;
  final String svg;
  final bool isIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap ?? () {},
      child: Container(
        height: 130,
        width: size.width * 0.425,
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: SquaredButton(
                icon: isIcon ? Icon(icon, size: 15) : SvgIcon(path: svg),
                onPressed: () {},
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: ThemeTextStyle.bodySmall(
                context,
                bold: true,
              ).copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          child: Text(
            title,
            style: ThemeTextStyle.bodyMedium(
              context,
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          child: Text(
            data,
            style: ThemeTextStyle.bodyMedium(context),
          ),
        ),
      ],
    );
  }
}

class BitcoinAddress extends StatefulWidget {
  const BitcoinAddress({
    super.key,
    required this.bitcoinAddress,
  });
  final String bitcoinAddress;

  @override
  State<BitcoinAddress> createState() => _BitcoinAddressState();
}

class _BitcoinAddressState extends State<BitcoinAddress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          width: 1.2,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bitcoin address',
                  style: ThemeTextStyle.bodyMedium(
                    context,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.9),
                  ),
                ),
                Text(
                  widget.bitcoinAddress,
                  style: ThemeTextStyle.bodySmall(
                    context,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.9),
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
                padding: const EdgeInsets.all(5),
                child: SquaredButton(
                    icon: const Icon(Icons.copy_outlined), onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
