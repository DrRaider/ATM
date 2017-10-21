package raider.project.EfreiCine.service;

import raider.project.EfreiCine.model.User;

public interface UserService {

    User findById(int id);

    User findBySso(String sso);

}