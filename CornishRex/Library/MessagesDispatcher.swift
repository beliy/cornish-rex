//
//  MessagesDispatcher.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI
import Combine

class MessagesDispatcher: ObservableObject {

    public let message = PassthroughSubject<Message, Never>()

    private var isConnected = false

    private var messages: [Message] = .messages

    public func connect() {
        guard !isConnected else { return }

        isConnected = true
        fetchNext()
    }

    public func fetchNext() {
        guard !messages.isEmpty else { return }

        let message = messages.removeFirst()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.message.send(message)
        }
    }

}
