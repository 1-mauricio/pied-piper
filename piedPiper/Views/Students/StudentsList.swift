//
//  StudentsList.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 21/03/23.
//

import SwiftUI

struct StudentsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var students: [Student] {
        modelData.students
    }
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(students) { student in
                    NavigationLink {
                        StudentsDetail(student: student)
                    } label: {
                        StudentsRow(student: student)
                    }
                }
            }
            .navigationBarTitle("Pied Piper", displayMode: .inline)
        }
    }
}

struct StudentsList_Previews: PreviewProvider {
    static var previews: some View {
        StudentsList()
            .environmentObject(ModelData())
    }
}
