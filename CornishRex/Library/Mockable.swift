//
//  Mockable.swift
//  CornishRex
//
//  Created by Alexey Belousov on 01.10.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import Foundation

private let kDecoder = JSONDecoder()

private protocol Mockable {}

extension Mockable {

    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            return try kDecoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}

// MARK: - Array

extension Array: Mockable { }

// MARK: - Messages

extension Array where Element == Message {

    static let messages: Self = .load("messages.json")

}
