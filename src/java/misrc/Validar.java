package misrc;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

public class Validar {

    public static boolean edad(String edad) {
        String er = "[0-9]+";
        boolean correcto = edad.matches(er) && Integer.parseInt(edad) > 0
                && Integer.parseInt(edad) < 150;
        return correcto;
    }

    public static boolean estatura(String estatura) {
        String er = "[012]{1}\\.[0-9]{1,2}";
        boolean correcto = estatura.matches(er);
        return correcto;
    }

    public static boolean nombre(String nombre) {
        String er = "[a-zA-ZñÑáéíóúÁÉÍÓÚ]+";
        boolean correcto = nombre.matches(er);
        return correcto;
    }

    public static String idAlumno(MongoCollection<Document> alumno) {
        String clave = "";
        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            Document doc = null;
            while (cursor.hasNext()) {
                doc = cursor.next();
            }
            String idAlumno = doc.getString("idAlumno");
            int number = Integer.parseInt(idAlumno.substring(1))+1;
            clave  = "A" + number;
        }
        return clave;
    }

    /*
    public static void main(String[] args) {
        String databaseName = "campusfp";
        String serverName = "localhost";
        int puerto = 27017;

        // Create MongoDB client
        MongoClient mc = new MongoClient(serverName, puerto);
        MongoDatabase database = mc.getDatabase(databaseName);
        MongoCollection<Document> alumno = database.getCollection("alumno");

        List<String> identificadores_al = new ArrayList<>();
        Document doc = null;
        try (MongoCursor<Document> cursor = alumno.find().iterator()) {
            while (cursor.hasNext()) {
                doc = cursor.next();
            }
            String idAlumno = doc.getString("idAlumno");
            int number = Integer.parseInt(idAlumno.substring(1))+1;
            String clave  = "A" + number;
        }

    }
    */
}
