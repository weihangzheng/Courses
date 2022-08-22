//
//  MenuScreen.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-08-14.
//

import SwiftUI

struct MenuScreen: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: TeacherList()) {
                            Text("Teacher List")
                        }

                        NavigationLink(destination: CourseView()) {
                            Text("Course List")
                        }
                        
                    }.navigationTitle("Main Menu").multilineTextAlignment(.center)
                }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
