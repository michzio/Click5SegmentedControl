//
//  Click5SegmentedElement.swift
//  CRM
//
//  Created by Michal Ziobro on 27/11/2019.
//  Copyright © 2019 Click 5 Interactive. All rights reserved.
//

import SwiftUI

struct Click5SegmentedElement<Content>: View where Content: View {
    
    @Binding var selectedElement: Int
    
    let index : Int
    let content: () -> Content
    
    @inlinable init(_ selectedElement: Binding<Int>, index: Int, @ViewBuilder content: @escaping () -> Content) {
        self._selectedElement = selectedElement
        
        self.index = index
        self.content = content
    }
    
    var body: some View {
        self.content()
            .fixedSize(horizontal: true, vertical: true)
            //.frame(minWidth: geometry.size.width, minHeight: geometry.size.height)
            .contentShape(Rectangle())
        .anchorPreference(key: SegmentedElementPreferenceKey.self, value: .bounds, transform: { [SegmentedElementPreference(index: self.index, bounds: $0)] })
    }
}

struct Click5SegmentedElement_Previews: PreviewProvider {
    static var previews: some View {
        Click5SegmentedElement(.constant(1), index: 0) {
            Text("Title")
        }
    }
}
