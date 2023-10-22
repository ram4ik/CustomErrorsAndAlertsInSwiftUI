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
    @State private var errorTitle: String? = nil
    
    var body: some View {
        Button("Click Me") {
            saveData()
        }
        .alert(errorTitle ?? "Error", isPresented: Binding(value: $errorTitle)) {
            Button("Ok") {
                
            }
        }
    }
    
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            errorTitle = "An error occured!"
        }
    }
}

#Preview {
    ContentView()
}
