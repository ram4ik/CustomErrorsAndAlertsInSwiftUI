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
    @State private var alert: MyCustomAlert? = nil
    
    var body: some View {
        Button("Click Me") {
            saveData()
        }
        .alert(alert?.title ?? "Error", isPresented: Binding(value: $alert), actions: {
            if let alert {
                getButtonsForAlert(alert: alert)
            }
        }, message: {
            if let subtitle = alert?.subtitle {
                Text(subtitle)
            }
        })
    }
    
    @ViewBuilder
    private func getButtonsForAlert(alert: MyCustomAlert) -> some View {
        switch alert {
        case .noInternetConnection:
            Button("Ok") {
                
            }
            Button("Retry") {
                
            }
        case .dataNotFount:
            Button("Ok") {
                
            }
            Button("Retry") {
                
            }
            Button("Delete", role: .destructive) {
                
            }
        case .urlError(let error):
            Button("Ok") {
                
            }
        }
    }
    
//    enum MyCustomError: Error, LocalizedError {
//        case noInternetConnection
//        case dataNotFount
//        case urlError(error: Error)
//        
//        var errorDescription: String? {
//            switch self {
//            case .noInternetConnection:
//                return "Please check your internet connection and try again."
//            case .dataNotFount:
//                return "There was an error loading data. Please try again!"
//            case .urlError(error: let error):
//                return "Erorr: \(error.localizedDescription)"
//            }
//        }
//    }
    
    enum MyCustomAlert: Error, LocalizedError {
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
        
        var title: String {
            switch self {
            case .noInternetConnection:
                return "No Internet Connection"
            case .dataNotFount:
                return "No Data"
            case .urlError:
                return "Error"
            }
        }
        
        var subtitle: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your internet connection and try again."
            case .dataNotFount:
                return nil
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
            //let myError: Error = MyCustomAlert.noInternetConnection
            alert = .noInternetConnection
        }
    }
}

#Preview {
    ContentView()
}
