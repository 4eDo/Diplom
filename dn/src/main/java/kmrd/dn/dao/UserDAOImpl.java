package kmrd.dn.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kmrd.dn.model.User;
import java.util.concurrent.atomic.AtomicInteger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("UserDAO")
public class UserDAOImpl implements UserDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
   }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> allUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("from User").list();
    }

    @Override
    public void add(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void delete(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(user);
    }

    @Override
    public void edit(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public User getById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(User.class, id);
    }

    @Override
    public User findUser(String mail, String pass) {
        User temp;
        List<User> usersList= allUsers();
        for(int i=0; i<usersList.size(); i++){
            if(usersList.get(i).getMail().equals(mail)){
                if(usersList.get(i).getPass().equals(pass)){
                    temp = usersList.get(i);
                    return temp;
                }
            }
        }
        return null;
    }
}
