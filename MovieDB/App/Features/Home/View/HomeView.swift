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
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.popularMovieList) { index in
                        Text(index.title ?? "")
                    }
                }
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

#Preview {
    HomeView(viewModel: HomeViewModel())
}
