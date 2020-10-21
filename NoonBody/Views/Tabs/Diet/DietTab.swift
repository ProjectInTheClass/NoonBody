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
                
                showDiets()
                
                    
            }.background(Color("secondaryOrange"))
            
            
                

            .navigationTitle("식단")
            .navigationBarItems(trailing: WriteButton())
            
        }
    }
}

struct showDiets: View {
    
    @State var DietLists: [dietPost] = [
        dietPost(dietWhen: "아침", dietTime: "9시 30분", dietText: "아침 먹음", dietImage: Image("food1")),
        dietPost(dietWhen: "점심", dietTime: "12시 30분", dietText: "점심 먹음", dietImage: Image("food2")),
        dietPost(dietWhen: "저녁", dietTime: "6시 30분", dietText: "저녁 먹음", dietImage: Image("food3"))
    ]
    
    var body: some View{
        VStack{
                List {
                    ForEach(DietLists, id: \.id){ post in
                        DietPostView(passed_dietWhen: post.dietWhen, passed_dietTime: post.dietTime, passed_dietText: post.dietText, passed_dietImage: post.dietImage)
                            .listRowBackground(Color("secondaryOrange"))
                    }.onDelete(perform: delete)
                    
                    
                }.background(Color.clear)
            
        }
    }

    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            DietLists.remove(at: first)
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

