//
//  Email.swift
//  EditModeTest
//
//  Created by Duncan Babbage on 5/10/22.
//

import Foundation

class Email: Identifiable, ObservableObject {
    var label: String
    var value: String
    let id = UUID()

    init(label: String, value: String) {
        self.label = label
        self.value = value
    }
}
