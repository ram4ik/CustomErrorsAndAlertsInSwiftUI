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
    
    enum MyCustomError: Error, LocalizedError {
        case noInternetConnection
        case dataNotFount
        case urlError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your internet connection and try again."
            case .dataNotFount:
                return "There was an error loading data. Please try again!"
            case .urlError(error: let error):
                return "Erorr: \(error.localizedDescription)"
            }
        }
    }
    
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            //let myError: Error = URLError(.badURL)
            //errorTitle = "An error occured!"
            let myError: Error = MyCustomError.noInternetConnection
            error = myError
        }
    }
}

#Preview {
    ContentView()
}
