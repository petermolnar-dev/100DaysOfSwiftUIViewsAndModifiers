//
//  WorkingWithBindings.swift
//  ViewsAndModifiers
//
//  Created by Peter Molnar on 18/10/2021.
//

import SwiftUI

struct WorkingWithBindings: View {
    @State var selection = 0
    
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
    var body: some View {
        let binding = Binding(get: { self.selection },
                              set: {self.selection = $0 })
        
        let agreedToAll = Binding(get: {
            self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToEmails
        }, set: {
            self.agreedToTerms = $0
            self.agreedToPrivacyPolicy = $0
            self.agreedToEmails = $0
        })
        
        return VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }.pickerStyle(SegmentedPickerStyle())
            VStack {
                Toggle(isOn: $agreedToTerms) {
                    Text("Agree to terms")
                }
                Toggle(isOn: $agreedToPrivacyPolicy) {
                    Text("Agreed to privacy policy")
                }
                Toggle(isOn: $agreedToEmails) {
                    Text("Agree to receive shipping emails")
                }
                Spacer()
                Toggle(isOn: agreedToAll) {
                    Text("Agree to all")
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct WorkingWithBindings_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithBindings()
    }
}
