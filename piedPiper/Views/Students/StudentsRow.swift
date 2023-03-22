//
//  StudentsRow.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 21/03/23.
//

import SwiftUI

struct StudentsRow: View {
    var student: Student
    
    var body: some View {
        HStack{
            student.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(student.name)
            
            Spacer()
            Text("5/10")
        }
    }
}

struct StudentsRow_Previews: PreviewProvider {
    static var students = ModelData().students
    
    static var previews: some View {
        Group {
            StudentsRow(student: students[0])
            StudentsRow(student: students[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }

}
