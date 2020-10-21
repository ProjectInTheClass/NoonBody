//
//  NoonBodyCollectionMain.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct DietTab: View {
    
    @State var date = Date()
    @State var show = false
    
    @State var showSheet = false
    
    @State var selectedDateText: String = "Date"
    
    @State var day: Int = 0
    
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        
        let secondaryOrange = UIColor.init(netHex: 0xFFEFEA)
        UINavigationBar.appearance().backgroundColor = secondaryOrange
        }
    
    var body: some View {
        
        NavigationView {
            VStack{
            
//                NavigationLink(destination: DietWrite()) {
//                    HStack {
//                        Image(systemName: "square.and.pencil")
//                            .font(.system(size: 30))
//                        Text("식단 기록하기")
//                            .bold()
//                            .font(.system(size: 30))
//                    }.frame(minWidth: 0, maxWidth: 250)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color("primaryOrange"))
//                    .cornerRadius(40)
//                    .padding(.horizontal, 20)
//                }
                
//                DatePicker("", selection: $date, displayedComponents: .date)
//                    .datePickerStyle(DefaultDatePickerStyle())
//                    .labelsHidden()
//                    .frame(maxHeight: .none)
//                    .padding(.top, 10)
                
                HStack{
                    Button(action: {
                        self.day -= self.day
//                        Text(getDate(num: day))
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer().frame(width: 100)
                    //오늘 날짜
                    Text(getDate(num: day))
                    
                    Spacer().frame(width: 100)
                    
                    Button(action: {
                        self.day += self.day
//                        Text(getDate(num: day))
                    }) {
                        Image(systemName: "chevron.right")
                    }
                    
                    
                }.padding(.top, 20)
                
                
                Form{
                    Section{
                        HStack{
                            VStack(alignment: .leading){
                                Text("아침")
                                    .font(.system(size: 20))
                                    .bold()
                                Text("09:30 AM")
                                    .font(.system(size: 15))
                                    .bold()
                                Text("~ 먹음")
                            }
                            
                            Spacer()
                            
                            Image("food1")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .trailing)
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("점심")
                                    .font(.system(size:20))
                                    .bold()
                                Text("12:30 PM")
                                    .font(.system(size: 15))
                                    .bold()
                                Text("~ 먹음")
                            }
                            
                            Spacer()
                            
                            Image("food2")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .trailing)
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("저녁")
                                    .font(.system(size: 20))
                                    .bold()
                                Text("06:30 PM")
                                    .font(.system(size: 15))
                                    .bold()
                                Text("~ 먹음")
                            }
                            
                            Spacer()
                            
                            Image("food3")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .trailing)
                        }
                    }
                            
                }
                    
            }.background(Color("secondaryOrange"))
            
            
                
//                Button(action: {
//
//                    self.show.toggle()
//
//                }, label: {
//                    VStack{
//                        Text(selectedDateText)
//                        Divider()
//                    }
//                })
//
//                ZStack{
//
//                    VStack{
//                        Spacer()
//
//                        CustomActionSheet().offset(y: self.show ? 0 : UIScreen.main.bounds.height)
//
//                    }
//                    .edgesIgnoringSafeArea(.bottom)
//                }
//
//            }.background((self.show ? Color.black.opacity(0.3) : Color.clear).edgesIgnoringSafeArea(.all).onTapGesture{
//
//                self.show.toggle()
//
//            })
            .navigationTitle("식단")
            .navigationBarItems(trailing: WriteButton())
            
        }
    }
}

//struct CustomActionSheet: View {
//    @State var date = Date()
//    @State var selectedDateText: String = "Date"
//
//    var selectedDate: Binding<Date> {
//        Binding<Date>(get: { self.date}, set : {
//            self.date = $0
//            self.setDateString()
//        })
//      } // This private var I found… somewhere. I wish I could remember where
//
//      // To take the selected date and store it as a string for the text field
//    func setDateString() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM dd, yyyy"
//
//        self.selectedDateText = formatter.string(from: self.date)
//      }
//
//    var body: some View{
//
//        VStack(spacing: 15){
//
//            DatePicker("", selection: selectedDate, displayedComponents: .date)
//                .datePickerStyle(GraphicalDatePickerStyle())
//                .labelsHidden()
//                .frame(maxHeight: .none)
//
//        }.background(Color.white)
//        .padding(.horizontal)
//        .padding(.top, 20)
//        .cornerRadius(25)
//        .edgesIgnoringSafeArea(.bottom)
//
//
//
//    }
//}

struct DietTab_Previews: PreviewProvider {
    static var previews: some View {
        DietTab()
    }
}

fileprivate struct WriteButton: View{
    
    var body: some View{
        
        NavigationLink(destination: DietWrite()) {
            HStack {
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 20))
                Text("기록하기")
                    .bold()
                    .font(.system(size: 20))
            }.frame(minWidth: 0, maxWidth: 250)
            .padding()
            .foregroundColor(Color("primaryOrange"))
//            .background(Color("primaryOrange"))
            .cornerRadius(40)
        }
    
    }
}

