package raider.project.EfreiCine.dao;

import java.util.List;

import raider.project.EfreiCine.model.UserProfile;

public interface UserProfileDao {

    List<UserProfile> findAll();

    UserProfile findByType(String type);

    UserProfile findById(int id);
}