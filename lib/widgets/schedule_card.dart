import 'dart:async';
import 'package:flutter/material.dart';
import '../models/bus_route.dart';

class ScheduleCard extends StatefulWidget {
  final List<Schedule> schedules; // List of all bus schedules
  final Schedule schedule;        // Current schedule for this card
  final bool isFromDSC;

  const ScheduleCard({
    super.key,
    required this.schedule,
    required this.schedules, // Pass the entire schedule list
    required this.isFromDSC,
  });

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  late Timer _timer;
  late DateTime busTime;
  Duration timeLeft = Duration.zero;
  bool hasDeparted = false;
  bool isNextBus = false; // Dynamically calculated

  @override
  void initState() {
    super.initState();
    busTime = _getFullDateTime(
      DateTime.now(),
      widget.isFromDSC ? widget.schedule.departureTime : widget.schedule.startTime,
    );
    _updateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTimeLeft();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimeLeft() {
    final currentTime = DateTime.now();
    final nextBusTime = _findNextBusTime(currentTime);

    setState(() {
      hasDeparted = currentTime.isAfter(busTime);
      isNextBus = busTime == nextBusTime; // True if this is the nearest future bus
      timeLeft = hasDeparted ? Duration.zero : busTime.difference(currentTime);
    });
  }

  DateTime _findNextBusTime(DateTime currentTime) {
    // Find the nearest future bus schedule
    return widget.schedules
        .map((schedule) => _getFullDateTime(
              currentTime,
              widget.isFromDSC ? schedule.departureTime : schedule.startTime,
            ))
        .where((time) => time.isAfter(currentTime)) // Only future times
        .fold<DateTime?>(null, (nearest, time) => 
            nearest == null || time.isBefore(nearest) ? time : nearest) ??
        currentTime; // Fallback to currentTime if no future buses
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: isNextBus && !hasDeparted ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: (!hasDeparted && !isNextBus)
            ? BorderSide(color: Colors.grey.shade300)
            : BorderSide.none,
      ),
      color: _getCardColor(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: _getIconColor(),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.isFromDSC
                      ? 'From DSC: ${widget.schedule.departureTime}'
                      : 'To DSC: ${widget.schedule.startTime}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _getTextColor(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (!hasDeparted)
              Text(
                'Next bus in: ${_formatDuration(timeLeft)}',
                style: TextStyle(
                  color: isNextBus
                      ? Colors.green.shade700
                      : Colors.orange.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (hasDeparted)
              Text(
                'Bus already left!',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            if (widget.schedule.notes != null) ...[
              const SizedBox(height: 4),
              Text(
                widget.schedule.notes!,
                style: TextStyle(
                  color: _getNotesColor(),
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getCardColor() {
    if (hasDeparted) {
      return const Color.fromARGB(255, 255, 235, 235); // Light red for departed buses
    } else if (isNextBus) {
      return const Color.fromARGB(255, 231, 245, 236); // Soft light green for next bus
    } else {
      return const Color(0xFFFAFAFA); // Off-white for future buses
    }
  }

  Color _getIconColor() {
    if (hasDeparted) {
      return Colors.red.shade400;
    } else if (isNextBus) {
      return const Color.fromARGB(255, 10, 132, 67); // Darker green for better contrast
    } else {
      return Colors.grey.shade600;
    }
  }

  Color _getTextColor() {
    if (hasDeparted) {
      return Colors.red.shade700;
    } else if (isNextBus) {
      return const Color.fromARGB(255, 10, 132, 67); // Matching green for text
    } else {
      return Colors.grey.shade800;
    }
  }

  Color _getNotesColor() {
    if (hasDeparted) {
      return Colors.red.shade400;
    } else if (isNextBus) {
      return const Color.fromARGB(255, 10, 132, 67); // Matching green for notes
    } else {
      return Colors.grey.shade600;
    }
  }

  DateTime _getFullDateTime(DateTime currentTime, String time) {
    try {
      final timeParts = time.split(' ');
      final hourMinute = timeParts[0].split(':');

      int hour = int.parse(hourMinute[0]);
      final int minute = int.parse(hourMinute[1]);

      // Handle AM/PM conversion
      if (timeParts.length > 1) {
        if (timeParts[1].toUpperCase() == 'PM' && hour != 12) {
          hour += 12;
        } else if (timeParts[1].toUpperCase() == 'AM' && hour == 12) {
          hour = 0;
        }
      }

      return DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        hour,
        minute,
      );
    } catch (e) {
      return currentTime;
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return '${hours}h ${minutes}m ${seconds}s';
  }
}
