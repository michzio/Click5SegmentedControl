//
//  ContentView.swift
//  Click5SegmentedControl
//
//  Created by Michal Ziobro on 28/11/2019.
//  Copyright © 2019 Click 5 Interactive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sectionSelection: Int = 0
    
    let sections: [String] = ["Section 1", "Tab 2", "Segment 3"]
    
    var body: some View {
        Click5SegmentedControl(backgroundColor: .gray, selectionColor: .black, selection: self.$sectionSelection) {
                
                Text("Activity Feed".uppercased())
                .font( (self.sectionSelection == 0) ? .custom("AvenirNext-DemiBold", size: 13) : .custom("AvenirNext-Medium", size: 13))
                    .foregroundColor( (self.sectionSelection == 0) ? .white : .black)
                    .padding(.horizontal, 4)
                
                Text("Notifications".uppercased())
                .font( (self.sectionSelection == 1) ? .custom("AvenirNext-DemiBold", size: 13) : .custom("AvenirNext-Medium", size: 13))
                    .foregroundColor( (self.sectionSelection == 1) ? .white : .black)
                    .padding(.horizontal, 4)
                
                Text("Recently Opened".uppercased())
                .font( (self.sectionSelection == 2) ? .custom("AvenirNext-DemiBold", size: 13) : .custom("AvenirNext-Medium", size: 13))
                    .foregroundColor( (self.sectionSelection == 2) ? .white : .black)
                    .padding(.horizontal, 4)
                
        }
        .frame(height: 30)
        .padding(.vertical, 12)
        .background(Color("DashboardBackground"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
