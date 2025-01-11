package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.DAO.interf.IUsersDao;
import com.example.ecommerce.Database.JDBIConnect;

import java.util.ArrayList;
import java.util.List;

public class UserDao extends ImplementBase implements IUsersDao {
    List<User> users;
    JDBIConnect db = JDBIConnect.getInstance();

    public UserDao(JDBIConnect db, List<User> users) {
        this.users = new ArrayList<>();
        this.db = db;
    }

    public UserDao() {
        super();
    }

    @Override
    public List<User> getAllUsers() {
        return db.jdbi.withHandle(handle -> handle.createQuery("select * from users")).mapToBean(User.class).list();
    }

    @Override
    public User getUserById(int id) {
        return db.jdbi.withHandle(handle -> handle.createQuery("select * from users where id = " + id).mapToBean(User.class).first());
    }

    @Override
    public User addUser(User user) {
        return db.jdbi.withHandle(handle -> {
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
    public User updateInfoUserNameById(int id, String userName, String fullName, String gender, String
            email, String phone) {
        return db.jdbi.withHandle(handle -> handle.createUpdate("UPDATE users SET userName = :userName, fullName = :fullName, gender = :gender, email = :email, phone = :phone WHERE id = :id")
                .bind("username", userName)
                .bind("fullName", fullName)
                .bind("gender", gender)
                .bind("email", email)
                .bind("phone", phone)
                .executeAndReturnGeneratedKeys("id")
                .mapToBean(User.class)
                .findOne()
                .orElseThrow(() -> new IllegalStateException("User with id " + id + " not found")));
    }

    @Override
    public User updateAvatarById(int id, String avatar) {
        return null;
    }

    @Override
    public User updatePasswordById(int id, String password) {
        return null;
    }

    @Override
    public boolean deleteUserById(int id) {
        return db.jdbi.withHandle(
                handle -> handle.createUpdate("delete * from users where id=:id")).bind(0, id).execute() > 0;
    }

    @Override
    public User findUser(String username) {
        return db.jdbi.withHandle(handle ->
                handle.createQuery("select * from users where username = :username")
                        .bind("username", username)
                        .mapToBean(User.class).findOne().orElse(null));
    }

    public static void main(String[] args) {
        UserDao dao = new UserDao();
        dao.log.info("test");
    }
}
