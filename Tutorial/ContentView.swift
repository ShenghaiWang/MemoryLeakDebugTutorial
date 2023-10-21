//
//  ContentView.swift
//  Tutorial
//
//  Created by Tim Wang on 21/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                viewModel.cleanup()
            }, label: {
                Text("Clean up")
            })

            Button(action: {
                viewModel.renewAndSetupCircularReference()
            }, label: {
                Text("Renew and Setup Circular Reference")
            })

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
