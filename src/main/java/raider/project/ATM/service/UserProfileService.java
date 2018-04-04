package raider.project.ATM.service;

import java.util.List;

import raider.project.ATM.model.UserProfile;


public interface UserProfileService {

    List<UserProfile> findAll();

    UserProfile findByType(String type);

    UserProfile findById(int id);
}