//
//  MyViewController.swift
//  login2
//
//  Created by Temp on 22/02/23.
//

import UIKit

class MyViewController: UIViewController{
    var tasks:[String] = []
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpTableView()
    }
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    @IBAction func addTasks(_ sender: Any) {
        let alertControler = UIAlertController(title: "Новая задача", message: "Что добавить?", preferredStyle: .alert)
        let action = UIAlertAction(title: "save", style: .default){ action in
            let tf = alertControler.textFields?.first
            if let newTask = tf?.text{
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        alertControler.addAction(action)
        alertControler.addAction(cancel)
        present(alertControler, animated: true)
        
        
        alertControler.addTextField()
    }
    
}




extension MyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
    
    
    
}
