//
//  DietWrite.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI
import SwiftUIX
import SPAlert

struct DietWrite: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var showSheet:Bool = false
    @State private var showImagePicker:Bool = false
    @State private var sourceType:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
//    @State private var showChooseIndex = 0
//    var showChoose = ["공개", "비공개"]
    
    @State var isFull = true
    @State var isShow = true
    
    @State var isFullString = ""
    @State var isShowString = ""
    
    @State private var timeIndex = 0
    var time = ["아침", "점심", "저녁", "간식"]
    
    @State var textField_placeholder = "소감 한마디! (선택)"
    @State var textField1_val = ""
    
    @State private var content: String = ""
    
    @State private var showGreeting = true

    
    var body: some View {
      
            
        ScrollView {
            VStack{
                    Spacer()
                    
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
                    

                    
                VStack {
                    Divider()
                    Toggle(isOn: $isShow) {
                        Text("공개여부")
                    }
                    Divider()
                    
                    Picker(selection: $timeIndex, label: Text("What is your favorite color?")) {
                        ForEach(0..<time.count) { index in
                            Text(self.time[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Divider()

//                    Text("Value: \(time[timeIndex])")
                    
                }.padding()
                    
                TextField("\(self.textField_placeholder)", text: self.$textField1_val)
                    .padding(10)
                    .background(
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                    )
                    .padding(20)

//                    TextView("소감 한마디! (선택)", text: $content)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        //context 속성은 published 특성으로 선언했으므로
//                        //속성에 저장된 값이 업데이트되면 padding도 함께 업데이트 됨
//                        .padding(.keyboard)
//                        .animation(.easeInOut(duration: 0.3))
//                        .onTapGesture {
//                                    self.endEditing(true)
//
//                                 }
                    
                    
                    
                    
                    
                }
    //            .onTapGesture {
    //
    //                  self.endTextEditing()
    //            }
                
                .navigationBarTitle("식단 기록하기", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    DietSubmitFirebase()
                    
                }, label: {
                    Text("저장")
                }))
                
            .sheet(isPresented: $showImagePicker, content: {
                VStack{
                    Text("음식 사진을 선택해주세요.")
                        .font(.title)
                        .foregroundColor(Color("primaryOrange"))
                        .padding()
                    
                    ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                }
                
        })
        }.background(Color("secondaryOrange"))
    }
    
    func DietSubmitFirebase(){
        let actionsToComplete = 1
        var actionsCompleted = 0
        
        
        func check_success(){
            print("\(actionsCompleted)/\(actionsToComplete)")
            if actionsCompleted == actionsToComplete {
                //Add a function to clear all the data on this page
                let alertView = SPAlertView(title: "식단 작성 완료", message: "식단이 성공적으로 작성되었습니다!", preset: SPAlertPreset.done)
                alertView.duration = 3
                alertView.present()
                self.presentationMode.wrappedValue.dismiss()
                
            }
        }
        
//        func isFullShowCheck(){
//            if isShow{
//                isShowString = "공개"
//            }else{
//                isShowString = "비공개"
//            }
//
//        }
        
        if let thisImage = self.image {
//            isFullShowCheck()
            let thisDietPost = DietPostSubmit(dietDate: getDate(num: 0),
                                              dietWhen: time[timeIndex],
                                              dietTime: time[timeIndex],
                                              dietText: textField1_val,
                                              dietImage: Image(uiImage: thisImage)
                                             
            )
            
            print(thisDietPost.dictionary)
            
            self.env.currentUser.publishedDiets.append(thisDietPost.id.uuidString)
            
            
            FirebaseDietDataSubmit(storageRef_string: "DietWriteImages/\(thisDietPost.id)", docRef_string: "DietWrite/\(thisDietPost.id)", diaryDate: getDate(num: 0), dietWhen: time[timeIndex], dietTime: time[timeIndex], dietText: textField1_val, image: thisImage, completion: {_ in
                
                actionsCompleted += 1
                check_success()
            })
            
            firestoreUpdate_data(docRef_string: "users/\(self.env.currentUser.establishedID)", dataToUpdate: ["publishedDiets": self.env.currentUser.publishedDiets], completion: {_ in
                actionsCompleted += 1
                check_success()
            })
            
            
        } else {
            let alertView = SPAlertView(title: "사진을 추가하세요", message: "식단을 입력하기 위해서는 사진이 필요합니다.", preset: SPAlertPreset.error)
            alertView.duration = 3
            alertView.present()
        }
    }
}



struct DietWrite_Previews: PreviewProvider {
    static var previews: some View {
        DietWrite()
    }
}

extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
        to: nil, from: nil, for: nil)
  }
}

