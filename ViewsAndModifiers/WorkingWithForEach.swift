//
//  WorkingWithForEach.swift
//  ViewsAndModifiers
//
//  Created by Peter Molnar on 18/10/2021.
//

import SwiftUI

struct WorkingWithForEach: View {
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    
    var body: some View {
        VStack {
            ForEach(agents, id: \.self) {
                Text($0)
            }
        }
    }
}

struct WorkingWithForEach_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithForEach()
    }
}
