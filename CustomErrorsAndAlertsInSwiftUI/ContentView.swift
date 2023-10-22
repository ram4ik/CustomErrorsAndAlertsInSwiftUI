//
//  ContentView.swift
//  CustomErrorsAndAlertsInSwiftUI
//
//  Created by admin on 10/22/23.
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}

struct ContentView: View {
    @State private var error: Error? = nil
    
    var body: some View {
        Button("Click Me") {
            saveData()
        }
        .alert(error?.localizedDescription ?? "Error", isPresented: Binding(value: $error)) {
            Button("Ok") {
                
            }
        }
    }
    
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            let myError: Error = URLError(.badURL)
            //errorTitle = "An error occured!"
            error = myError
        }
    }
}

#Preview {
    ContentView()
}
