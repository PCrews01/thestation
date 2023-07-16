//
//  MediaCard.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI

struct MediaCard: View {
    @State var show:Show?
    @State var episode:Episode?
    var body: some View {
        ZStack(content: {
            Image(show?.splash ?? episode?.thumb ?? "person.circle")
                .resizable()
                .scaledToFill()
                .clipped()
            VStack(alignment: .leading){
                Spacer()
                VStack(alignment: .leading){
                    Text(show?.title ?? episode?.title ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack{
                        Text(show?.day ?? episode?.air_date ?? "")
//                        Text(show?.title ? "@" : "")
                        Text(show?.time ?? "S\(episode?.season ?? 0)E: \(episode?.number ?? 0)" )
                    }
                    Text(show?.description ?? episode?.description ?? "")
                }
                .frame(width: 300, height: 100)
                .padding()
                .aspectRatio(contentMode: .fit)
                .background(.ultraThinMaterial)
            }
        })
        .frame(width: 300, height: 500)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

#Preview {
    MediaCard(show: dummy_show_2)
}
