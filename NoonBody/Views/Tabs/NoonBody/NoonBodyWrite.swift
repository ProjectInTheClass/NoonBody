//
//  NoonBodyWrite.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import SwiftUIX
import SPAlert

struct NoonBodyWrite: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var showSheet:Bool = false
    @State private var showImagePicker:Bool = false
    @State private var sourceType:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
//    @State private var showChooseIndex = 0
//    var showChoose = ["공개", "비공개"]
//
//    @State private var showChooseIsFullIndex = 0
//    var showChooseIsFull = ["공복", "식후"]
    @State var isFull = true
    @State var isShow = true
    
    @State var isFullString = ""
    @State var isShowString = ""
    
    @State private var content: String = ""
    
    @State private var showGreeting = true

    @State var weight: String = ""
    @State var muscle : String = ""
    @State var fat: String = ""

    
    var body: some View {
      
            
        ScrollView {
            VStack{
                    Spacer().frame(height:20)
                    
                    ZStack{
                        Image(uiImage: image ?? UIImage(imageLiteralResourceName: "gray_background"))
                            .resizable()
                            .frame(width: 300, height: 250)
                            .cornerRadius(30)
                        
                        
                        Button(action: {
                            self.showSheet = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.gray)
                        }.padding()
                        .actionSheet(isPresented: $showSheet, content: {
                            ActionSheet(title: Text("Select Photo"),
                                        message: Text("Choose"), buttons: [
                                            .default(Text("Photo Library")){
                                                self.showImagePicker = true
                                                self.sourceType = .photoLibrary
                                            },
                                            .default(Text("Camera")){
                                                self.showImagePicker = true
                                                self.sourceType = .camera
                                            },
                                            .cancel()
                                        ])
                        })
                    }
                    
    //                Divider()
    //                    .padding(.top, 10)
                    
                    VStack {
                        Divider()
                        Toggle(isOn: $isFull) {
                            Text("공복여부")
                        }
                        Divider()
                        Toggle(isOn: $isShow) {
                            Text("공개여부")
                        }
                        Divider()
                    }.padding()
                    
                   
                    
                    Divider().padding(.top, 3)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("몸무게")
                            Spacer()
                            TextField("0.00kg", text: $weight)
                                .frame(width: 70)
                        }
                        
                        Divider()
                        
                        HStack{
                            Text("골격근량")
                            Spacer()
                            TextField("0.00kg", text: $muscle)
                                .frame(width: 70)
                        }
                        
                        Divider()
                        
                        HStack{
                            Text("체지방량")
                            Spacer()
                            TextField("0.00kg", text: $fat)
                                .frame(width: 70)
                        }
                        
                    }.padding(.leading)
                    .padding(.trailing)
                    
                    Divider()
                    
                    TextView("소감 한마디! (선택)", text: $content)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        //context 속성은 published 특성으로 선언했으므로
                        //속성에 저장된 값이 업데이트되면 padding도 함께 업데이트 됨
                        .padding(.keyboard)
                        .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                        .animation(.easeInOut(duration: 0.3))
                        .onTapGesture {
                                    self.endEditing(true)
                            
                                    
                                 }
    //                    .onTapGesture {
    //                                hideKeyboard()
    //                            }
                   
                    
                }
    //            .onTapGesture {
    //
    //                  self.endTextEditing()
    //            }
                
                .navigationBarTitle("눈바디 기록하기", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    noonbodySubmitFirebase()
                    
                }, label: {
                    Text("저장")
                }))
                
            .sheet(isPresented: $showImagePicker, content: {
                VStack{
                    Text("눈바디 사진을 선택해주세요.")
                        .font(.title)
                        .foregroundColor(Color("primaryOrange"))
                        .padding()
                    
                    ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                }
                
        })
        }.background(Color("secondaryOrange"))
    }
    
    func noonbodySubmitFirebase(){
        let actionsToComplete = 1
        var actionsCompleted = 0
        
        
        func check_success(){
            print("\(actionsCompleted)/\(actionsToComplete)")
            if actionsCompleted == actionsToComplete {
                //Add a function to clear all the data on this page
                let alertView = SPAlertView(title: "눈바디 작성 완료", message: "눈바디가 성공적으로 작성되었습니다!", preset: SPAlertPreset.done)
                alertView.duration = 3
                alertView.present()
                self.presentationMode.wrappedValue.dismiss()
                
            }
        }
        
        func isFullShowCheck(){
            if isFull{
                isFullString = "공복"
            }else{
                isFullString = "식후"
            }
            if isShow{
                isShowString = "공개"
            }else{
                isShowString = "비공개"
            }
            
        }
        
        if let thisImage = self.image {
            isFullShowCheck()
            let thisNoonBodyPost = DiaryPostSubmit(diaryDate: getDate(num: 0),
                                                 diaryFull: isFullString,
                                                 diaryShare: isShowString,
                                                 diaryWeight: Double(weight) ?? 0,
                                                 diaryMuscle: Double(muscle) ?? 0,
                                                 diaryFat: Double(fat) ?? 0,
                                                 diaryImage: Image(uiImage: thisImage)
                                             
            )
            
            print(thisNoonBodyPost.dictionary)
            
            self.env.currentUser.publishedNoonBodys.append(thisNoonBodyPost.id.uuidString)
            
            FirebaseDataSubmit(storageRef_string: "NoonbodyWriteImages/\(thisNoonBodyPost.id)", docRef_string: "NoonbodyWrite/\(thisNoonBodyPost.id)", dataToSave: thisNoonBodyPost.dictionary, image: thisImage, completion: {_ in
                
                actionsCompleted += 1
                check_success()
            })
            
            
            firestoreUpdate_data(docRef_string: "users/\(self.env.currentUser.establishedID)", dataToUpdate: ["publishedNoonBodys": self.env.currentUser.publishedNoonBodys], completion: {_ in
                actionsCompleted += 1
                check_success()
            })
            
            
        } else {
            let alertView = SPAlertView(title: "사진을 추가하세요", message: "눈바디를 입력하기 위해서는 사진이 필요합니다.", preset: SPAlertPreset.error)
            alertView.duration = 3
            alertView.present()
        }
    }
}


struct NoonBodyWrite_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyWrite()
    }
}

//#if canImport(UIKit)
//extension View {
//    func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//#endif

extension View {
        func endEditing(_ force: Bool) {
            UIApplication.shared.windows.forEach { $0.endEditing(force)}
        }
}
