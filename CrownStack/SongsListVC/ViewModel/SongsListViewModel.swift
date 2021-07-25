//
//  SongsListViewModel.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import Foundation

class SongsListViewModel {
    var songsList = [ResultsModel]()
    func getSongsList(onCompletion: @escaping (Result<SongsResponseModel, NetworkError>)-> ()) {
        let resource: RequestManager<SongsResponseModel> = RequestManager(path: "list")
        resource.asyncResourceLoading { (result) in
            print_debug(object: "getSongsList=====\(String(describing: result))")
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let songs = data.results{
                        self.songsList = songs
                        onCompletion(.success(data))
                    }
                    else
                    {
                        onCompletion(.failure(.badURL))
                    }
                }
            case .failure:
                print("FAILED")
                DispatchQueue.main.async {
                    onCompletion(.failure(.badURL))
                }
            }

        }
    }
}
