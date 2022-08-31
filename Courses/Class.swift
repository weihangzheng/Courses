//
//  Class.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-07-18.
//
import Foundation

struct Class: Identifiable{
    var id = UUID()
    var teacher_name: String
    var area: String
    var subject: String
    var program: String
    
    init(raw: [String]){
        teacher_name = raw[0]
        area = raw[1]
        subject = raw[2]
        program = raw[3]
    }
}

struct Teacher_Des: Identifiable{
    var id = UUID()
    var teacher_name: String
    var description: String
    
    init(raw: [String]){
        teacher_name = raw[0]
        description = raw[1]
    }
}

func loadCSV(from csvName: String) -> [Class]{
    
    var csvToStruct = [Class]()
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else{
        return []
    }
    
    var data = ""
    do{
        data = try String(contentsOfFile: filePath)
    }catch{
        print(error)
        return []
    }
    var rows = data.components(separatedBy: "\n")
    rows.removeFirst()
    
    for row in rows{
        let csvColumns = row.description.components(separatedBy: ",")
        let teamStruct = Class.init(raw: csvColumns)
        csvToStruct.append(teamStruct)
    }
    
    return csvToStruct
}

func loadCSVTeacherDes(from csvName: String) -> [Teacher_Des]{
    
    var csvToStruct = [Teacher_Des]()
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else{
        return []
    }
    
    var data = ""
    do{
        data = try String(contentsOfFile: filePath)
    }catch{
        print(error)
        return []
    }
    var rows = data.components(separatedBy: "\n")
    rows.removeFirst()
    
    for row in rows{
        let csvColumns = row.description.components(separatedBy: ",")
        let teamStruct = Teacher_Des.init(raw: csvColumns)
        csvToStruct.append(teamStruct)
    }
    
    return csvToStruct
}


func getAllTeachers() -> [String]{
    let classes = loadCSV(from: "classes")
    var teachers: Set<String> = []
    for line in classes{
        teachers.insert(line.teacher_name)
    }
    var teacher_list = [String]()
    for teacher in teachers{
        teacher_list.append(teacher)
    }
    teacher_list = teacher_list.sorted()
    
    return teacher_list
}

func getTeacherClasses() -> [String:[String]]{
    let classes = loadCSV(from: "classes")
    var teacher_classes: [String:[String]] = [:]
    for line in classes{
        teacher_classes[line.teacher_name, default: []].append(line.subject)
    }
    return teacher_classes
}

func getAllCourses() -> [String]{
    let classes = loadCSV(from: "classes")
    var courses: Set<String> = []
    for line in classes{
        courses.insert(line.subject)
    }
    var course_list = [String]()
    for course in courses{
        course_list.append(course)
    }
    course_list = course_list.sorted()
    return course_list
}

func getCourseTeachers() -> [String:[String]]{
    let classes = loadCSV(from: "classes")
    var course_teachers: [String:[String]] = [:]
    for line in classes{
        course_teachers[line.subject, default: []].append(line.teacher_name)
    }
    return course_teachers
}

func getTeacherDes() -> [String:String]{
    let classes = loadCSVTeacherDes(from: "teacher_des - Sheet1")
    var teacher_des: [String:String] = [:]
    for line in classes{
        teacher_des[line.teacher_name] = line.description
    }
    return teacher_des
}

func getSubjectDes() -> [String:String]{
    let classes = loadCSVTeacherDes(from: "subject_des - Sheet1")
    var teacher_des: [String:String] = [:]
    for line in classes{
        teacher_des[line.teacher_name] = line.description
    }
    return teacher_des
}

