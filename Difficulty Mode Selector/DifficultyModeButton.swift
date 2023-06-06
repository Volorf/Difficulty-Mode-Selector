//  Created by Oleg Frolov on 30/05/2023.
//  www.olegfrolov.design

import SwiftUI

struct DifficultyModeButton: View
{
    let mode: Mode
    let axis: Axis
    
    @Binding var currentMode: Mode
    @Binding var isPressed: Bool
    @Binding var currentAxis: Axis
    
    @State private var fontColor: Color = .yellow
    @State private var fontWeight: Double = 0
    @State private var duration: Double = 0.5
    
    private let fontSize = 24.0
    private let minFontWeight = 300.0
    private let maxFontWeight = 900.0
    
    private let defaultColor = Color("Dark30")
    private let hoverColor = Color("Dark")
    private let activeColor = Color("Dark")
    
    
    var body: some View
    {
        Text("\(mode.rawValue)")
            .font(.inter(size: fontSize, weight: currentMode == mode ? maxFontWeight : minFontWeight))
            .foregroundColor(currentMode == mode ? activeColor : defaultColor)
            .frame(width: 160, height: 64, alignment: .leading)
            .animation(.easeOut(duration: duration), value: currentMode)
        
            .background(.white)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    
                    if (!isPressed)
                    {
                        currentAxis = axis
                        print("Down")
                        isPressed = true
                        currentMode = .None
                    }
                }
                .onEnded { _ in
                    if (isPressed)
                    {
                        currentAxis = (x: 0.0, y: 0.0, z: 0.0)
                        print("Up")
                        print("\(mode.rawValue) has been pressed")
                        currentMode = mode
                        print("Current mode is \(currentMode)")
                        isPressed = false
                    }
                })
    }
}

struct TouchDownAndUpButtonStyle: ButtonStyle {
    let actionOnTapDown: () -> Void
    let actionOnTapUp: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    // Button touch began
                    self.actionOnTapDown()
                }
                .onEnded { _ in
                    // Button touch ended
                    self.actionOnTapUp()
                }
            )
        
        //            .background(.red)
    }
}

struct DifficultyModeButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
        {
            Color.red
            VStack(spacing: 0)
            {
                DifficultyModeButton(mode: .Easy, axis: (x: 0.0, y: 0.0, z: 0.0),currentMode: .constant(.Easy), isPressed: .constant(false), currentAxis: .constant((x: 0, y: 0, z: 0)))
                DifficultyModeButton(mode: .Normal, axis: (x: 0.0, y: 0.0, z: 0.0), currentMode: .constant(.Easy), isPressed: .constant(false), currentAxis: .constant((x: 0, y: 0, z: 0)))
            }
        }
        
    }
}
