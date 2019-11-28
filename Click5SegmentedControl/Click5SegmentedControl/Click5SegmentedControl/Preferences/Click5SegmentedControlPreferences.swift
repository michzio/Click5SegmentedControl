//
//  Click5SegmentedControlPreferences.swift
//  CRM
//
//  Created by Michal Ziobro on 28/11/2019.
//  Copyright © 2019 Click 5 Interactive. All rights reserved.
//

import SwiftUI

// MARK: - Segmented Element Preference
struct SegmentedElementPreference {
    let index: Int
    let bounds : Anchor<CGRect>
}

struct SegmentedElementPreferenceKey: PreferenceKey {
    
    typealias Value = [SegmentedElementPreference]
    
    static var defaultValue: [SegmentedElementPreference] = []
    
    static func reduce(value: inout [SegmentedElementPreference], nextValue: () -> [SegmentedElementPreference]) {
        
        value.append(contentsOf: nextValue())
    }
}
