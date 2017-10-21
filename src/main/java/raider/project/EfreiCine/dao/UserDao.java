package raider.project.EfreiCine.dao;

import raider.project.EfreiCine.model.User;

public interface UserDao {

    void save(User user);

    User findById(int id);

    User findBySSO(String sso);

}
