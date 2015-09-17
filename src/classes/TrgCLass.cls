public class TrgCLass{
   @future(callout=true)
   public static void insertdata(String n,String cn){
     MadhavWS3.SOAP obj = new MadhavWS3.SOAP();
     MadhavWS3.LoginResult res = obj.login('shanmugaprabhu.p@gmail.com','sales@143aYo8caslKejUrfXz8ok9kx7rn');

    MadhavWS.StudentWS stub = new MadhavWS.StudentWS();
    stub.SessionHeader = new MadhavWS.SessionHeader_element ();
    stub.SessionHeader.sessionId = res.SessionId;
    stub.insertStudent(n,cn);
   
   } 
}