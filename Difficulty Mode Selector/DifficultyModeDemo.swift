//
//  DifficultyModeDemo.swift
//  Switcher CXXVII
//
//  Created by Oleg Frolov on 30/05/2023.
//

import SwiftUI

struct DifficultyModeDemo: View {
    var body: some View {
        ZStack
        {
            Color("LightBG")
            DifficultyMode()
        }
        .ignoresSafeArea()
    }
}

struct DifficultyModeDemo_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyModeDemo()
    }
}
