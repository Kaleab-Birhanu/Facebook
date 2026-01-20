import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'marketplace_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const _HomeTab(),
    const Center(child: Text('Friends', style: TextStyle(fontSize: 24))),
    const MarketplacePage(),
    const Center(child: Text('Notifications', style: TextStyle(fontSize: 24))),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.search, color: Colors.black),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.black,
                size: 20,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1877F2),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _HomeTab extends StatefulWidget {
  const _HomeTab();

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> {
  // State for posts - [isLiked, likeCount, commentCount, showComments]
  final Map<String, Map<String, dynamic>> _postStates = {
    'jane_beach': {
      'isLiked': false,
      'likeCount': 124,
      'commentCount': 23,
      'showComments': false,
      'comments': <String>[],
    },
    'john_project': {
      'isLiked': false,
      'likeCount': 89,
      'commentCount': 15,
      'showComments': false,
      'comments': <String>[],
    },
  };

  final TextEditingController _commentController = TextEditingController();

  void _toggleLike(String postId) {
    setState(() {
      final post = _postStates[postId]!;
      post['isLiked'] = !post['isLiked'];
      post['likeCount'] += post['isLiked'] ? 1 : -1;
    });
  }

  void _toggleComments(String postId) {
    setState(() {
      _postStates[postId]!['showComments'] =
          !_postStates[postId]!['showComments'];
    });
  }

  void _addComment(String postId, String comment) {
    if (comment.trim().isNotEmpty) {
      setState(() {
        _postStates[postId]!['comments'].add(comment);
        _postStates[postId]!['commentCount']++;
      });
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Stories section
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _buildCreateStory(),
                _buildStoryItem('Friend 1', Colors.blue),
                _buildStoryItem('Friend 2', Colors.green),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Post input
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "What's on your mind?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPostOption(Icons.videocam, 'Live', Colors.red),
                  _buildPostOption(Icons.photo_library, 'Photo', Colors.green),
                  _buildPostOption(Icons.video_call, 'Room', Colors.purple),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Sample posts
        _buildPost(
          'jane_beach',
          'Jane Smith',
          '2h',
          'Beautiful day at the beach! 🌊☀️',
          true,
        ),
        const SizedBox(height: 8),
        _buildPost(
          'john_project',
          'John Doe',
          '5h',
          'Just finished my new project! Feeling accomplished 💪',
          false,
        ),
      ],
    );
  }

  Widget _buildCreateStory() {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Icon(Icons.person, size: 40, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const Positioned(
                  top: -15,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF1877F2),
                    radius: 15,
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Create story',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String name, Color color) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.7), color],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1877F2), width: 3),
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostOption(IconData icon, String label, Color color) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(label, style: TextStyle(color: Colors.grey[700])),
    );
  }

  Widget _buildPost(
    String postId,
    String user,
    String time,
    String content,
    bool hasImage,
  ) {
    final postState = _postStates[postId]!;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '$time · 🌎',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(content, style: const TextStyle(fontSize: 15)),
          ),
          if (hasImage) ...[
            const SizedBox(height: 12),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/beach.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 300,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image, size: 80, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1877F2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '${postState['likeCount']}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Spacer(),
                Text(
                  '${postState['commentCount']} comments',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(width: 12),
                Text('5 shares', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          const Divider(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPostAction(
                  postState['isLiked']
                      ? Icons.thumb_up
                      : Icons.thumb_up_outlined,
                  'Like',
                  postState['isLiked']
                      ? const Color(0xFF1877F2)
                      : Colors.grey[700]!,
                  () => _toggleLike(postId),
                ),
                _buildPostAction(
                  Icons.comment_outlined,
                  'Comment',
                  Colors.grey[700]!,
                  () => _toggleComments(postId),
                ),
                _buildPostAction(
                  Icons.share_outlined,
                  'Share',
                  Colors.grey[700]!,
                  () {},
                ),
              ],
            ),
          ),
          // Comments section
          if (postState['showComments']) ...[
            const Divider(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  // Existing comments
                  ...postState['comments']
                      .map<Widget>(
                        (comment) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(comment),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  // Comment input
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Write a comment...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            onSubmitted: (comment) =>
                                _addComment(postId, comment),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xFF1877F2),
                          ),
                          onPressed: () =>
                              _addComment(postId, _commentController.text),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildPostAction(
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: Text(label, style: TextStyle(color: color)),
    );
  }
}
