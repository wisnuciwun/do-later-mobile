class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 1,
    title: 'Belanja',
    content: 'Telur 2 Kg, beras, ayam 1 kg, minyak.',
    modifiedTime: DateTime(2022, 1, 1, 34, 5),
  ),
  Note(
    id: 2,
    title: 'Datang ke pernikahan Wahyu',
    content: 'Beli kado dulu di toko Sejahtera',
    modifiedTime: DateTime(2023, 3, 1, 19, 5),
  ),
  Note(
    id: 3,
    title: 'Bertamu ke kang Fikri',
    content: 'Beli dulu oleh-oleh nya di tempat biasa',
    modifiedTime: DateTime(2023, 1, 4, 16, 53),
  ),
];
