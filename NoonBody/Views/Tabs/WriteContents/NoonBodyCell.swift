//
//  NoonBodyCell.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/14.
//

import SwiftUI

struct NoonBodyCell: View {
    //필요한 데이터를 생성자로 전달해야 함
    //생성자로 전달받은 memo를 저장
    //ObservedObject -> 메모 데이터가 업데이트 되는 시점마다 view가 새롭게 그려짐. 항상 최신 데이터를 표시
    @ObservedObject var noonBody:NoonBody
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {  //VStack에 포함된 모든 view가 왼쪽에 정렬됨
            
            Image(uiImage: noonBody.image)
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(noonBody.content) //일단 텍스트로 메모 내용을 출력
                .font(.body)
                .lineLimit(1)  //메모 내용을 한줄로만 표시하고 내용이 길다면 뒷부분을 생략
            
            Text(noonBody.isPrivate) //일단 텍스트로 메모 내용을 출력
                .font(.body)
                .lineLimit(1)  //메모 내용을 한줄로만 표시하고 내용이 길다면 뒷부분을 생략
            
            //메모 작성 일자 추가
            Text("\(noonBody.insertDate, formatter: self.formatter)")  //string interpolation 구문으로 바꾼 다음 formatter 파라미터로 formatter 속성을 전달
                .font(.caption)
                .foregroundColor(Color(UIColor.secondaryLabel))  //내용과 날짜를 구분
            
        }
    }
}

struct NoonBodyCell_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyCell(noonBody: NoonBody(image: UIImage(imageLiteralResourceName: "body1"), isPrivate: "비공개", content: "Lorem Ipsum 1"))
                        //Formatter가 정상적으로 초기화 되도록 DateFormatter를 등록
                            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
