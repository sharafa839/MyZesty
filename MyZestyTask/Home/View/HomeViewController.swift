//
//  HomeViewController.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import UIKit

class HomeViewController: UITableViewController {
        
    let tasks = [Tasks(task: .first), Tasks(task: .second)]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ahmed")
        tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    private func navigateToFirstTask() {
        let firstTaskViewModel = FilterViewModel()
        let firstTaskViewController = FilterViewController(viewModel: firstTaskViewModel)
        navigationController?.pushViewController(firstTaskViewController, animated: true)
    }
    
    private func navigateToSecondTask() {
        let uploadImageViewController = UploadImageViewController()
        navigationController?.pushViewController(uploadImageViewController, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.configure(with: tasks[indexPath.row].task.rawValue)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskType = tasks[indexPath.row].task
        if taskType == .first {
            navigateToFirstTask()
        }else {
            navigateToSecondTask()
        }
    }
}
