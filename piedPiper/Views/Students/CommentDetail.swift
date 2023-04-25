//
//  CommentDetail.swift
//  piedPiper
//
//  Created by Eduardo Dias de Oliveira Teles on 18/04/23.
//

import Foundation
import SwiftUI

struct StudentDetail: View {
    var student: Student
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Atraso")
                    .font(.title)
                
                HStack {
                    Text("Kiev Gama")
                    Spacer()
                    Text("13/04/2023")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
    }
}


struct StudentDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentDetail(student: modelData.students[0])
    }
}
