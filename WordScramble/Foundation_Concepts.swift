//
//  Foundation_Concepts.swift
//  WordScramble
//
//  Created by Liam Cashel on 1/30/24.
//

import SwiftUI

struct Foundation_Concepts: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    
    var body: some View {
        //examples of different ways to play with lists
//        List {
//            Section("Section 1") {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section("Section 2") {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section("Section 3") {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//        }
//        .listStyle(.grouped)
//
//        List(0..<5) {
//            Text("Dynamic row \($0)")
//        }
        
        List(people, id: \.self) {
                    Text($0)
                }
        
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }

            Text("Static Row")
        }
    }
    
    func testStrings() {
        //seperating inputs by a dilineator
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        //swift doesn't know if randomElement will be used on an empty array. So it returns optional
        let letter = letters.randomElement()
        
        //removes all white space from a string
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let input2 = """
                a
                b
                c
                """
        let letters2 = input2.components(separatedBy: "\n")
    }
    
    func spellCheck() {
        let word = "swift"
        let checker = UITextChecker()
        
        //need to do below cus swift and UIkit have dif ways of handling strings -> thats what the utf16 is fore
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //objective C has no concept of optionals so instead it will return "NSNotFound"
        let allGood = misspelledRange.location == NSNotFound
        
    }
    
    func testBundles() {
        //try to find somefile.txt in our bundle
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            //once we have the URL from the above logic we can pull the contents of the file if it can be loaded
            if let fileContents = try? String(contentsOf: fileURL){
                //once we get here we can do whatever we want with the content
            }
        }
        
        
    }
}

#Preview {
    Foundation_Concepts()
}
