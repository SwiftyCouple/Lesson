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
        DispatchQueue.main.asyncAfter(deadline: .now()){
            for i in 0...20 {
                let topic = Topic(
                    title: "Title \(i)",
                    timeInSec: 7343,
                    summary: "Summery",
                    keyPoints: ["Points1","Points2","Points3","Points4","Points5"],
                    imageName: "image\(i)",
                    difficulty: .easy,
                    progress: 0.5
                )
                
                self.topicList.append(topic)
            }
            
            self.syllabusTableView.reloadData()
        }
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
