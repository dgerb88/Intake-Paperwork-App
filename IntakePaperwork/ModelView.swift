//
//  ModelView.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import Foundation

class SurveyModel: ObservableObject {
    @Published var surveys = [Survey]()
    
    init() {
        getRemoteData()
    }
    func getRemoteData() {
        let UrlString = "https://dgerb88.github.io/Intake-Paperwork-data/FunctionalSurveys.json"
        let url = URL(string: UrlString)
        guard url != nil else {
            return
        }
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let surveys = try decoder.decode([Survey].self, from: data!)
                DispatchQueue.main.async {
                    self.surveys += surveys
                }
            }
            catch {
                print("Couldn't parse remote json")
            }
            
        }
        dataTask.resume()
    }
    
}
