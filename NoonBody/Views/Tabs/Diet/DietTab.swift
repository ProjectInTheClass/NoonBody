//
//  NoonBodyCollectionMain.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct DietTab: View {
    
//    @State var DietLists: [DietPost] = [
//        DietPost(dietWhen: "아침", dietTime: "9시 30분", dietText: "아침 맛있었당", dietImage: Image("food1"), dietDate: "2020. 10. 24"),
//        DietPost(dietWhen: "점심", dietTime: "12시 30분", dietText: "점심은 배부르게~", dietImage: Image("food2"), dietDate: "2020. 10. 24"),
//        DietPost(dietWhen: "저녁", dietTime: "6시 30분", dietText: "저녁에 이렇게 많이 먹으면 안되는데...ㅠ", dietImage: Image("food3"), dietDate: "2020. 10. 24"),
//        DietPost(dietWhen: "아침", dietTime: "10시 10분", dietText: "아침을 늦게 먹었어...", dietImage: Image("food4"), dietDate: "2020. 10. 23"),
//        DietPost(dietWhen: "점심", dietTime: "13시 00분", dietText: "아침을 늦게 먹었더니 점심에 너무 배부르다", dietImage: Image("food5"), dietDate: "2020. 10. 23"),
//        DietPost(dietWhen: "저녁", dietTime: "8시 30분", dietText: "저녁에 치킨 먹어버렸어....ㅠㅠ", dietImage: Image("치킨"), dietDate: "2020. 10. 23"),
//        DietPost(dietWhen: "아침", dietTime: "8시 30분", dietText: "아침부터 많이 먹었네", dietImage: Image("food7"), dietDate: "2020. 10. 22"),
//        DietPost(dietWhen: "저녁", dietTime: "4시 00분", dietText: "점심 겸 저녁이 되어버린 식사", dietImage: Image("food8"), dietDate: "2020. 10. 22")
//    ]
    
    @State var date = Date()
    @State var show = false
    
    @State var showSheet = false
    
    @State var selectedDateText: String = "Date"
    
    @State var day: Int = 0
    
    @State var choosedDate: String = "2020. 10. 24"
    
    @State var dateString: String = ""
    
    @State var myColor: String = "secondaryOrange"
    @State var isChoosed: Bool = false

    @ObservedObject var viewModel = DietViewModel()
    

    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        
        let secondaryOrange = UIColor.init(netHex: 0xFFEFEA)
        UINavigationBar.appearance().backgroundColor = secondaryOrange
        
        self.viewModel.fetchData()
        
        }
    
    var body: some View {
        
        NavigationView {
            VStack{
                ScrollView(.horizontal, showsIndicators:false){
                    ScrollViewReader { value in
                        HStack(alignment: .center){
                        Spacer().frame(width:10)
                        
                        Text("2020. 10. 29")
                            .padding()
                            .font(.system(size:20, weight:.bold))
                            .foregroundColor(.white)
                            .background(Color("primaryOrange"))
                            .background(Color(myColor))
                            .cornerRadius(12)
                            
                            
                            .onTapGesture(count: 1, perform: {
                                choosedDate = "2020. 10. 29"

//                                self.isChoosed.toggle()
//
//                                if isChoosed{
//                                    self.myColor = "primaryOrange"
//                                }else{
//                                    self.myColor = "secondaryOrange"
//                                }
                            })
                        Text("2020. 10. 30")
                            .padding()
                            .font(.system(size:20, weight:.bold))
                            .foregroundColor(.white)
                            .background(Color("primaryOrange"))
                            .background(Color(myColor))
                            .cornerRadius(12)
                            .onTapGesture(count: 1, perform: {
                                choosedDate = "2020. 10. 30"

//                                self.isChoosed.toggle()
//
//                                if isChoosed{
//                                    self.myColor = "primaryOrange"
//                                }else{
//                                    self.myColor = "secondaryOrange"
//                                }
                            })
                        Text("2020. 10. 31")
                            .padding()
                            .font(.system(size:20, weight:.bold))
                            .foregroundColor(.white)
                            .background(Color("primaryOrange"))
                            .background(Color(myColor))
                            .cornerRadius(12)
                            .onTapGesture(count: 1, perform: {
                                choosedDate = "2020. 10. 31"

//                                self.isChoosed.toggle()
//
//                                if isChoosed{
//                                    self.myColor = "primaryOrange"
//                                }else{
//                                    self.myColor = "secondaryOrange"
//                                }
                            })
                        
//                        ForEach(DietLists, id: \.id){ post in
//
//                            dateString = "\(post.dietDate)"
//                            if post.dietDate != dateString{
//                                Text("\(post.dietDate)")
//                                    .onTapGesture(count: 1, perform: {
//                                        choosedDate = "\(post.dietDate)"
//                                    })
//                            }
//
//                            }
//
//                        ForEach(0..<DietLists.count){_ in
//                            dateString = "\(DietLists[0].dietDate)"
//
//                        }
                        
//
                        Spacer().frame(width:10)
                    }.frame(height: 80)
                        .onAppear {
                            value.scrollTo(3, anchor: .trailing)
                        }
                    }
                    
                }.background(Color.clear)
                .padding(.leading)
                .padding(.trailing)
                
                VStack{
                        List {
                            ForEach(viewModel.dietPosts, id: \.id){ post in
                                if post.dietDate == choosedDate{
                                    DietPostView(passed_dietWhen: post.dietWhen,
                                                 passed_dietTime: post.dietTime,
                                                 passed_dietText: post.dietText,
                                                 passed_dietImage: post.dietImage)
                                        .listRowBackground(Color("secondaryOrange"))
                                }
                                
                            }.onDelete(perform: delete)
                            
                            
                        }.background(Color.clear)
                    
                }
                
                    
            }.background(Color("secondaryOrange"))
            
            
                

            .navigationTitle("식단")
            .navigationBarItems(trailing: WriteButton())
            
        }.navigationBarTitle("").navigationBarHidden(true)
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
//            DietLists.remove(at: first)
        }
    }
    

}


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

