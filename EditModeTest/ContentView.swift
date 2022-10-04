//
//  ContentView.swift
//  EditModeTest
//
//  Created by Duncan Babbage on 4/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var emails: [Email] = [
        Email(label: "work", value: "test@example.com"),
        Email(label: "home", value: "test@gmail.com")
    ]
    
    var body: some View {
        // let _ = Self._printChanges()

        NavigationView {
            List {
                ForEach($emails) { $email in
                    EmailRow(email: email)
                }
                .onMove { indexSet, offset in
                    emails.move(fromOffsets: indexSet, toOffset: offset)
                }
                .onDelete { indexSet in
                    emails.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("EditMode Test", displayMode: .large)
            .toolbar {
                EditButton()
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
