import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../global_dirs.dart';

class Timestamps extends StatefulWidget {
  const Timestamps({super.key});

  @override
  State<Timestamps> createState() => _TimestampsState();
}

class _TimestampsState extends State<Timestamps> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _showCard = false; // toggle visibility of timestamps card

  List<DateTime> _getEventsForDay(DateTime day) {
    return Global.timestamps
        .where((ts) =>
            ts.year == day.year && ts.month == day.month && ts.day == day.day)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents =
        _selectedDay != null ? _getEventsForDay(_selectedDay!) : [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
        child: Column(
          children: [
            const Text('You wore your lenses at:'),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) => _getEventsForDay(day),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                markersMaxCount: 1,
              ),
            ),

            const SizedBox(height: 8),

            // Toggle button
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _showCard = !_showCard;
                });
              },
              icon: Icon(_showCard ? Icons.visibility_off : Icons.visibility),
              label: Text(_showCard ? "Hide timestamps" : "Show timestamps"),
            ),

            const SizedBox(height: 16),

            // Card with timestamps (conditionally visible)
            if (_showCard && _selectedDay != null)
              SizedBox(
                width: 350,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${DateFormat('EEE, MMM d, yyyy').format(_selectedDay!)}:",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (selectedEvents.isEmpty)
                          const Text("No timestamps for this day"),
                        ...selectedEvents.map((dt) => Text(
                              "Wore lenses at ${DateFormat('h:mm a').format(dt)}",
                              style: const TextStyle(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
