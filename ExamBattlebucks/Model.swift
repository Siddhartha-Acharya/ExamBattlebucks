//
//  Model.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import Foundation

struct Model: Codable, Identifiable {
    var id: Int64?
    var userId: Int64?
    var title: String?
    var body: String?
}
