//
//  MessagesDispatcher.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import SwiftUI
import Combine

private let kQuotes = [
    "Five exclamation marks, the sure sign of an insane mind.",
    "Build a man a fire, and he'll be warm for a day. Set a man on fire, and he'll be warm for the rest of his life.",
    "The trouble with having an open mind, of course, is that people will insist on coming along and trying to put things in it.",
    "In ancient times cats were worshipped as gods; they have not forgotten this.",
//    "Real stupidity beats artificial intelligence every time.",
//    "In the beginning there was nothing, which exploded.",
//    "Coming back to where you started is not the same as never leaving.",
//    "Stories of imagination tend to upset those without one.",
//    "Only in our dreams are we free. The rest of the time we need wages.",
//    "The truth may be out there, but the lies are inside your head.",
]

class MessagesDispatcher: ObservableObject {

    public let message = PassthroughSubject<String, Never>()

    private var isConnected = false

    private var messages = kQuotes

    public func connect() {
        guard !isConnected else { return }

        isConnected = true
        fetchNext()
    }

    public func fetchNext() {
        guard !messages.isEmpty else { return }

        let text = messages.removeFirst()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.message.send(text)
        }
    }

}

extension Array where Element == String {

    static let quotes = kQuotes

}
