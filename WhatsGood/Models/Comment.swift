//
//  Comment.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 2/10/26.
//

import Foundation

struct Comment: Identifiable, Hashable {
    let id: UUID
    let reviewId: UUID
    let userId: UUID
    let text: String
    let date: Date
}
