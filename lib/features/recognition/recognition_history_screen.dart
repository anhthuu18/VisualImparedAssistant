import 'package:flutter/material.dart';

import 'models/recognition_models.dart';

class RecognitionHistoryScreen extends StatefulWidget {
  const RecognitionHistoryScreen({super.key});

  @override
  State<RecognitionHistoryScreen> createState() =>
      _RecognitionHistoryScreenState();
}

class _RecognitionHistoryScreenState extends State<RecognitionHistoryScreen> {
  RecognitionMode? _selectedFilter;

  List<RecognitionHistoryItem> get _filteredItems {
    if (_selectedFilter == null) {
      return mockHistoryItems;
    }
    return mockHistoryItems
        .where((item) => item.mode == _selectedFilter)
        .toList();
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays == 1) {
      return 'Hôm qua';
    } else {
      return '${dateTime.day}-${dateTime.month} ${dateTime.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101C22),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A32),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Lịch sử nhận diện',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 60,
            color: const Color(0xFF1A2A32),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: <Widget>[
                _buildFilterChip(null, 'Tất cả'),
                _buildFilterChip(RecognitionMode.text, 'Văn bản'),
                _buildFilterChip(RecognitionMode.currency, 'Tiền tệ'),
                _buildFilterChip(RecognitionMode.object, 'Vật thể'),
              ],
            ),
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(
                    child: Text(
                      'Không có dữ liệu',
                      style: TextStyle(color: Colors.white54),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return _buildHistoryItem(item);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(RecognitionMode? mode, String label) {
    final isSelected = _selectedFilter == mode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = selected ? mode : null;
          });
        },
        backgroundColor: Colors.white.withValues(alpha: 0.05),
        selectedColor: const Color(0xFF13A4EC),
        labelStyle: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
        side: BorderSide(
          color: isSelected
              ? const Color(0xFF13A4EC)
              : Colors.white.withValues(alpha: 0.1),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(RecognitionHistoryItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A32),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Center(
              child: Icon(
                item.mode.actionIcon,
                size: 40,
                color: const Color(0xFF13A4EC),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (item.description != null)
                    Text(
                      item.description!,
                      style: const TextStyle(
                        color: Color(0xFF13A4EC),
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDateTime(item.dateTime),
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF13A4EC),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
