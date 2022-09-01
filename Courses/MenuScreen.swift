//
//  MenuScreen.swift
//  Courses
//
//  Created by Weihang Zheng on 2022-08-14.
//

import SwiftUI
struct BananaButtonStyle: ButtonStyle {
    var color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        BananaButton(configuration: configuration, color: color)
    }

    struct BananaButton: View {
        let configuration: BananaButtonStyle.Configuration
        let color: Color

        var body: some View {
            configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(color))
                .scaleEffect(configuration.isPressed ? 0.8: 1)
                .animation(.spring())
        }
    }
}

struct MenuScreen: View {
    var body: some View {
        NavigationView {
                    VStack {
                        Text("99 Cultural Exchange Education").frame(maxWidth: .infinity, alignment:.center).font(Font.title.weight(.black)).multilineTextAlignment(.center)
                        Image("99").resizable()
                            .frame(width: 200.0, height: 200.0)
                        NavigationLink(destination: TeacherList()) {
                            Text("Teacher List （教师名单）")
                        }.buttonStyle(BananaButtonStyle(color: .purple))

                        NavigationLink(destination: CourseView()) {
                            Text("Course List （课程清单）")
                        }.buttonStyle(BananaButtonStyle(color: .purple))
                        
                        

                        
                    }.listStyle(PlainListStyle())
                }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
