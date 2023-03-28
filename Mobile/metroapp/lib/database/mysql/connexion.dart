import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost', // Adresse de la base de données
    user: 'root', // Nom d'utilisateur
    password: 'Manager21c', // Mot de passe
    db: 'ii2gl', // Nom de la base de données
    port: 3306, // Port de la base de données
  ));

  return conn;
}