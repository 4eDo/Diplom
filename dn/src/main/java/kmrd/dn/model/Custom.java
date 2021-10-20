package kmrd.dn.model;

public class Custom {
    private String master;
    private String client;
    private String location;
    private String colourPrimo;
    private String colourSecundo;
    private String colourTextPrimo;
    private String colourTextSecundo;
    private String colourHover;
    private String colourLink;
    private String colourLinkHover;

    public Custom() {
        master = "Мастер";
        client = "Клиент";
        location = "Место";
        colourPrimo = "#ffffff";
        colourSecundo = "#dedede";
        colourTextPrimo = "#000000";
        colourTextSecundo = "#000000";
        colourHover = "#f8f8f8";
        colourLink = "#08330f";
        colourLinkHover = "#0cb191";
    }

    public String getMaster() {return master;}
    public void setMaster(String _master) {
        if (!_master.isEmpty()) {
            this.master = _master;
        }
    }

    public String getClient() { return client;}
    public void setClient(String _client) {
        if (!_client.isEmpty()) {
            this.client = _client;
        }
    }

    public String getLocation() { return location; }
    public void setLocation(String _location) {
        if (_location.isEmpty()) {
            _location = "Место";
        }
        this.location = _location;
    }

    public String getColourPrimo() { return colourPrimo; }
    public void setColourPrimo(String colourPrimo) {
        if (!colourPrimo.isEmpty() && colourPrimo != null) {
            this.colourPrimo = colourPrimo;
        } else {
            this.colourPrimo = "#ffffff";
        }
    }

    public String getColourSecundo() { return colourSecundo; }
    public void setColourSecundo(String colourSecundo) {
        if (!colourSecundo.isEmpty() && colourSecundo != null) {
            this.colourSecundo = colourSecundo;
        } else {
            this.colourSecundo = "#dedede";
        }
    }

    public String getColourTextPrimo() { return colourTextPrimo; }
    public void setColourTextPrimo(String colourTextPrimo) {
        if (!colourTextPrimo.isEmpty() && colourTextPrimo != null) {
            this.colourTextPrimo = colourTextPrimo;
        } else {
            this.colourTextPrimo = "#000000";
        }
    }

    public String getColourTextSecundo() { return colourTextSecundo; }
    public void setColourTextSecundo(String colourTextSecundo) {
        if (!colourTextSecundo.isEmpty() && colourTextSecundo != null) {
            this.colourTextSecundo = colourTextSecundo;
        } else {
            this.colourTextSecundo = "#000000";
        }
    }

    public void setColours(String c1, String c2, String ct1, String ct2, String ch, String clink, String clinkh) {
        setColourPrimo(c1);
        setColourSecundo(c2);
        setColourTextPrimo(ct1);
        setColourTextSecundo(ct2);
        setColourHover(ch);
        setColourLink(clink);
        setColourLinkHover(clinkh);
    }

    public String getColourHover() { return colourHover; }
    public void setColourHover(String colourHover) {
        if (!colourHover.isEmpty() && colourHover != null) {
            this.colourHover = colourHover;
        } else {
            this.colourHover = "#f8f8f8";
        }
    }

    public String getColourLink() { return colourLink; }
    public void setColourLink(String colourLink) {
        if (!colourLink.isEmpty() && colourLink != null) {
            this.colourLink = colourLink;
        } else {
            this.colourLink = "#08330f";
        }
    }

    public String getColourLinkHover() { return colourLinkHover; }
    public void setColourLinkHover(String colourLinkHover) {
        if (!colourLinkHover.isEmpty() && colourLinkHover != null) {
            this.colourLinkHover = colourLinkHover;
        } else {
            this.colourLinkHover = "#0cb191";
        }
    }

    public void setCustom(String[] _custom) {
        if(_custom == null){ _custom = this.takeAll();}
        if (_custom.length > 2) {
            this.setMaster(_custom[0]);
            this.setClient(_custom[1]);
            this.setLocation(_custom[2]);
            this.setColours(_custom[3], _custom[4], _custom[5], _custom[6], _custom[7], _custom[8], _custom[9]);
        }
    }
    public void setCustom(User user) {
        this.setClient(user.getCustom_client());
        this.setColourHover(user.getCustom_colourHover());
        this.setColourLink(user.getCustom_colourLink());
        this.setColourLinkHover(user.getCustom_colourLinkHover());
        this.setColourPrimo(user.getCustom_colourPrimo());
        this.setColourSecundo(user.getCustom_colourSecundo());
        this.setColourTextPrimo(user.getCustom_colourTextPrimo());
        this.setColourTextSecundo(user.getCustom_colourTextSecundo());
        this.setLocation(user.getCustom_location());
        this.setMaster(user.getCustom_master());
    }

    public String[] takeAll(){
        String[] temp = new String[10];
        temp[0] = this.getMaster();
        temp[1] = this.getClient();
        temp[2] = this.getLocation();

        temp[3] = this.getColourPrimo();
        temp[4] = this.getColourSecundo();
        temp[5] = this.getColourTextPrimo();
        temp[6] = this.getColourTextSecundo();
        temp[7] = this.getColourHover();
        temp[8] = this.getColourLink();
        temp[9] = this.getColourLinkHover();

        if(temp==null||temp.length<1) {
            temp = new Custom().takeAll();
            System.out.print("Custom.java: Мне дали пустую строку!");
        }
        return temp;
    }

    @Override
    public String toString(){
        String temp = this.master + "|"
                + this.client + "|"
                + this.location + "|"
                + this.colourPrimo + "|"
                + this.colourSecundo+ "|"
                + this.colourTextPrimo+ "|"
                +this.colourTextSecundo+ "|"
                +this.colourHover+ "|"
                +this.colourLink+ "|"+
                this.colourLinkHover;
        return temp;
    }

    public static Custom toCustom(String str){
        Custom temp = new Custom();
        String[] cstr = str.split("|");
        if(cstr!=null){
            temp.setCustom(cstr);
        }
        return temp;
    }
}
