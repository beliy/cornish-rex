//
//  DialogueView.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI

struct DialogueView: View {

    public let messages: [String]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                ForEach(messages, id: \.self) { message in
                    Group {
                        MessageView(text: message)
                    }
                }.scaleEffect(x: 1, y: -1, anchor: .center)

                Divider()
                    .hidden()
            }.padding(.horizontal)
                .padding(.vertical, 30)
        }.background(
                Color.viewBackground
                    .edgesIgnoringSafeArea(.all)
            )
            .scaleEffect(x: 1, y: -1)
    }

}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(messages: .quotes)
    }
}
