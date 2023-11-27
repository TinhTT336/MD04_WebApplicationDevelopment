package model.entity;

public class User {
    private int userId;
    private String userName;
    private String address;
    private String phone;

    public User() {
    }

    public User(int userId, String userName, String address, String phone) {
        this.userId = userId;
        this.userName = userName;
        this.address = address;
        this.phone = phone;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
