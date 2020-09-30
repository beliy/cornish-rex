//
//  ContentView.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var dispatcher: MessagesDispatcher

    @EnvironmentObject private var synthesizer: SpeechSynthesizer

    @State private var messages: [String] = []

    var body: some View {
        NavigationView {
            DialogueView(messages: messages)
                .navigationBarTitle("Dialogue", displayMode: .inline)
        }.onReceive(dispatcher.message, perform: display(message:))
            .onReceive(dispatcher.message.delay(for: 1, scheduler: RunLoop.main), perform: speak(message:))
            .onReceive(synthesizer.didFinish, perform: proceed)
            .onAppear(perform: dispatcher.connect)
    }
    
}

extension ContentView {

    private func display(message: String) {
        withAnimation {
            messages.insert(message, at: 0)
        }
    }

    private func speak(message: String) {
        synthesizer.speak(message)
    }

    private func proceed(_ utterance: Any) {
        dispatcher.fetchNext()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SpeechSynthesizer(isAudible: false))
            .environmentObject(MessagesDispatcher())
    }
}
