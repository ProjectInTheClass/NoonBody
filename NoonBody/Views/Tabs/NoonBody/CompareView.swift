//
//  CompareView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompareView: View {
    
    @State private var isShareSheetShowing = false
    
    @EnvironmentObject var choosedContent1: ChoosedContent1
    @EnvironmentObject var choosedContent2: ChoosedContent2
    
    var body: some View {

        NavigationView{
            
            VStack{
                
                Spacer().frame(height: 100)
                
                HStack{
                        VStack{
                            Text("\(choosedContent1.date1)")
                                
                            AnimatedImage(url: URL(string: choosedContent1.image1))
                                .resizable()
                                .frame(width: 200, height: 300, alignment: .trailing)
                        }
                        VStack{
                            Text("\(choosedContent2.date2)")
                                
                            AnimatedImage(url: URL(string: choosedContent2.image2))
                                .resizable()
                                .frame(width: 200, height: 300, alignment: .trailing)
                        }
                }
                
                Spacer().frame(height: 20)
//                Divider()
                
                VStack(alignment: .leading){
                    HStack{
                        Spacer().frame(width: 60)
                        Text("\(choosedContent1.weight1, specifier: "%.2f")kg")
                        Spacer()
                        Text("몸무게")
                            .foregroundColor(Color("primaryOrange"))
                        Spacer()
                        Text("\(choosedContent2.weight2, specifier: "%.2f")kg")
                        Spacer().frame(width: 60)
    //                        TextField("0.00kg", text: $weight)
    //                            .frame(width: 70)
                    }
                    Divider()
                    HStack{
                        Spacer().frame(width: 60)
                        Text("\(choosedContent1.muscle1, specifier: "%.2f")kg")
                        Spacer()
                        Text("골격근량")
                            .foregroundColor(Color("primaryOrange"))
                        Spacer()
                        Text("\(choosedContent2.muscle2, specifier: "%.2f")kg")
                        Spacer().frame(width: 60)
    //                        TextField("0.00kg", text: $muscle)
    //                            .frame(width: 70)
                    }
                    
                    Divider()
                    
                    HStack{
                        Spacer().frame(width: 60)
                        Text("\(choosedContent1.fat1, specifier: "%.2f")kg")
                        Spacer()
                        Text("체지방량")
                            .foregroundColor(Color("primaryOrange"))
                        Spacer()
                        Text("\(choosedContent2.fat2, specifier: "%.2f")kg")
                        Spacer().frame(width: 60)
    //                        TextField("0.00kg", text: $fat)
    //                            .frame(width: 70)
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                
                
                Spacer().frame(height: 150)
                
                
                Button(action: {
//                    self.isChoosed = true
                }, label: {
                    HStack {
                        Text("스크린샷 저장하기")
                        
                    }.frame(height: 50)
                    .frame(minWidth:0, maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    
                })
                .background(Color("primaryOrange"))
                .cornerRadius(25)
                .padding()
                
                            
            } // ultimate V Stack Ends
            
            
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color("secondaryOrange"))
            .navigationBarTitle("비교하기", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: shareButton) {
                                        Image(systemName: "square.and.arrow.up")
                                            .font(.largeTitle)
                                            .foregroundColor(Color("primaryOrange"))
                                    }
            )
            
            
        } // Nav View Ends
    } //some View ENds
    
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let url = URL(string:"https://apple.com")
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?
            .present(activityView, animated: true, completion: nil)
        
    }
}


struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
