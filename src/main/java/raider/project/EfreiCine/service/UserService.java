package raider.project.EfreiCine.service;

import raider.project.EfreiCine.model.User;

public interface UserService {

    void save(User user);

    User findById(int id);

    User findBySso(String sso);

}