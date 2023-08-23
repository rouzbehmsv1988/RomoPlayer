//
//  SongListRowView.swift
//  RomoPlayer
//
//  Created by rouzbeh on 22.08.23.
//

import SwiftUI

typealias songListData = SongListRowView.Data
struct SongListRowView: View {
    struct Data {
        var artistImage: String
        var title: String
        var artistName: String
        var playTapped: () -> ()
    }
    @State var image: Image?
    var data: songListData
    @State var isLoading = false
    @StateObject var viewModel = SongListRowViewModel()
    var body: some View {
        HStack {
            if  viewModel.image != nil {
                viewModel.image
                    .resizable().clipShape(Circle())
                    .frame(width: 80, height: 80).shadow(color: .white, radius: 5).padding()
            } else {
                ZStack(alignment: .center) {
                    Circle().fill(.gray).frame(width: 80, height: 80).padding()
                    Image(systemName: "arrow.down").frame(width: 20, height: 20).foregroundColor(.black).offset(y: isLoading ? 20 : 0).animation(.easeIn(duration: 1).repeatForever(autoreverses: false), value: isLoading).onAppear {
                        isLoading = true // Start the arrow animation
                    }
                }
            }

            VStack {
                Text(data.artistName).font(.largeTitle).foregroundColor(.white)
                Text(data.title).font(.caption2).foregroundColor(.white)
            }.padding(.trailing)
            ZStack {
                Circle().fill(.white).frame(width: 40, height: 40)
                Image(systemName: "play.fill").foregroundColor(.black).frame(width: 20, height: 20)
                
            }.onTapGesture {
                data.playTapped()
            }.padding()
           

        }.frame(maxWidth: .infinity).background(.black)
            .shadow(color: .white, radius: 2)
        .onAppear {
            viewModel.loadImageFromURL(data.artistImage)
        }
    }
    

}

struct SongListRowView_Previews: PreviewProvider {
    static var previews: some View {
        var data = songListData (artistImage: "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg", title: "My Song", artistName: "Rouzbeh", playTapped: {})
        SongListRowView(image: Image(""), data: data)
    }
}
