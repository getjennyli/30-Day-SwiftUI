//
//  MenuView.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/2/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationView {
            Form {
                ForEach (1 ..< 31) {
                    Text("Day \($0)")
                        
                }
            }
            .navigationBarTitle("30-Day SwiftUI")
        }
        

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
