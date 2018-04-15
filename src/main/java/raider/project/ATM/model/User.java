package raider.project.ATM.model;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

    @Entity
    @Table(name="APP_USER")
    public class User {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    @NotEmpty
    @Column(name="SSO_ID", unique=true, nullable=false)
    private String ssoId;

    @NotEmpty
    @Column(name="PASSWORD", nullable=false)
    private String password;

    @NotEmpty
    @Column(name="FIRST_NAME", nullable=false)
    private String firstName;

    @NotEmpty
    @Column(name="LAST_NAME", nullable=false)
    private String lastName;

    @NotEmpty
    @Column(name="EMAIL", nullable=false)
    private String email;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "APP_USER_USER_PROFILE",
            joinColumns = { @JoinColumn(name = "USER_ID") },
            inverseJoinColumns = { @JoinColumn(name = "USER_PROFILE_ID") })
    private Set<UserProfile> userProfiles = new HashSet<>();


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "APP_USER_BANK",
            joinColumns = { @JoinColumn(name = "USER_ID") },
            inverseJoinColumns = { @JoinColumn(name = "BANK_ID") })
    private Set<UserProfile> userBank = new HashSet<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSsoId() {
        return ssoId;
    }

    public void setSsoId(String ssoId) {
        this.ssoId = ssoId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<UserProfile> getUserProfiles() {
        return userProfiles;
    }

    public void setUserProfiles(Set<UserProfile> userProfiles) {
        this.userProfiles = userProfiles;
    }

    public Set<UserProfile> getUserBank() {
        return userBank;
    }

    public void setUserBank(Set<UserProfile> userBank) {
        this.userBank = userBank;
    }


        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            User user = (User) o;

            if (id != user.id) return false;
            if (ssoId != null ? !ssoId.equals(user.ssoId) : user.ssoId != null) return false;
            if (password != null ? !password.equals(user.password) : user.password != null) return false;
            if (firstName != null ? !firstName.equals(user.firstName) : user.firstName != null) return false;
            if (lastName != null ? !lastName.equals(user.lastName) : user.lastName != null) return false;
            if (email != null ? !email.equals(user.email) : user.email != null) return false;
            if (userProfiles != null ? !userProfiles.equals(user.userProfiles) : user.userProfiles != null)
                return false;
            return userBank != null ? userBank.equals(user.userBank) : user.userBank == null;
        }

        @Override
        public int hashCode() {
            int result = id;
            result = 31 * result + (ssoId != null ? ssoId.hashCode() : 0);
            result = 31 * result + (password != null ? password.hashCode() : 0);
            result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
            result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
            result = 31 * result + (email != null ? email.hashCode() : 0);
            result = 31 * result + (userProfiles != null ? userProfiles.hashCode() : 0);
            result = 31 * result + (userBank != null ? userBank.hashCode() : 0);
            return result;
        }

        @Override
        public String toString() {
            return "User{" +
                    "id=" + id +
                    ", ssoId='" + ssoId + '\'' +
                    ", password='" + password + '\'' +
                    ", firstName='" + firstName + '\'' +
                    ", lastName='" + lastName + '\'' +
                    ", email='" + email + '\'' +
                    ", userProfiles=" + userProfiles +
                    ", userBank=" + userBank +
                    '}';
        }
    }