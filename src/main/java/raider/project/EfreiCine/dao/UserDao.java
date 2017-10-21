package raider.project.EfreiCine.dao;

import raider.project.EfreiCine.model.User;

public interface UserDao {

    User findById(int id);

    User findBySSO(String sso);

}
