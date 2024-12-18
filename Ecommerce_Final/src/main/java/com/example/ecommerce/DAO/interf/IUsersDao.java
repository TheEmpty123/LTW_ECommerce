package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.User;

import java.util.List;

public interface IUsersDao {
    //Lay ra tat ca users
    List<User> getAllUsers();
    //Lay user theo id
    User getUserById(int id);
    //Them mot user
    boolean addUser(User user);
    //Cap nhat cac thong tin co ban trong profile cua moi user theo id;
    boolean updateInfoUserNameById(int id, String userName, String fullName, String gender, String email, String phone);
    //Cap nhat avata cho user theo id
    boolean updateAvatarById(int id, String avatar);
    //Cap nhat mat khau cho user theo id
    boolean updatePasswordById(int id, String password);
    //Xoa users theo id
    boolean deleteUserById(int id);
    //Tim user theo userName cho phan dang nhap
    User findUser(String username);
}