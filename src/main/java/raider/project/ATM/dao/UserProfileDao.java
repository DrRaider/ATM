package raider.project.ATM.dao;

import java.util.List;

import raider.project.ATM.model.UserProfile;

public interface UserProfileDao {

    List<UserProfile> findAll();

    UserProfile findByType(String type);

    UserProfile findById(int id);
}