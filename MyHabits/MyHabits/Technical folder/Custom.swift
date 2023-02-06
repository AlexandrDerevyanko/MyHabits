//
//  Custom.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 20.01.2023.
//

import Foundation
import UIKit

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = .init(identifier: "ru_RU")
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    formatter.doesRelativeDateFormatting = true
    return formatter
}()

var timeForView: String = dateFormatter.string(from: Date())

class SecondTableViewCell: UITableViewCell {
    
}
