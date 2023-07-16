//
//  ShowDetailsView.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI

struct ShowDetailsView: View {
    @State var show:Show
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(show.splash)
                    .resizable()
                    .ignoresSafeArea(.all)
                    .scaledToFill()
                VStack{
                    Spacer()
                    VStack(alignment:.leading){
                        Image(show.splash)
                            .resizable()
                            .scaledToFit()
                        Text(show.title)
                            .font(.title)
                            .fontWeight(.black)
                        Text("Hosted by: \(show.hosts.joined(separator: ", "))")
                        Text(show.air_date)
                        Divider()
                        ScrollView{
                            Text(show.description)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                .frame(width: (geo.size.width - 50.0))
            }.frame(width: geo.size.width)
        }
    }
}

#Preview {
    ShowDetailsView(show: dummy_show)
}
