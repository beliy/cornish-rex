//
//  MessageBackgroundShape.swift
//  CornishRex
//
//  Created by Alexey Belousov on 01.10.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI

struct MessageBackgroundShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerSize = 5

        path.addRoundedRect(in: CGRect(x: 11, y: 0, width: rect.size.width - 11, height: rect.size.height), cornerSize: CGSize(width: cornerSize, height: cornerSize))

        path.addLines([
            CGPoint(x: 0, y: rect.size.height),
            CGPoint(x: 11, y: rect.size.height - 18),
            CGPoint(x: 22, y: rect.size.height),
        ])

        path.closeSubpath()

        return path
    }

}

struct MessageBackgroundShape_Previews: PreviewProvider {
    static var previews: some View {
        Color.red
            .clipShape(MessageBackgroundShape())
            .frame(width: 200, height: 100)
    }
}
