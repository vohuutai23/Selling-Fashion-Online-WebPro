package com.ecommerce.DAO;
//import com.ecommerce.utility.HashUtility;
import com.ecommerce.model.entity.User;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class UserDAO extends JPADao<User> implements iJPADao<User>{


    @Override
    public User create(User user) {
        //String encryptedPassword = HashUtility.generateMD5(user.getPassword());
        //user.setPassword(encryptedPassword);
        return super.create(user);
    }

    @Override
    public User update(User user) {
        return super.update(user);
    }

    @Override
    public User get(Object userId) {
        return super.find(User.class, userId);
    }

    @Override
    public void delete(Object userId) {
        super.delete(User.class, userId);
    }

    @Override
    public List<User> listAll() {
//        return super.findWithNamedQuery("User.findAll");
        List<User> users = super.findWithNamedQuery("User.ListAll");
        System.out.println("Users from DB: " + users);
        return users;

    }

    @Override
    public long count() {
        return super.countWithNamedQuery("User.countAll");
    }

    public User findByEmail(String email) {
        List<User> listUser = super.findWithNamedQuery("User.findByEmail", "email", email);

        if (listUser != null && listUser.size() == 1) {
            return listUser.get(0);
        }
        return null;
    }

    public boolean findByEmailAndPassword(String email, String password) {
        Map<String, Object> parameters = new HashMap<>();
        //String encryptedPassword = HashUtility.generateMD5(password);
        parameters.put("email", email);
        parameters.put("password", password);

        List<User> listUsers = super.findWithNamedQuery("User.findByEmailAndPassword", parameters);

        return listUsers.size() == 1;
    }
}
