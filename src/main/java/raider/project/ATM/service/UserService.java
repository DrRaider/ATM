package raider.project.ATM.service;

import raider.project.ATM.model.User;

public interface UserService {

    void save(User user);

    User findById(int id);

    User findBySso(String sso);

}