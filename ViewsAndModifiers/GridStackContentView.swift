//
//  GridStackContentView.swift
//  ViewsAndModifiers
//
//  Created by Peter Molnar on 17/10/2021.
//

import SwiftUI

struct GridStackContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
                .padding(2)
                .imageScale(.large)
            Text("R\(row) C\(col)")
                .font(.system(.headline, design: .monospaced))
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    // ViewBuilder
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct GridStackContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridStackContentView()
    }
}
