import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      "id": 1,
      "title": "30% Special Discount!",
      "description": "Special promotion only valid today",
      "time": "Today",
      "timestamp": "2 hours ago",
      "icon": Icons.local_offer,
      "iconColor": Colors.red,
      "isRead": false,
      "type": "promotion",
    },
    {
      "id": 2,
      "title": "Your Order Has Been Taken by the Driver",
      "description": "Recently",
      "time": "Today",
      "timestamp": "3 hours ago",
      "icon": Icons.check_circle,
      "iconColor": Colors.green,
      "isRead": true,
      "type": "order",
    },
    {
      "id": 3,
      "title": "Your Order Has Been Cancelled",
      "description": "18 Jul 2023",
      "time": "Today",
      "timestamp": "5 hours ago",
      "icon": Icons.cancel,
      "iconColor": Colors.red,
      "isRead": false,
      "type": "order",
    },
    {
      "id": 4,
      "title": "35% Special Discount!",
      "description": "Special promotion only valid today",
      "time": "Yesterday",
      "timestamp": "Yesterday",
      "icon": Icons.mail,
      "iconColor": Colors.grey,
      "isRead": true,
      "type": "promotion",
    },
    {
      "id": 5,
      "title": "Account Setup Successful!",
      "description": "Welcome to our app",
      "time": "Yesterday",
      "timestamp": "Yesterday",
      "icon": Icons.person,
      "iconColor": Colors.blue,
      "isRead": true,
      "type": "account",
    },
    {
      "id": 6,
      "title": "Special Offer! 60% Off",
      "description": "Special offer for new account, valid until 20 Nov 2023",
      "time": "Yesterday",
      "timestamp": "Yesterday",
      "icon": Icons.local_offer,
      "iconColor": Colors.red,
      "isRead": false,
      "type": "promotion",
    },
  ];

  void markAsRead(int id) {
    setState(() {
      final index = notifications.indexWhere(
        (notification) => notification["id"] == id,
      );
      if (index != -1) {
        notifications[index]["isRead"] = true;
      }
    });
  }

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification["isRead"] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int unreadCount = notifications.where((n) => !n["isRead"]).length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (unreadCount > 0)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$unreadCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: markAllAsRead,
              child: Text(
                'Mark all as read',
                style: TextStyle(
                  color: Colors.orange[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(height: 1, color: Colors.grey[200]),
          Expanded(
            child: notifications.isEmpty
                ? Text("Nothing To Show")
                : Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        _buildSectionHeader("Today"),
                        ...notifications
                            .where((n) => n['time'] == "Today")
                            .map((n) => _buildNotificationItem(n)),
                        _buildSectionHeader("Yesterday"),

                        ...notifications
                            .where((n) => n['time'] == 'Yesterday')
                            .map((n) => _buildNotificationItem(n)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 80, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'When you get notifications, they\'ll show up here',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return GestureDetector(
      onTap: () => markAsRead(notification["id"]),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notification["isRead"] ? Colors.white : Colors.orange[50],
          borderRadius: BorderRadius.circular(12),
          border: notification["isRead"]
              ? null
              : Border.all(color: Colors.orange[100]!, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: notification["iconColor"].withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                notification["icon"],
                color: notification["iconColor"],
                size: 20,
              ),
            ),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification["title"],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: notification["isRead"]
                                ? FontWeight.w500
                                : FontWeight.w600,
                            color: notification["isRead"]
                                ? Colors.grey[700]
                                : Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        notification["timestamp"],
                        style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    notification["description"],
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8),

            if (!notification["isRead"])
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
