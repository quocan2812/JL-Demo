//
//  ListViewController.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import UIKit

protocol ListViewControllerProtocol {
    func showDataOnListView(datasource: [ItemCellModel])
    func showAlertIfHasError()
}

class ListViewController: UIViewController {
    
    var interactor : ListInteractorProtocol?
    
    var typeListView: TypeListView!
    
    let identifierCell = "ListTableViewCell"
    
    var listViewModel: ListViewModel?
    
    var activityView: UIActivityIndicatorView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listViewModel = ListViewModel(typeListView: typeListView)
       
        setupView()
        
        registerTableViewCells()
        
        showActivityIndicator()
        self.interactor?.loadDataWithType(typeListView: typeListView)

        // Do any additional setup after loading the view

    }
    
    func setupView() {
        
        self.view.backgroundColor = UIColor.white
        self.title = self.listViewModel?.getTitleListView()
        self.view.addSubview(listTableView)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            listTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
    }
    
    private func registerTableViewCells() {
        
        let textFieldCell = UINib(nibName: identifierCell,
                                  bundle: nil)
        self.listTableView.register(textFieldCell,
                                    forCellReuseIdentifier: identifierCell)
    }
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    func showAlertIfHasError() {
        hideActivityIndicator()
        let alert = UIAlertController(title: "Error", message: "Please try again later", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
        
        }))


        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listViewModel?.datasource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell) as? ListTableViewCell {
            
            if let itemCell = self.listViewModel?.datasource![indexPath.row] {
                cell.configCell(itemCell: itemCell, typeListView: typeListView)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension ListViewController: ListViewControllerProtocol {
    
    func showDataOnListView(datasource: [ItemCellModel]) {
        hideActivityIndicator()
        self.listViewModel?.datasource = datasource
        self.listTableView.reloadData()
    }
}
