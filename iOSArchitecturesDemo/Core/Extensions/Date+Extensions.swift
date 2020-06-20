//
//  Date+Extensions.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 19.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

public extension Date {
    static func dateFormatter(with format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static func appReleaseDate(for date: String, with format: String) -> String? {
        let stringFormatter = dateFormatter(with: format)
        if let date = stringFormatter.date(from: date) {
            let resultFormatter = dateFormatter(with: "dd.MM.YYYY")
            let resultDate = resultFormatter.string(from: date)
            return String("\(resultDate)")
        }
        return nil
    }
}
