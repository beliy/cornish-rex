//
//  SpeechSynthesizer.swift
//  CornishRex
//
//  Created by Alexey Belousov on 30.09.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import AVFoundation
import Combine

class SpeechSynthesizer: NSObject, ObservableObject {

    public let didStart = PassthroughSubject<AVSpeechUtterance, Never>()

    public let didFinish = PassthroughSubject<AVSpeechUtterance, Never>()

    private let synthesizer = AVSpeechSynthesizer()

    private let isAudible: Bool

    init(isAudible flag: Bool = true) {
        isAudible = flag
        super.init()
        synthesizer.delegate = self
    }

    func speak(_ string: String) {
        let utterance = AVSpeechUtterance(string: string)

        if isAudible {
            synthesizer.speak(utterance)
        } else {
            speechSynthesizer(synthesizer, didStart: utterance)
            speechSynthesizer(synthesizer, didFinish: utterance)
        }
    }

}

extension SpeechSynthesizer: AVSpeechSynthesizerDelegate {

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        didStart.send(utterance)
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        didFinish.send(utterance)
    }

}
