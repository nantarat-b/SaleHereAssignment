//
//  NewGoalViewController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class NewGoalViewController: BaseViewController {

    @IBOutlet weak var newGoalPaddingHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var newGoalPaddingView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleGoalLabel: UILabel!
    @IBOutlet weak var goalInputField: BasePaddingTextField!
    
    @IBOutlet weak var goalHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var goalChoiceCollectionView: UICollectionView!
    
    @IBOutlet weak var amountInputField: BaseTextField!
    @IBOutlet weak var selectDateInputField: BaseSelectTextField!
    
    
    @IBOutlet weak var bankAccountLabel: UILabel!
    @IBOutlet weak var selectAccountInputField: BaseSelectTextField!
    @IBOutlet weak var amountPerMonthInputField: BaseTextField!
    
    @IBOutlet weak var newGoalButton: BaseButton!
    
    private var goalListViewModelItems :[NewGoalListViewModel] = []
    private var goalListSelectedItems :Int = -1
    
    
    let presenter: NewGoalPresenter = NewGoalPresenter(service: NewGoalService())

    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.presenter.attachView(view: self)
        self.presenter.attachRouter(router: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView()
        self.setUpTitleGoalLabel()
        self.setUpGoalInputField()
        self.setUpGoalChoiceCollectionView()
        self.setupAmountInputField()
        self.setupSelectDateInputField()
        self.setupBankAccountLabel()
        self.setupSelectAccountInputField()
        self.setupAmountPerMonthInputField()
        self.setUpNewGoalButton()
        self.setUpScrollView()
        
        self.presenter.getGoalList()
    }
    
    private func setUpView() {
        self.newGoalPaddingHeightConstraint.constant = self.getHeightTopArea()
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setUpTitleGoalLabel() {
        self.titleGoalLabel.textColor = .white
        self.titleGoalLabel.font = UIFont.systemFont(ofSize: 21.0, weight: .semibold)
    }
    
    private func setUpGoalInputField() {
        self.goalInputField.font = UIFont.systemFont(ofSize: 20.0)
        self.goalInputField.textColor = .black
        self.goalInputField.tintColor = #colorLiteral(red: 0.9198692441, green: 0.6914033294, blue: 0, alpha: 1)
    }
    
    private func setUpGoalChoiceCollectionView() {
        self.goalChoiceCollectionView.showsHorizontalScrollIndicator = false
        self.goalChoiceCollectionView.delegate = self
        self.goalChoiceCollectionView.dataSource = self
        self.goalChoiceCollectionView.isScrollEnabled = false
        
        let size = self.getSizeGoalChoiceCollectionViewCell()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumInteritemSpacing = 16.0
        layout.minimumLineSpacing = 16.0
        layout.scrollDirection = .vertical
        
        self.goalChoiceCollectionView.collectionViewLayout = layout
        self.goalChoiceCollectionView.register(
            UINib(nibName: "NewGoalCollectionViewCell", bundle: Bundle(for: NewGoalCollectionViewCell.self)),
            forCellWithReuseIdentifier: "NewGoalCollectionViewCell"
        )
        
        self.goalHeightConstraint.constant = self.getHeighGoalChoiceCollectionView()
    }
    
    private func setupAmountInputField() {
        self.amountInputField.setUnitText(text: "THB")
        self.amountInputField.setPlaceHolderText(text: "Amount")
        self.amountInputField.inputField.keyboardType = .decimalPad
    }
    
    private func setupSelectDateInputField() {
        self.selectDateInputField.setPlaceHolderText(text: "Select Date")
    }
    
    private func setupBankAccountLabel() {
        self.bankAccountLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
    }
    
    private func setupSelectAccountInputField() {
        self.selectAccountInputField.setPlaceHolderText(text: "Select Account")
    }
    
    private func setupAmountPerMonthInputField() {
        self.amountPerMonthInputField.setUnitText(text: "THB / Month")
        self.amountPerMonthInputField.setPlaceHolderText(text: "")
        self.amountPerMonthInputField.inputField.keyboardType = .decimalPad
    }
    
    private func setUpNewGoalButton() {
        self.newGoalButton.addTarget(self, action: #selector(self.saveNewGoal), for: .touchUpInside)
    }
    
    private func setUpScrollView() {
        self.scrollView.delegate = self
    }
    
    @objc func saveNewGoal() {
        self.presenter.saveNewGoal()
    }
    
    private func getHeighGoalChoiceCollectionView() -> CGFloat {
        let itemCount = Double(self.goalListViewModelItems.count)
        let row = CGFloat(ceil(Double((itemCount / 3.0))))
        let line = CGFloat(row - 1)
        return (self.getSizeGoalChoiceCollectionViewCell() * row) + (16.0 * line) + 48.0
    }
    
    private func getSizeGoalChoiceCollectionViewCell() -> CGFloat {
        return (UIScreen.main.bounds.width - 48 - 32) / 3.0
    }
}

extension NewGoalViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.goalListViewModelItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.goalChoiceCollectionView.dequeueReusableCell(withReuseIdentifier: "NewGoalCollectionViewCell", for: indexPath) as! NewGoalCollectionViewCell
        cell.configCell(
            data: self.goalListViewModelItems[indexPath.item],
            isActive: (self.goalListSelectedItems == indexPath.item)
        )
        return cell
    }
}

extension NewGoalViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.goalListSelectedItems = indexPath.item
        self.goalChoiceCollectionView.reloadData()
    }
}

extension NewGoalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.getSizeGoalChoiceCollectionViewCell()
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 24, left: 24, bottom: 24, right: 24)
    }
}

extension NewGoalViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.backgroundColor = self.scrollView.contentOffset.y > 0 ? .white : #colorLiteral(red: 0.9050784707, green: 0.6481675506, blue: 0.1364775002, alpha: 1)
    }
}

// MARK: - NewGoalViewController
extension NewGoalViewController: NewGoalView {
    func displayGoalList(displayModel: [NewGoalListViewModel]) {
        self.goalListViewModelItems = displayModel
        self.goalChoiceCollectionView.reloadData()
        self.goalHeightConstraint.constant = self.getHeighGoalChoiceCollectionView()
    }
}

// MARK: - NewGoalViewController
extension NewGoalViewController: NewGoalRouter {
    func navigateToHomeViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
