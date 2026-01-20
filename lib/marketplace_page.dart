import 'package:flutter/material.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Marketplace',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        // Categories
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 8,
            children: [
              _buildCategoryChip('All', true),
              _buildCategoryChip('Vehicles', false),
              _buildCategoryChip('Electronics', false),
              _buildCategoryChip('Furniture', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Today's picks
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Today's picks",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        // Grid of items
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final items = [
              {
                'title': 'Used Toyota Car',
                'price': '\$15,500',
                'location': 'Addis Ababa, Mexico',
                'image': 'item1.jpg',
              },
              {
                'title': 'Affordable Bed',
                'price': '\$299',
                'location': 'Addis Ababa, Piassa',
                'image': 'item2.jpg',
              },
              {
                'title': 'iPhone 12, 128GB',
                'price': '\$599',
                'location': 'Addis Ababa, Meskel Square',
                'image': 'item3.jpg',
              },
              {
                'title': 'AirPod Pro 2nd Generation',
                'price': '\$199',
                'location': 'Addis Ababa, Magenagna',
                'image': 'item4.jpg',
              },
            ];
            return _buildMarketplaceItem(
              items[index]['title']!,
              items[index]['price']!,
              items[index]['location']!,
              items[index]['image']!,
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
      ),
      backgroundColor: isSelected ? const Color(0xFF1877F2) : Colors.grey[200],
    );
  }

  Widget _buildMarketplaceItem(
    String title,
    String price,
    String location,
    String imageName,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.asset(
                'assets/images/$imageName',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 140,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
