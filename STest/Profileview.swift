//
//  Profileview.swift
//  STest
//
//  Created by Mehmet Karaaslan on 8.04.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct Profileview: View {
    
    @State var userImage: Image? = nil
    @State var showImageSheet = false
    @State var showImagePicker = false
    @State var useCamera = false
    
    @State var showSettings = false
    
    @State var userName = "an example name"
    @State var userMail = "example@example.com"
    //@State var userPhone = "" //: so i need this?
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    MyImage(imageName: "gear")
                        .onTapGesture {
                            self.showSettings = true
                        }
                        .sheet(isPresented: $showSettings, content: {
                            SettingsView()
                        })
                    Spacer()
                    MyImage(imageName: "bell")
                }
                VStack(spacing: 32) {
                    //user image
                    ZStack(alignment: .bottomTrailing) {
                        if(userImage != nil){
                            userImage?.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                        }
                        else {
                            ZStack {
                                Color.gray
                                    .frame(width: 150, height: 150)
                                                    
                                Image(systemName: "camera").imageScale(.large)

                            }.clipShape(Circle())
                        }
                        
                        Button(action: {
                            self.showImageSheet = true
                        }) {
                            MyImage(imageName: "person.crop.circle.badge.plus")
                                .background(Color.white)
                                .clipShape(Circle())
                                .actionSheet(isPresented: $showImageSheet){
                                    ActionSheet(
                                        title: Text("İşleminizi Seçiniz"),
                                        buttons: userImage == nil ? [
                                            .default(Text("Fotoğraf Çek"), action: {
                                                self.useCamera = true
                                                self.showImagePicker = true
                                            }),
                                            .default(Text("Galeriden Seç"), action: {
                                                self.useCamera = false
                                                self.showImagePicker = true
                                            }),
                                            .cancel(Text("Vazgeç"))
                                        ]:[
                                            .default(Text("Fotoğraf Çek"), action: {
                                                self.useCamera = true
                                                self.showImagePicker = true
                                            }),
                                            .default(Text("Galeriden Seç"), action: {
                                                self.useCamera = false
                                                self.showImagePicker = true
                                            }),
                                            .destructive(Text("Fotoğrafı Kaldır"), action: {
                                                self.deleteImage()
                                            }),
                                            .cancel(Text("Vazgeç"))
                                    ])
                            }
                        }.sheet(isPresented: $showImagePicker, content: {
                            CaptureImageView(isShown: self.$showImagePicker, image: self.$userImage, useCamera: self.$useCamera)
                        })
                    }
                    // user image ends
                    
                    VStack(spacing: 16) {
                        MyText(header: Text("Kullanıcı Adı"), text: userName, imageName: "person.circle")
                        MyText(header: Text("Email"), text: userMail, imageName: "envelope")
                        NavigationLink(destination: TeamsView()) {
                            HStack {
                                Text("Takımlarım").foregroundColor(.mainColor)
                                MyImage(imageName: "arrowshape.turn.up.right")
                            }
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.mainColor)
                            )
                        }
                        NavigationLink(destination: ProjectsView()) {
                            HStack {
                                Text("Projelerim").foregroundColor(.mainColor)
                                MyImage(imageName: "arrowshape.turn.up.right")
                            }
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.mainColor)
                            )
                        }
                        
                        
                        
                        
                        
                    }
                }.frame(maxHeight: .infinity, alignment: .top)
                
            }
            .padding([.leading, .trailing])
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func deleteImage(){
        self.userImage = nil //: firebase
    }
}

struct Profileview_Previews: PreviewProvider {
    static var previews: some View {
        Profileview()
    }
}
