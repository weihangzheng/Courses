//
//  CourseView.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-08-21.
//

import SwiftUI

struct CourseView: View {
    var courses = getAllCourses()
    var tc = getCourseTeachers()
    var subject_des = getSubjectDes()
    var body: some View {
        NavigationView{
            List(courses, id: \.self){ courses in
                NavigationLink {
                    VStack{
                        Text(subject_des[courses]!)
                    List(tc[courses]!, id: \.self){ teachers in
                        Text(teachers)
                    }.navigationTitle(courses)
                    }
                } label: {
                    Text(courses)
                }.navigationTitle("Course List")
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
