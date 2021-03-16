import UIKit

class UserDetailViewController: BaseViewController {
    //MARK: Variables
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = UserDetailViewModel()
    let dataSource = UserDetailDatasource()
    var callbackForRefreshDetails: Callback?
    
    //MARK:- Activity life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.navigationBar.isHidden = false
        viewModel.fetchUserDetailsFromLocal()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        callbackForRefreshDetails?()
    }
    
    func setupUI() {
        setupTableView(tableView: tableView)
        title = viewModel.userDetails?.login
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
    func callbackHandler(ofViewModel callback: Enum_UserDetailViewModelCallback) {
        switch callback {
        case .none:
            break
        case .reloadData:
            tableView.reloadData()
            break
        case .bindDetails(ofUser: let userDetail):
            dataSource.userDetail = userDetail
            title = userDetail.login ?? viewModel.userDetails?.login
            tableView.reloadData()
            break
        }
    }
    
    func callbackHandler(ofDataSource callback: Enum_UserDetailDataSourceCallback) {
        switch callback {
        case .none:
            break
        case .reloadData:
            tableView.reloadData()
            break
        case .saveNote:
            if let cell = tableView.cellForRow(at: IndexPath(row: UserDetailDatasource.Enum_UserDetailRow.notes.rawValue, section: 0)) as? TextViewTableViewCell {
                let note = cell.textView.text
                dataSource.userListDetail?.note = note
                CoreDBManager.sharedDatabase.saveContext()
                showToast(message: "Note updated")
                view.endEditing(true)
            }
            break
        }
    }
    
    // MARK: TableView setup
    func setupTableView(tableView: UITableView) {
        
        let arrCellIds: [String] = [
            ImageTableViewCell.identifier,
            UserInfoTableViewCell.identifier,
            TextViewTableViewCell.identifier,
            ButtonTableViewCell.identifier
        ]
        
        for id in arrCellIds {
            tableView.register(id)
        }
        
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.backgroundColor = .clear
        
        tableView.bounces = true
        tableView.allowsSelection = true
        
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        
        tableView.setHeaderFooterView(headHeight: 5, footHeight: 5)
    }
    
}
