package model;


public class ProfileBean {


private String name;
private String studentID;
private String program;
private String email;
private String hobby;
private String intro;



public String getName(){
    return name;
}

public void setName(String name){
    this.name=name;
}



public String getStudentID(){
    return studentID;
}

public void setStudentID(String studentID){
    this.studentID=studentID;
}



public String getProgram(){
    return program;
}

public void setProgram(String program){
    this.program=program;
}



public String getEmail(){
    return email;
}

public void setEmail(String email){
    this.email=email;
}



public String getHobby(){
    return hobby;
}

public void setHobby(String hobby){
    this.hobby=hobby;
}



public String getIntro(){
    return intro;
}

public void setIntro(String intro){
    this.intro=intro;
}


}