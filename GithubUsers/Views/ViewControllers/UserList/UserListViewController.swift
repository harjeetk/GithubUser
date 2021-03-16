//
//  ViewController.swift
//
//  Created by C100-105 on 19/08/20.
//  Copyright © 2020 Narola. All rights reserved.
//

import UIKit

class UserListViewController: BaseViewController {
    //MARK: Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var refreshControl = UIRefreshControl()
    let viewModel = UserListViewModel()
    let dataSource = UserListDatasource()
    
    var itemList: [UserDataModel] = []
    
    //MARK:- Activity life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
        
        pullToRefreshHandler()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        
        searchBar.delegate = self
        
        setupTableView(tableView: tableView)
        tableView.reloadData()
    }
    
    func bindUI() {
        bindUI(viewModel: viewModel)
        
        viewModel.callbackFor.bind({
            self.callbackHandler(ofViewModel: $0)
        })
        
        dataSource.callbackFor.bind({
            self.callbackHandler(ofDataSource: $0)
        })
    }
    
    // MARK: DataSource-ViewModel callback handler method
    func callbackHandler(ofViewModel callback: Enum_UserListViewModelCallback) {
        switch callback {
        case .none:
            break
        case .bindItems(items: let items, isPullRefresh: let isPullRefresh):
            if isPullRefresh {
                refreshControl.endRefreshing()
                itemList.removeAll()
            }
            refreshData(items: items)
            break
        case .fetchLocalItems:
            refreshControl.endRefreshing()
            if dataSource.userList.isEmpty {
                refreshData(items: [])
            }
            break
        case .noItemFound:
            tableView.reloadData()
            break
        }
    }
    
    func callbackHandler(ofDataSource callback: Enum_UserListDataSourceCallback) {
        switch callback {
        case .none:
            break
        case .callLoadMore(forOffset: let offset):
            viewModel.fetchUserList(isPullToRefresh: false, offset: offset)
            break
        case .navigateToDetails(user: let user):
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController else {
                return
            }
            vc.viewModel.userDetails = user
            vc.dataSource.userListDetail = user
            vc.callbackForRefreshDetails = {
                self.refreshData(items: self.itemList)
            }
            navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
    
    // MARK: TableView setup
    func setupTableView(tableView: UITableView) {
        tableView.accessibilityIdentifier = "userListTable"
        
        let arrCellIds: [String] = [
            UserDetailTableViewCell.identifier
        ]
        
        for id in arrCellIds {
            tableView.register(id)
        }
        
        tableView.delegate = self.dataSource
        tableView.dataSource = self.dataSource
        tableView.backgroundColor = .clear
        
        tableView.bounces = true
        tableView.allowsSelection = true
        
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        
        tableView.setHeaderFooterView(headHeight: 5, footHeight: 5)
        setupSwipeToRefresh(view: tableView)
    }
    
    //MARK: Swipe gesture handled here
    func setupSwipeToRefresh(view: UIScrollView) {
        refreshControl.addTarget(self, action: #selector(self.pullToRefreshHandler), for: .valueChanged)
        refreshControl.tintColor = .blue
        view.refreshControl = refreshControl
    }
    
    @objc private func pullToRefreshHandler() {
        refreshControl.tag = 1
        if Reachability.isConnectedToNetwork() {
            viewModel.fetchUserList(isPullToRefresh: true, offset: 0)
        } else {
            refreshControl.endRefreshing()
            refreshData(items: [])
            showToast(message: "No internet connection available")
        }
    }
    
    func refreshData(items: [UserDataModel]) {
        self.itemList.append(contentsOf: items)
        
        let items = CoreDBAdaptor.sharedDataAdaptor.fetchAllUsersList(ofItems: itemList)
        dataSource.append(items: items, isAllowLoadMore: viewModel.isAllowLoadMore)
        tableView.reloadData()
    }
    
}
extension UserListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        search(withText: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        
        searchBar.text = ""
        search(withText: "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(withText: searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = !(searchBar.text ?? "").isEmpty
    }
    
    func search(withText text: String) {
        var tempUserList: [UserCDModel] = []
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return refreshData(items: itemList)
        } else {
            for user in dataSource.userList {
                if (user.login ?? "").lowercased().contains(text.lowercased()) ||
                    (user.note ?? "").lowercased().contains(text.lowercased()) {
                    tempUserList.append(user)
                }
            }
        }
        
        dataSource.append(items: tempUserList, isAllowLoadMore: text.isEmpty ? viewModel.isAllowLoadMore : false)
        tableView.reloadData()
    }
}
