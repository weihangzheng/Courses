//
//  MenuScreen.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-08-14.
//

import SwiftUI

struct MenuScreen: View {
    var body: some View {
        NavigationView{
            NavigationLink {
                TeacherList()
            } label: {
                Text("Teacher List")
            }.navigationTitle("Main Menu")
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
