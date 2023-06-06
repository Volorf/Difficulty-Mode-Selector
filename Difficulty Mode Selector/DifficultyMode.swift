//  Created by Oleg Frolov on 30/05/2023.
//  www.olegfrolov.design

import SwiftUI

enum Mode: String
{
    case Easy = "Easy"
    case Normal = "Normal"
    case Hard = "Hard"
    case None = "None"
}

typealias Axis = (CGFloat, CGFloat, CGFloat)

struct DifficultyMode: View
{    
    @State private var currentMode: Mode = .Easy
    @State private var shadowRadius: Double = 96
    @State private var shadowYOffset: Double = 96
    @State private var isPressed: Bool = false
    
    @State private var axis: Axis = (x: 0.0, y: 0.0, z: 0.0)
    
    private let easyAxis: Axis = (x: 1.0, y: 0.0, z: 0.0)
    private let normalAxis: Axis = (x: 0.0, y: 0.0, z: 0.0)
    private let hardAxis: Axis = (x: -1.0, y: 0.0, z: 0.0)
    
    private let angle: Double = 20
    
    var body: some View
    {
        VStack(spacing: 0)
        {
            DifficultyModeButton(mode: .Easy, axis: easyAxis, currentMode: $currentMode, isPressed: $isPressed, currentAxis: $axis )
            DifficultyModeButton(mode: .Normal, axis: normalAxis, currentMode: $currentMode, isPressed: $isPressed, currentAxis: $axis)
            DifficultyModeButton(mode: .Hard, axis: hardAxis, currentMode: $currentMode, isPressed: $isPressed, currentAxis: $axis)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
        .background(.white)
        .cornerRadius(24)
        .rotation3DEffect(.degrees(isPressed ? angle : 0.0), axis: axis)
        .scaleEffect(isPressed ? 0.8 : 1)
        .animation(.easeOut(duration: 0.5), value: isPressed)
    }
}

struct DifficultyMode_Previews: PreviewProvider
{
    static var previews: some View
    {
        ZStack
        {
            Color("LightBG")
            DifficultyMode()
        }
    }
}
