//
//  Badge.swift
//  DjiProfile
//
//  Created by Nguyen Dang Quy on 28/03/2022.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        //RotatedBadgeSymbol(angle: Angle(degrees: 0))
        //lặp lại biểu tượng vòng quay 360 độ
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackgroud()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
