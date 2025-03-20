//
//  NetworkManager.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - 1) GET minimal search results
    func searchRecipes(
        query: String,
        cuisine: String,
        completion: @escaping (Result<[SearchResult], Error>) -> Void
    ) {
        let baseURL = "https://api.spoonacular.com/recipes/complexSearch"

        let parameters: [String: Any] = [
            "apiKey": "Put-Your-APIKEY-here",
            "query": query,
            "cuisine": cuisine,
            "number": 20
            // "instructionsRequired": true,  // optional
            // "fillIngredients": false,
            // "addRecipeInformation": false,
        ]

        AF.request(baseURL, method: .get, parameters: parameters)
            .responseString { debugResponse in
                if let error = debugResponse.error {
                    print("Error from responseString:", error.localizedDescription)
                }
                print("RAW JSON (search):", debugResponse.value ?? "No response")
            }
            .validate()
            .responseDecodable(of: SearchResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // MARK: - 2) GET full recipe detail
    func fetchRecipeDetail(
        id: Int,
        completion: @escaping (Result<RecipeDetail, Error>) -> Void
    ) {
        let detailURL = "https://api.spoonacular.com/recipes/\(id)/information"
        let params: [String: Any] = [
            "apiKey": "Put-Your-APIKEY-here"
        ]

        AF.request(detailURL, method: .get, parameters: params)
            .responseString { debugResponse in
                print("RAW JSON (detail):", debugResponse.value ?? "No response")
            }
            .validate()
            .responseDecodable(of: RecipeDetail.self) { response in
                switch response.result {
                case .success(let detail):
                    completion(.success(detail))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // MARK: - POST Request (Example placeholder)
    func postSampleData(
        title: String,
        body: String,
        userId: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let parameters: [String: Any] = [
            "title": title,
            "body": body,
            "userId": userId
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success(let data):
                    if let data = data {
                        completion(.success(data))
                    } else {
                        let noDataError = AFError.responseValidationFailed(reason: .dataFileNil)
                        completion(.failure(noDataError))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
