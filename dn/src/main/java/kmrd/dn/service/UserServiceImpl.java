package kmrd.dn.service;

import java.util.List;
import kmrd.dn.dao.UserDAO;
import kmrd.dn.dao.UserDAOImpl;
import kmrd.dn.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService{
  private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO uDAO){
        this.userDAO = uDAO;
    }

    @Override
    @Transactional
    public List<User> allUsers() {
        return userDAO.allUsers();
    }

    @Override
    @Transactional
    public void add(User user) {
        userDAO.add(user);
    }

    @Override
    @Transactional
    public void delete(User user) {
        userDAO.delete(user);
    }

    @Override
    @Transactional
    public void edit(User user) {
        userDAO.edit(user);
    }

    @Override
    @Transactional
    public User getById(int id) {
        return userDAO.getById(id);
    }

    @Override
    @Transactional
    public User findUser(String string, String string1) {
        return userDAO.findUser(string, string1);
    }
}
