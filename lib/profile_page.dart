import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Cover photo
        Container(
          height: 200,
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
          ),
        ),
        // Profile info
        Transform.translate(
          offset: const Offset(0, -50),
          child: Column(
            children: [
              // Profile picture
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 70, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Alex Thompson',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                '1.2K friends',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              // Action buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add to Story'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 8, color: Color(0xFFF0F2F5)),
        // Details section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildDetailItem(Icons.work, 'Works at Tech Company'),
              _buildDetailItem(Icons.school, 'Studied at University'),
              _buildDetailItem(Icons.home, 'Lives in New York'),
              _buildDetailItem(Icons.location_on, 'From California'),
              _buildDetailItem(Icons.favorite, 'Single'),
              _buildDetailItem(Icons.access_time, 'Joined January 2020'),
            ],
          ),
        ),
        const Divider(thickness: 8, color: Color(0xFFF0F2F5)),
        // Friends section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Friends',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See all friends'),
                  ),
                ],
              ),
              Text('1,234 friends', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildFriendItem('Friend ${index + 1}');
                },
              ),
            ],
          ),
        ),
        const Divider(thickness: 8, color: Color(0xFFF0F2F5)),
        // Posts section
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Posts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        _buildPost('Feeling great today!'),
        _buildPost('Just finished a great project!'),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildFriendItem(String name) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.person, size: 40, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildPost(String content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alex Thompson',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2 hours ago',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(content),
          const SizedBox(height: 12),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_outlined),
                label: const Text('Like'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.comment_outlined),
                label: const Text('Comment'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                label: const Text('Share'),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
