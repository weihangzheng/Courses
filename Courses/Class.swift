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
