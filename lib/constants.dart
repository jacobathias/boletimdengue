import 'package:flutter/material.dart';

const Map codigoLocalidade = {
  879: 'Jaderlândia',
  27: 'Maicá',
  22: 'Urumari',
  19: 'Urumanduba',
  18: 'Mararu',
  921: 'Pérocla do Maicá',
  121: 'Vigiia',
};
int noNegative(value) {
  if (value <= 0) value = 0;
  return value;
}

List<String> dummyAgentes = [
  'Jacob',
  'Marcos',
  'Alex',
  'Ricardo',
  'Sandro',
  'Silva'
];

List<Widget> DummyList = [
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 10'),
    trailing: Text('10-Nov-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Junior Figueira'),
    subtitle: Text('Total Visitado: 5'),
    trailing: Text('01-Out-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 11'),
    trailing: Text('5-jan-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Victor Silva'),
    subtitle: Text('Total Visitado: 3'),
    trailing: Text('1-set-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Mariana Perez'),
    subtitle: Text('Total Visitado: 10'),
    trailing: Text('2-mar-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Marcos Silva'),
    subtitle: Text('Total Visitado: 23'),
    trailing: Text('15-fev-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Jacob Athias'),
    subtitle: Text('Total Visitado: 43'),
    trailing: Text('31-set-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 76'),
    trailing: Text('10-Nov-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 76'),
    trailing: Text('10-Nov-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 76'),
    trailing: Text('10-Nov-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 76'),
    trailing: Text('10-Nov-22'),
  ),
  const ListTile(
    leading: Icon(Icons.receipt_rounded),
    title: Text('Alex Oliveira'),
    subtitle: Text('Total Visitado: 76'),
    trailing: Text('10-Nov-22'),
  ),
];

Widget IconSubtitle(IconData icon, String title, int value) {
  return Container(
    child: Column(children: [Icon(icon), Text('$title' ': $value')]),
  );
}

// Widget myTile(IconData icon, String text, Widget controls) {
//   return ListTile(
//     leading: Icon(icon),
//     title: Text(text),
//     trailing: SizedBox(width: 150, child: controls),
//   );
// }
Widget myTile(IconData icon, String text, Widget controls) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(text),
        controls
      ],
    ),
  );
}
