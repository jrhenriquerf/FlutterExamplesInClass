class Notas {
  int id;
  String title;
  String description;
  String date;

  Notas.empty() {
    id = null;
    title = "";
    description = "";
    date = "";
  }

  Notas(this.title, this.description, this.date);
}
