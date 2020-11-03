//
//  SettingsAbout.swift
//  NoonBody
//
//  Created by Jen on 2020-10-11.
//

import SwiftUI

struct SettingsAbout: View {
    
    @State private var nickname=""
    @State private var id=""
    @State private var resolution=""
    
    private let oldPasswordToConfirmAgainst = "12345"
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    private func isUserInformationValid() -> Bool {
        if nickname.isEmpty {
            return false
        }
        
        if id.isEmpty {
            return false
        }
        
        if resolution.isEmpty {
            return false
        }
        
        return true
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("나의 정보 수정하기")) {
                    // Form fields go here
                    TextField("닉네임", text: $nickname)
                    TextField("ID", text: $id)
                    TextField("나의 한마디!", text: $resolution)
                    
                    if self.isUserInformationValid() {
                        Button(action: {
                            print("Updated profile")
                        }, label: {
                            Text("나의 정보 업데이트 하기")
                        })
                    }
                    
                    
                }
                
                Section(header: Text("비밀번호 변경하기")) {
                    SecureField("현재 비밀번호를 입력하세요", text: $oldPassword)
                    SecureField("새로운 비밀번호를 입력하세요", text: $newPassword)
                    SecureField("새로운 비밀번호를 다시 한번 더 입력하세요", text: $confirmPassword)
                    
                }
            }.navigationBarTitle("나의 프로필", displayMode: .inline)
        }
    }
}

struct SettingsAbout_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAbout()
    }
}
