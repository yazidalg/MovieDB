//
//  HomeView.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading){
                    Text("Popular Movie")
                        .font(.headline)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.popularMovieList) { movie in
                                moviePopularRow(movie)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .onAppear {
                Task {
                    await viewModel.getPopularMovies()
                }
            }
            .refreshable {
                Task {
                    await viewModel.getPopularMovies()
                }
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack {
                        Text("Movie DB")
                            .font(.title)
                            .bold()
                    }
                }
            }
        }
    }
}

extension HomeView {
    @ViewBuilder
    func moviePopularRow(_ moviePopular: Result) -> some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: Constant.baseImgUrl + (moviePopular.backdropPath ?? ""))) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                case .failure(let error):
                    Text("Error")
                case .empty:
                    ProgressView()
                default:
                    ProgressView()
                }
            }
            .scaledToFill()
            .frame(width: 150, height: 190)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack {
                Text(moviePopular.title ?? "")
                    .bold()
                Text(moviePopular.releaseDate ?? "")
            }
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
