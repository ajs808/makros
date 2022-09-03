//
//  ProgressBarView.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import SwiftUI

struct ProgressBarView: View {
    var value: Float
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(color)
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(color)
            }.cornerRadius(45.0)
        }
    }
}
//struct ProgressBarView_Previews: PreviewProvider {
//    @State static var progressValue: Float = 0.9
//    static var previews: some View {
//        ProgressBarView(value: $progressValue).frame(height: 20)
//    }
//}
