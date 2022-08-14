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
    var body: some View {
        NavigationView{
            List(teachers, id: \.self){ teacher in
                NavigationLink {
                    List(tc[teacher]!, id: \.self){ subjects in
                        Text(subjects)
                    }
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
