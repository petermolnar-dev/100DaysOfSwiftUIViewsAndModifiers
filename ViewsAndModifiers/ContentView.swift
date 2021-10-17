//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Peter Molnar on 16/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var useRedText = false
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            Color.blue
                .frame(width: 300, height: 300)
                .waterMarked(with: "Petermolnar.dev")
            VStack {
                CapsuleText(text: "First")
                CapsuleText(text: "Second")
            }
            Button("Hello World") {
                self.useRedText.toggle()
                print(type(of: self.body))
            }
            .foregroundColor(useRedText ? .red : .yellow)
            .frame(width: 100, height: 100)
            .background(Color.red)
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                    .blur(radius: 5)
                Text("Hufflepuff")
                    .modifier(Title())
                Text("Ravenclaw")
                    .titleStyle()
                Text("Slytherin")
                    .makeProminent()
                motto1
                    .foregroundColor(.red)
                motto2
                    .foregroundColor(.blue)
            }
            .font(.title)
            .blur(radius: 2)
            Text("Hello World")
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.blue)
                .padding()
            .background(Color.yellow)}
       
    }
}

// Creating new view
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

//Creating new modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            Text(text)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(5)
                .rotationEffect(.degrees(45))
        }
    }
}

extension View {
    func waterMarked(with text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
}

struct Prominent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.blue)
    }
}

extension View {
    func makeProminent() -> some View {
        self.modifier(Prominent())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
