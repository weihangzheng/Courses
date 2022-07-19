//
//  ContentView.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-07-18.
//

import SwiftUI

struct ContentView: View {
    var classes = loadCSV(from: "classes")
    var body: some View {
        List(classes){ Class in
            Text(Class.teacher_name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
