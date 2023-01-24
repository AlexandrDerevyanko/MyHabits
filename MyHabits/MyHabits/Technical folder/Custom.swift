//
//  Custom.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 20.01.2023.
//

import Foundation
import UIKit

let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .none
    dateFormatter.timeStyle = .short
    return dateFormatter
}()

var timeForView: String = dateFormatter.string(from: Date())
