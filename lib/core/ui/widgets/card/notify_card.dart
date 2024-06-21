import 'package:find_food/features/model/notify_model.dart';
import 'package:flutter/material.dart';

class NotifyCard extends StatelessWidget {
  final String? img;
  final String? title;
  final String? description;
  final String? createAt;
  final NotifyModel notify;

  NotifyCard(
      {super.key,
      this.img,
      this.title,
      this.description,
      this.createAt,
      required this.notify});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (img != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: 120.0,
                  height: 100.0,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(img ?? ''),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
            ],
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        createAt ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
