package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.DAO.interf.IUsersDao;
import com.example.ecommerce.Database.JDBIConnect;

import java.util.ArrayList;
import java.util.List;

public class UserDao extends ImplementBase implements IUsersDao {
    List<User> users;
    JDBIConnect db;

    public UserDao(JDBIConnect db, List<User> users) {
        this.users = new ArrayList<>();
        this.db = db;
    }

    public UserDao() {
        super();
    }

    @Override
    public List<User> getAllUsers() {
        return db.getJdbi().withHandle(handle -> handle.createQuery("select * from users")).mapToBean(User.class).list();
    }

    @Override
    public User getUserById(int id) {
        return db.getJdbi().withHandle(handle -> handle.createQuery("select * from users where id = " + id).mapToBean(User.class).first());
    }

    @Override
    public User addUser(User user) {
        return db.getJdbi().withHandle(handle -> {
            int id = handle.createUpdate(
                            "INSERT INTO users(username, fullname, gender, pass, email, phoneNum, statusUser, createUser, avatar, roleID) " +
                                    "VALUES (:username, :fullname, :gender, :pass, :email, :phoneNum, :statusUser, :createUser, :avatar, :roleID)")
                    .bind("username", user.getUsername())
                    .bind("fullname", user.getFullName())
                    .bind("gender", user.getGender())
                    .bind("pass", user.getPass())
                    .bind("email", user.getEmail())
                    .bind("phoneNum", user.getPhoneNum())
                    .bind("statusUser", user.getStatusUser())
                    .bind("createUser", user.getCreateUser())
                    .bind("avatar", user.getAvatar())
                    .bind("roleID", user.getRoleID())
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(Integer.class).one();
            user.setId(id);
            return user;
        });
    }

    @Override
    public boolean updateInfoUserNameById(int id, String userName, String fullName, String gender, String
            email, String phone) {
        return false;
    }

    @Override
    public boolean updateAvatarById(int id, String avatar) {
        return false;
    }

    @Override
    public boolean updatePasswordById(int id, String password) {
        return false;
    }

    @Override
    public boolean deleteUserById(int id) {
        return false;
    }

    @Override
    public User findUser(String username) {
        return null;
    }
}
