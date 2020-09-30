//
//  MessageView.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI

struct MessageView: View {

    static private let kSpacer = UIScreen.main.bounds.width / 4

    public let text: String

    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 17))
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(
                    Color.messageBackground
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 1, y: 1)
                )

            Spacer()
                .frame(minWidth: Self.kSpacer)
                .layoutPriority(-1)
        }
    }

}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.viewBackground
                .edgesIgnoringSafeArea(.all)

            MessageView(text: "Build a man a fire, and he'll be warm for a day. Set a man on fire, and he'll be warm for the rest of his life.")
                .padding()
        }
    }
}
