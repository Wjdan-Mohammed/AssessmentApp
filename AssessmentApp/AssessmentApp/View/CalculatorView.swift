//
//  CalculatorView.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import SwiftUI

struct CalculatorView: View {

    @StateObject private var viewModel = CalculatorViewModel()

    var body: some View {
        VStack(spacing: 16){
            
            HStack (spacing: 14){
                TextField("Dividend", text: $viewModel.dividend)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .keyboardType(.decimalPad)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                .frame(maxWidth: .infinity, maxHeight: 40)
                TextField("Divisor", text: $viewModel.divisor)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .keyboardType(.decimalPad)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            
            Button(action: {
                viewModel.divideNumbers()
            }) {
                Text("Devide").bold()
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(6)
            
            Text("Result: \(viewModel.result)")
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(6)
            

        }.padding()
    }
}

#Preview {
    CalculatorView()
}
