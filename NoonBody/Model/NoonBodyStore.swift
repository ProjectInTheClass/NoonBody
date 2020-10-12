//
//  NoonBodyStore.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import Foundation

class NoonBodyStore: ObservableObject{
    @Published var list: [NoonBody]   //배열을 Published 특성으로 선언하면 배열을 업데이트 할 때마다 바인딩 되어있는 뷰도 함께 업데이트 됨
    
    //생성자를 만들고 더미데이터를 추가
    init() {
        list = [
            NoonBody(content: "Lorem Ipsum 1"),
            NoonBody(content: "Lorem Ipsum 2"),
            NoonBody(content: "Lorem Ipsum 3")
        ]
    }
    
    //기본적인 CRUD 코드를 구현
    //입력한 메모를 파라미터로 받은 다음 리스트 배열에 저장
    func insert(noonbody: String){
        list.insert(NoonBody(content: noonbody), at: 0)  //새로운 메모는 0번째 인덱스에 추가. 그러면 새로운 메모가 가장 위에 표시됨
    }
    
    //Update method
    func update(noonbody: NoonBody?, content: String){   //파라미터로 메모와 편집된 내용을 받은 다음
        //body에서 content 속성에 그대로 저장
        guard let noonbody = noonbody else { return }
        noonbody.content = content
    }
    
    //delete method는 memo instance를 받는 버전과 index set을 받는 버전을 각각 구현
    func delete(noonbody: NoonBody){               //memo instance가 전달되면
        self.list.removeAll{ $0 == noonbody}   //배열에서 바로 삭제
    }
    
    func delete(set: IndexSet) {    //indexSet이 전달되면
        //for in 문으로 반복하면서 배열에서 삭제
        for index in set{
            self.list.remove(at: index)
        }
    }
}
