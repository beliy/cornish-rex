//
//  DialogueView.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI

private extension AnyTransition {

    static let custom = AnyTransition.offset(x: 0, y: -300).combined(with: .opacity)

}

struct DialogueView: View {

    public let messages: [Message]

    var body: some View {
        VStack(spacing: 1) {
            Divider()
                .hidden()

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(messages) { message in
                        Group {
                            if message == self.messages.last {
                                MessageView(text: message.line)
                            } else {
                                MessageView(text: message.line)
                                    .transition(.custom)
                            }
                        }
                    }.scaleEffect(x: 1, y: -1, anchor: .center)

                    Divider()
                        .hidden()
                }.padding(.horizontal)
                    .padding(.top, 40)
            }.scaleEffect(x: 1, y: -1)
        }.background(
            Color.viewBackground
                .edgesIgnoringSafeArea(.all)
        )
    }

}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(messages: .messages)
    }
}
