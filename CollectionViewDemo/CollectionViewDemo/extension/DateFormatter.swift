//
//  Date.swift
//  CollectionViewDemo
//
//  Created by Shoko Nakaki on 2023/06/14.
//

import Foundation

extension DateFormatter {
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMMkHmm", options: 0, locale: Locale(identifier: "ja_JP"))
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }
}

