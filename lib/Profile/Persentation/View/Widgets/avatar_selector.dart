import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/HelperElements/ProfileAvaters.dart';

class AvatarSelector extends StatelessWidget {
  final int selectedAvatarId;
  final ValueChanged<int> onAvatarSelected;

  const AvatarSelector({
    super.key,
    required this.selectedAvatarId,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Avatar",
          style: TextStyle(
            color: AppColors.MainColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: avaters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final avatar = avaters[index];
              bool selected = selectedAvatarId == avatar.ID;
              return GestureDetector(
                onTap: () => onAvatarSelected(avatar.ID),
                child: CircleAvatar(
                  radius: selected ? 45 : 40,
                  backgroundColor: selected ? Colors.yellow : Colors.grey[800],
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(avatar.IMGurl),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
