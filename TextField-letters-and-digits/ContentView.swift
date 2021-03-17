//
//  ContentView.swift
//  TextField-letters-and-digits
//
//  Created by yorifuji on 2021/03/17.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    var body: some View {
        TextField("[A-Za-z0-9]", text: $username)
            .autocapitalization(.none)
            .keyboardType(.asciiCapable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .onChange(of: username, perform: filter )
    }

    func filter(value: String) {
        let sets = CharacterSet.lowercaseLetters
            .union(CharacterSet.uppercaseLetters)
            .union(CharacterSet.decimalDigits)
        username = String(value
                            .unicodeScalars
                            .filter(sets.contains)
                            .map(Character.init))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
