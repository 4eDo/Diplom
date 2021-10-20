package kmrd.dn.model;

import javax.persistence.*;

@Entity
@Table(name="users")
public class User {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="nameU")
    private String nameU;

    @Column(name="mail")
    private String mail;

    @Column(name="pass")
    private String pass;

    @Column(name="phone")
    private String phone;

    @Column(name="roles")
    private String roles;

    @Column(name="custom_master")
    private String custom_master = "Мастер";

   @Column(name="custom_client")
    private String custom_client = "Клиент";

   @Column(name="custom_location")
    private String custom_location = "Место";

    @Column(name="custom_colourPrimo")
    private String custom_colourPrimo = "#ffffff";

    @Column(name="custom_colourSecundo")
    private String custom_colourSecundo = "#dedede";

    @Column(name="custom_colourTextPrimo")
    private String custom_colourTextPrimo = "#000000";

    @Column(name="custom_colourTextSecundo")
    private String custom_colourTextSecundo = "#000000";

    @Column(name="custom_colourHover")
    private String custom_colourHover = "#f8f8f8";

    @Column(name="custom_colourLink")
    private String custom_colourLink = "#08330f";

    @Column(name="custom_colourLinkHover")
    private String custom_colourLinkHover = "#0cb191";

    @Column(name="taskTypes")
    private String taskTypes;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNameU() {
        return nameU;
    }
    public void setNameU(String name) {
        this.nameU = name;
    }

    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setCustom(String[] _custom) {
        this.setCustom_master(_custom[0]);
        this.setCustom_client(_custom[1]);
        this.setCustom_location(_custom[2]);
        this.setCustom_colourPrimo(_custom[3]);
        this.setCustom_colourSecundo(_custom[4]);
        this.setCustom_colourTextPrimo(_custom[5]);
        this.setCustom_colourTextSecundo(_custom[6]);
        this.setCustom_colourHover(_custom[7]);
        this.setCustom_colourLink(_custom[8]);
        this.setCustom_colourLinkHover(_custom[9]);
    }

    public String getRoles() {
        return roles;
    }
    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getCustom_master() {
        return custom_master;
    }

    public void setCustom_master(String custom_master) {
        this.custom_master = custom_master;
    }

    public String getCustom_client() {
        return custom_client;
    }

    public void setCustom_client(String custom_client) {
        this.custom_client = custom_client;
    }

    public String getCustom_location() {
        return custom_location;
    }

    public void setCustom_location(String custom_location) {
        this.custom_location = custom_location;
    }

    public String getCustom_colourPrimo() {
        return custom_colourPrimo;
    }

    public void setCustom_colourPrimo(String custom_colourPrimo) {
        this.custom_colourPrimo = custom_colourPrimo;
    }

    public String getCustom_colourSecundo() {
        return custom_colourSecundo;
    }

    public void setCustom_colourSecundo(String custom_colourSecundo) {
        this.custom_colourSecundo = custom_colourSecundo;
    }

    public String getCustom_colourTextPrimo() {
        return custom_colourTextPrimo;
    }

    public void setCustom_colourTextPrimo(String custom_colourTextPrimo) {
        this.custom_colourTextPrimo = custom_colourTextPrimo;
    }

    public String getCustom_colourTextSecundo() {
        return custom_colourTextSecundo;
    }

    public void setCustom_colourTextSecundo(String custom_colourTextSecundo) {
        this.custom_colourTextSecundo = custom_colourTextSecundo;
    }

    public String getCustom_colourHover() {
        return custom_colourHover;
    }

    public void setCustom_colourHover(String custom_colourHover) {
        this.custom_colourHover = custom_colourHover;
    }

    public String getCustom_colourLink() {
        return custom_colourLink;
    }

    public void setCustom_colourLink(String custom_colourLink) {
        this.custom_colourLink = custom_colourLink;
    }

    public String getCustom_colourLinkHover() {
        return custom_colourLinkHover;
    }

    public void setCustom_colourLinkHover(String custom_colourLinkHover) {
        this.custom_colourLinkHover = custom_colourLinkHover;
    }

    public String CustToString(){
        return this.custom_master + "|"
                + this.custom_client + "|"
                + this.custom_location + "|"
                + this.custom_colourPrimo + "|"
                + this.custom_colourSecundo+ "|"
                + this.custom_colourTextPrimo+ "|"
                + this.custom_colourTextSecundo+ "|"
                + this.custom_colourHover+ "|"
                + this.custom_colourLink+ "|"+
                this.custom_colourLinkHover;
    }

    public String getTaskTypes() {
        return taskTypes;
    }

    public void setTaskTypes(String taskTypes) {
        this.taskTypes = taskTypes;
    }
}
