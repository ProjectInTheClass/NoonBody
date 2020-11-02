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
                        

                            
                            ForEach(viewModel.dietPosts, id: \.id){ post in
                                Text(post.dietDate)
                                    .padding()
                                    .font(.system(size:20, weight:.bold))
                                    .foregroundColor(.white)
                                    .background(Color("primaryOrange"))
                                    .background(Color(myColor))
                                    .cornerRadius(12)
                                    .onTapGesture(count: 1, perform: {
                                        choosedDate = "\(post.dietDate)"
                                    })
                            }

                        

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

