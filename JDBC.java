import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

class JDBC {

    public static void main(String args[]) {
        System.out.println("Enter username: ");
        Scanner read = new Scanner(System.in);
        String admin = read.nextLine();
        System.out.println("Enter password: ");
        String Password = read.nextLine();

    try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        
        String login = ("CREATE LOGIN " + admin + " WITH PASSWORD = '" + Password + "CREATE USER "
                + admin + " FOR LOGIN " + admin + "GRANT SELECT TO " + admin);
        Connection connect = DriverManager.getConnection("jdbc:sqlserver://localhost;database=MusicDatabase;integratedSecurity=true;");
        Statement state = connect.createStatement();
        state.execute(login);
        read.close();
        connect.close();
        state.close();

        
        Connection dbconnect = DriverManager.getConnection("jdbc:sqlserver://localhost;database=MusicDatabase;integratedSecurity=true;");
        Statement dbstate = dbconnect.createStatement();


        ResultSet rt = dbstate.executeQuery("Select * from Customer");
    while(rt.next())
            {System.out.println(rt.getInt(1) + " " + rt.getString(2));}
            

            dbconnect.close();
            dbstate.close();
        }catch(Exception E){
            System.out.println(E);
        }
    }
}


