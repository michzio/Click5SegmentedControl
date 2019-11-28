//
//  Click5SegmentedControl.swift
//  CRM
//
//  Created by Michal Ziobro on 27/11/2019.
//  Copyright © 2019 Click 5 Interactive. All rights reserved.
//

import SwiftUI

struct Click5SegmentedControl: View {

    var elements: [AnyView]

    @Binding var selectedElement: Int

    private var factor: CGFloat = 0.95

    let backgroundColor : Color
    let selectionColor : Color
    let textColor: Color
    let selectedTextColor: Color

    init<A: View, B: View, C: View>(backgroundColor: Color = .white, selectionColor: Color = .black,
         textColor: Color = .black, selectedTextColor: Color = .white,
         selection: Binding<Int>, @ViewBuilder content: () -> TupleView<(A, B, C)>) {
        self.backgroundColor = backgroundColor
        self.selectionColor = selectionColor
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        
        self._selectedElement = selection
        
        let views = content().value
        self.elements = [AnyView(views.0), AnyView(views.1), AnyView(views.2)]
    }
    
    func makeBackgroundView(geometry: GeometryProxy) -> some View {
            Capsule()
                .foregroundColor(self.backgroundColor)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                
                HStack(alignment: .center) {
                    ForEach(0..<self.elements.count, id: \.self) { i in
                        
                        Click5SegmentedElement(self.$selectedElement, index: i) {
                            self.elements[i]
                        }
                        .foregroundColor( (self.selectedElement == i) ? self.selectedTextColor : self.textColor)
                        .transition(.opacity)
                        .gesture(TapGesture().onEnded { _ in
                            print("Selected segment element: \(i)")
                            withAnimation {
                                self.selectedElement = i
                            }
                        })
                    }
                }
                .padding(6)
                .backgroundPreferenceValue(SegmentedElementPreferenceKey.self) { preferences in
                    GeometryReader { geometry in
                        ZStack {
                            self.makeSelectionBackground(geometry, preferences)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                    }
                }
                .background(self.makeBackgroundView(geometry: geometry))
                
            }
        }
    }
    
    func makeSelectionBackground(_ geometry: GeometryProxy, _ preferences: [SegmentedElementPreference]) -> some View {
        
        let pref = preferences.first(where: { $0.index == self.selectedElement })
        let bounds = pref != nil ? geometry[pref!.bounds] : .zero
        
        return Group {
            if  bounds.minX < 0  {
                EmptyView()
            } else {
                
                Capsule()
                    .foregroundColor(self.selectionColor)
                    .frame(width: bounds.size.width+12, height: bounds.size.height+12)
                    .offset(x: bounds.minX-6, y: bounds.minY-6)
                    .animation(.easeInOut(duration: 0.25))
            }
        }
    }
}

struct Click5SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        Click5SegmentedControl(selection: .constant(0)) {
            Text("Label 1")
            Text("Label 2")
            Text("Label 3")
        }
    }
}
