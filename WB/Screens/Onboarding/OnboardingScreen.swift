//
//  OnboardingScreen.swift
//  WB
//
//  Created by Дрозд Денис on 17.06.2024.
//

import SwiftUI

struct OnboardingScreen: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Image("onboarding")
                .padding(.top, 135)
            Text("Общайтесь с друзьями \nи близкими легко")
                .font(.system(size: 24, weight: .bold))
                .padding(40)
                .multilineTextAlignment(.center)
            Spacer()
            Text("Нажимая кнопку продолжить, я соглашаюсь с \n Политикой Конфиденциальности и Условиями Использования")
                .font(.system(size: 10, weight: .regular))
                .multilineTextAlignment(.center)
                .padding(20)
            Button {
                isPresented.toggle()
            } label: {
                Text("Начать общаться")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 54)
                    .background(.purpleCustom)
                    .cornerRadius(30)
            }
            .sheet(isPresented: $isPresented, content: {
                VerificationView()
            })
        }
        .padding()
    }
}

#Preview {
    OnboardingScreen()
}
