//
//  MainTabView.swift
//  AssessmentApp
//
//  Created by WjdanMo on 20/09/2024.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            UsersView()
                .tabItem { Image(systemName: "person.3.sequence.fill")
                    Text("Users") }
            CalculatorView()
                .tabItem { Image(systemName: "divide.circle.fill")
                    Text("Calculator") }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    MainTabView()
}
