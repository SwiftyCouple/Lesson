//
//  HomeViewController.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var syllabusTableView: UITableView!
    
    private var topicList: [Topic] = []
    private var selectedTopic: Topic!

    override func viewDidLoad() {
        super.viewDidLoad()

        syllabusTableView.register(
            TopicTableViewCell.nib,
            forCellReuseIdentifier: TopicTableViewCell.identifier
        )
        
        syllabusTableView.dataSource = self
        syllabusTableView.delegate = self
        
        downloadSyllabusTopic()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        syllabusTableView.reloadData()
    }
    
    @IBAction func infoAction(_ sender: Any) {
        performSegue(withIdentifier: "infoScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        
        if let detailsVC = vc as? DetailsViewController {
            detailsVC.topic = selectedTopic
        }
    }
    
    
    //MARK: - Netowk Call
    private func downloadSyllabusTopic() {
        let url = URL(string: "https://my-json-server.typicode.com/swiftycouple/Lesson/topics")
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: url!) { data, _, error in
            guard let data = data, error == nil else {
                print(error!)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let topicList = try jsonDecoder.decode([Topic].self, from: data)
                self.topicList = topicList
                DispatchQueue.main.async {
                    self.syllabusTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TopicTableViewCell.identifier,
            for: indexPath
        ) as? TopicTableViewCell else {
            fatalError()
        }
        
        let topic = topicList[indexPath.row]
        
        cell.configure(
            title: topic.title,
            timeInSecond: topic.timeInSec,
            progress: topic.progress
        )
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTopic = topicList[indexPath.row]
        
        performSegue(withIdentifier: "detailViewController", sender: nil)
    }
}
