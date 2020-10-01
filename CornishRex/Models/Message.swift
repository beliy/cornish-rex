//
//  Message.swift
//  CornishRex
//
//  Created by Alexey Belousov on 01.10.2020.
//  Copyright © 2020 ArtRobot. All rights reserved.
//

import Foundation

struct Message: Identifiable, Codable, Equatable {

    public let id: Int

    public let line: String

}
