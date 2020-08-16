//
//  D5.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/5/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI
// View composition
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

// Custom modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
struct footer: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(4)
                .background(Color.orange)
            
        }
    }
}
extension View {
func footered(with text: String) -> some View {
    self.modifier(footer(text: text))
}
}
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}
extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
struct D5: View {
    let motto2 = Text("nunquam titillandus")
    var motto1: some View { Text("Draco dormiens") }
    
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
                .watermarked(with: "Hacking with Swift")
            VStack{
                
                CapsuleText(text: "Test t")
                motto1
                    .modifier(Title())
                motto2
                    .titleStyle()
                
                Text("Hello World")
                    .padding()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
                    .padding()
                    .background(Color.green)
                    .padding()
                    .background(Color.yellow)
            }
        }
    }
}

struct D5_Previews: PreviewProvider {
    static var previews: some View {
        D5()
    }
}
