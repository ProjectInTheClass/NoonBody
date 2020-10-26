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
    
    @EnvironmentObject var env: GlobalEnvironment
    
    @State private var showSheet:Bool = false
    @State private var showImagePicker:Bool = false
    @State private var sourceType:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    @State private var showChooseIndex = 0
    var showChoose = ["공개", "비공개"]
    
    @State private var showChooseIsFullIndex = 0
    var showChooseIsFull = ["공복", "식후"]
    
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
    //                    Toggle(isOn: $showGreeting) {
    //                                    Text("공개")
    //                                }.padding()
    //
    //                                if showGreeting {
    ////                                    Text("공개")
    //                                }
                        Picker(selection: $showChooseIndex, label: Text("What is your favorite color?")) {
                            ForEach(0..<showChoose.count) { index in
                                Text(self.showChoose[index]).tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.top)

    //                    Text("Value: \(showChoose[showChooseIndex])")
                    }
                    
                    VStack {
    //                    Toggle(isOn: $showGreeting) {
    //                                    Text("공개")
    //                                }.padding()
    //
    //                                if showGreeting {
    ////                                    Text("공개")
    //                                }
                        Picker(selection: $showChooseIsFullIndex, label: Text("What is your favorite color?")) {
                            ForEach(0..<showChooseIsFull.count) { index in
                                Text(self.showChooseIsFull[index]).tag(index)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        .padding(.leading)
                        .padding(.trailing)

    //                    Text("Value: \(showChoose[showChooseIndex])")
                    }
                    
                    Divider().padding(.top)
                    
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
                    
                    var actionsToComplete = 3
                    var actionsCompleted = 0
                    
                    func check_success(){
                        print("\(actionsCompleted)/\(actionsToComplete)")
                        if actionsCompleted == actionsToComplete {
                            //Add a function to clear all the data on this page
                            let alertView = SPAlertView(title: "NoonBody Submitted", message: "NoonBody submitted successfully!", preset: SPAlertPreset.done)
                            alertView.duration = 3
                            alertView.present()
                        }
                    }
                    
                    if let thisImage = self.image {
                        let thisNoonBodyPost = DiaryPost(diaryDate: getDate(num: 0),
                                                         diaryFull: "공복",
                                                         diaryShare: "공유",
                                                         diaryWeight: 55.5,
                                                         diaryMuscle: 25.3,
                                                         diaryFat: 21.6,
                                                         diaryImage: Image(uiImage: thisImage)
                        
                            
                        )
                        
                        print(thisNoonBodyPost.dictionary)
                        
                        self.env.currentUser.publishedNoonBodys.append(thisNoonBodyPost.id.uuidString)
                        
                        firestoreSubmit_data(docRef_string: "noonbodywrite/\(thisNoonBodyPost.id)", dataToSave: thisNoonBodyPost.dictionary, completion: {_ in
                            actionsCompleted += 1
                            check_success()
                        })
                        
                        firestoreUpdate_data(docRef_string: "users/\(self.env.currentUser.establishedID)", dataToUpdate: ["publishedNoonBodys": self.env.currentUser.publishedNoonBodys], completion: {_ in
                            actionsCompleted += 1
                            check_success()
                        })
                        
                        uploadImage("noonbodywrite_\(thisNoonBodyPost.id)_0", image: thisImage, completion: {_ in
                            actionsCompleted += 1
                            check_success()
                        })
                    } else {
                        let alertView = SPAlertView(title: "Add a photo", message: "You cannot submit a recipe without a photo", preset: SPAlertPreset.error)
                        alertView.duration = 3
                        alertView.present()
                    }
                    
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
