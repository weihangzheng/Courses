//
//  TeacherList.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-07-18.
//
import SwiftUI

struct TeacherList: View {
    var teachers = getAllTeachers()
    var tc = getTeacherClasses()
    var teacher_des = getTeacherDes()
    var body: some View {
        NavigationView{
            List(teachers, id: \.self){ teacher in
                NavigationLink {
                    VStack{
                    Text(teacher_des[teacher]!)
                    List(tc[teacher]!, id: \.self){ subjects in
                        Text(subjects)
                    }
                    }.navigationTitle(teacher)
                } label: {
                    Text(teacher)
                }.navigationTitle("Teacher List")
            }
        }
    }
}

struct TeacherList_Previews: PreviewProvider {
    static var previews: some View {
        TeacherList()
    }
}
