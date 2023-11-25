package com.ecommerce.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;
@Entity
@Table(name = "user")
@NamedQueries({ @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u ORDER BY u.fullName"),
        @NamedQuery(name = "User.ListAll", query = "SELECT u FROM User u"),
        @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
        @NamedQuery(name = "User.countAll", query = "SELECT COUNT(*) FROM User u"),
        @NamedQuery(name = "User.findByEmailAndPassword", query = "SELECT u FROM User u WHERE u.email = :email AND password = :password") })
public class User {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id_user", nullable = false)
    private Integer id;

    @Size(max = 50)
    @Column(name = "email", length = 50)
    private String email;

    @Size(max = 50)
    @Column(name = "password", length = 50)
    private String password;

    @Size(max = 50)
    @Column(name = "full_name", length = 50)
    private String fullName;

    public User() {
    }

    public User(Integer userId, String email, String password, String fullName) {
        this(email, password, fullName);
        this.id = userId;
    }

    public User(String email, String password, String fullName) {
        super();
        this.email = email;
        this.password = password;
        this.fullName = fullName;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

//    @Override
//    public String toString() {
//        return "User{" +
//                "id=" + id +
//                ", email='" + email + '\'' +
//                ", fullName='" + fullName + '\'' +
//                '}';
//    }

}