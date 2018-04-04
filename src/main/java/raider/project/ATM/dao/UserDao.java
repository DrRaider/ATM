package raider.project.ATM.dao;

import raider.project.ATM.model.User;

public interface UserDao {

    void save(User user);

    User findById(int id);

    User findBySSO(String sso);

}
