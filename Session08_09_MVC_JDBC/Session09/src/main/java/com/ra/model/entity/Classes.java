package com.ra.model.entity;

public class Classes {
private int classID;
private String className;
private boolean classStatus;

    public Classes() {
    }

    public Classes(int classID, String className, boolean classStatus) {
        this.classID = classID;
        this.className = className;
        this.classStatus = classStatus;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public boolean isClassStatus() {
        return classStatus;
    }

    public void setClassStatus(boolean classStatus) {
        this.classStatus = classStatus;
    }
}
