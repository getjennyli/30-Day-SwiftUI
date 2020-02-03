//
//  NewCounter.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/2/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct NewCounter: View {

    @State private var title = ""
    @State private var goal = ""
    @State private var type = ["Daily", "Counter"]
    @State private var selectedType = 0
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                Form {
                    Section {
                        TextField("Enter Title", text: $title)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                    }
                    Section(header: Text("Type")) {
                        Picker(selection: $selectedType, label: Text("Select Type")) {
                            ForEach (0 ..< type.count) {
                                Text("\(self.type[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    TextField("Enter goal", text: $goal)
                        .foregroundColor(.white)
                        .keyboardType(.numberPad)
                .background(Color.white)
                }
                Button(action: {
                    
                }) {
                    Text("Add")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 330, height: 40, alignment: .center)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .cornerRadius(100)
                }
            }
        }
    }
}

struct NewCounter_Previews: PreviewProvider {
    static var previews: some View {
        NewCounter()
    }
}

