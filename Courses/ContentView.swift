//
//  ContentView.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-07-18.
//

import SwiftUI

struct ContentView: View {
    var teachers = getAllTeachers()
    var body: some View {
        List(teachers, id: \.self){ teacher in
            Text(teacher)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
