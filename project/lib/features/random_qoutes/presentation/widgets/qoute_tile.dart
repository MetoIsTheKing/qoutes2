import 'package:flutter/material.dart';
import 'package:random_qoutes/core/utils/app_colors.dart';
import 'package:random_qoutes/core/utils/helper.dart';

class QouteTile extends StatelessWidget {
  const QouteTile(
      {super.key, required this.author, required this.qouteContent});

  final String author;
  final String qouteContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      alignment: Alignment.center,
      width: context.width - 80,
      height: context.height / 3,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: author,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: qouteContent,
              style: const TextStyle(
                height: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
