//
//  ProjectsView.swift
//  STest
//
//  Created by Mehmet Karaaslan on 17.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Profil")
                    }.padding(.leading)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Form {
                Section(header: Text("Oluşturduğum projeler")) {
                    Text("coming")
                }
                Section(header: Text("Katıldığım projeler")){
                    Text("soon")
                }
            }//on tap navigate to next view to see details
            
            
            VStack {
                NavigationLink(destination: CreateProjectView()) {
                    HStack {
                        Text("Proje Oluştur").foregroundColor(.mainColor)
                        MyImage(imageName: "arrowshape.turn.up.right")
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.mainColor)
                    )
                }
            }.padding([.leading, .trailing])
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
