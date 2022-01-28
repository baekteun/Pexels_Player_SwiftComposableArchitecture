//
//  VideoCard.swift
//  VBA-SCA
//
//  Created by 최형우 on 2022/01/28.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import Service

struct VideoCard: View {
    var video: Video
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: video.image)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                }
                
                VStack(alignment: .leading) {
                    Text("\(video.duration) sec")
                        .font(.caption)
                        .bold()
                    Text("by \(video.user.name)")
                        .font(.caption)
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .shadow(radius: 20)
                .padding()
            }
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
    }
}
