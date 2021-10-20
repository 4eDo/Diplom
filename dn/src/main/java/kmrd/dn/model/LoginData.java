package kmrd.dn.model;

public class LoginData {

    private String mail;
    private String pass;
    private String IDs;
    private int userID;
    private Custom custom = new Custom();
    private String nameUser;
    private String defTTypes;

    public String getMail() { return mail;}
    public void setMail(String mail) {this.mail = mail;}

    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }

    public String getIDs() {return IDs;}
    public void setIDs(String IDs) {this.IDs = IDs;}

    public int getUserID() { return userID;}
    public void setUserID(int userID) { this.userID = userID;}

    public void clearData() {
        setMail(null);
        setPass(null);
        setIDs(null);
        setUserID(-1);
        String[] temp = null;
        setCustom(temp);
        setNameUser(null);
    }

    public Custom getCustom() {
        return custom;
    }
    public void setCustom(String[] _custom) {
        if (_custom != null && _custom[0] != null && _custom[1] != null && _custom[2] != null && _custom.length > 9) {
            this.custom.setMaster(_custom[0]);
            this.custom.setClient(_custom[1]);
            this.custom.setLocation(_custom[2]);
            this.custom.setColours(_custom[3], _custom[4], _custom[5], _custom[6], _custom[7], _custom[8], _custom[9]);
        }
    }

    public void setCustom(User user) { this.custom.setCustom(user);}

    public void setNameUser(String name) {this.nameUser = name; }
    public String getNameUser(){return nameUser;}

    public void setDefTTypes(String defTTypes) {this.defTTypes = defTTypes;}
}
