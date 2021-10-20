package kmrd.dn.dao;

import java.util.List;
import kmrd.dn.model.User;

public interface UserDAO {
    List<User> allUsers();
    void add(User user);
    void delete(User user);
    void edit(User user);
    User getById(int id);
    User findUser(String mail, String pass);
}
