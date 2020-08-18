//
//  Book.swift
//  ReadMe
//
//  Created by Himanshu  on 15/08/20.
//  Copyright © 2020 Himanshu . All rights reserved.
//

import UIKit

struct Book: Hashable {
    let title: String
    let author: String
    var review: String?
    var readMe: Bool
    
    var image: UIImage?
    
    static let mockBook = Book(title: "", author: "", readMe: true)
}

extension Book: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case review
        case readMe
    }
}
