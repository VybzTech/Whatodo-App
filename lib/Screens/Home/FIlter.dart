// class _filters {
enum Priorities { high, low }
List filters = [
  {
    "filterName": 'today',
    "filterNo": 9,
    "priority": Priorities.high,
    "shown": true,
  },
  {
    "filterName": 'tomorrow',
    "filterNo": 7,
    "priority": Priorities.high,
    "shown": false,
  },
  {
    "filterName": 'overdue',
    "filterNo": 3,
    "priority": Priorities.high,
    "shown": false,
  },
  {
    "priority": Priorities.high,
    "filterName": 'recurring',
    "filterNo": 3,
    "shown": false,
  },
  {
    "filterName": 'periodic',
    "filterNo": 1,
    "priority": Priorities.high,
    "shown": false,
  },
  {
    "filterName": 'reminders',
    "filterNo": 2,
    "priority": Priorities.high,
    "shown": false,
  },
];
// }
