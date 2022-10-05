//
//  EmailRow.swift
//  EditModeTest
//
//  Created by Duncan Babbage on 5/10/22.
//

import SwiftUI

struct EmailRow: View {
    @ObservedObject var email: Email
    @FocusState private var focusedField: String?
    @Environment(\.editMode) private var editMode
    var body: some View {
        // let _ = Self._printChanges()

        VStack {
            if editMode?.wrappedValue.isEditing == true {
                TextField("label", text: $email.label)
                    .focused($focusedField, equals: "label-\(email.id.uuidString)")
                    .font(.subheadline)
            } else {
                Text(email.label)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
            }
            if editMode?.wrappedValue.isEditing == true {
                TextField("email", text: $email.value)
                    .focused($focusedField, equals: "email-\(email.id.uuidString)")
            } else {
                Text(email.value)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    init(email: Email) {
        self.email = email
    }
}
