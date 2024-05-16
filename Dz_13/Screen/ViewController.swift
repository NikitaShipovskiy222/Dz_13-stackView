//
//  ViewController.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 12/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let item = ModelSection.mockData()
    
    
    private lazy var textLabel: UILabel = {
        .config(view: $0) { [weak self] view in
            view.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
            view.font = UIFont(name: "Ubuntu-Bold", size: 20)
            view.textAlignment = .center
            view.textColor = .white
            view.numberOfLines = 0
        }
    }(UILabel())
    
    
    private lazy var iconBike = MakeIcon.setupMakeIcon(img: .bike)
    private lazy var iconPoll = MakeIcon.setupMakeIcon(img: .pool)
    private lazy var iconVolleyball = MakeIcon.setupMakeIcon(img: .volleyball)
    private lazy var iconFlag = MakeIcon.setupMakeIcon(img: .flag)
    
    private lazy var textFirst = MakeText.makeText(text: "Lorem ipsum dolor sit amet consectetur.")
    private lazy var textSecond = MakeText.makeText(text: "Lorem ipsum dolor sit amet consectetur.")
    private lazy var textThird = MakeText.makeText(text: "Lorem ipsum dolor sit amet")
    private lazy var textLast = MakeText.makeText(text: "Lorem ipsum dolor")
    
    private lazy var circle = MakeCircle.makeCircle(x: 15, y: 10, icon: iconBike)
    private lazy var circle2 = MakeCircle.makeCircle(x: 15, y: 10, icon: iconPoll)
    private lazy var circle3 = MakeCircle.makeCircle(x: 15, y: 10, icon: iconVolleyball)
    private lazy var circle4 = MakeCircle.makeCircle(x: 15, y: 10, icon: iconFlag)
    
    
    private lazy var firstView = MakeWhiteView.makeWhiteView(w: 370, h: 72, addIcon: circle, addText: textFirst)
    private lazy var secondView = MakeWhiteView.makeWhiteView(w: 370, h: 72, addIcon: circle2, addText: textSecond)
    private lazy var thirdView = MakeWhiteView.makeWhiteView(w: 370, h: 72, addIcon: circle3, addText: textThird)
    private lazy var foardView = MakeWhiteView.makeWhiteView(w: 370, h: 72, addIcon: circle4, addText: textLast)
    
    private lazy var vStack: UIStackView = {
        .config(view: $0) { [weak self] stack in
            guard let self = self else {return}
            stack.axis = .vertical
            stack.spacing = 20
            stack.distribution = .fillEqually
            [firstView, secondView, thirdView, foardView].forEach{
                stack.addArrangedSubview($0)
            }
        }
    }(UIStackView())
    
    
    private lazy var titleButton: UILabel = {
        $0.text = "Lorem ipsum dolor sit amet"
        $0.font = UIFont(name: "Ubuntu-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .mainBlack
        $0.numberOfLines = 0
        $0.textAlignment = .left
        return $0
    }(UILabel(frame: CGRect(x: 33, y: 25, width: 174, height: 16)))
    
    
    private lazy var nextTitle: UILabel = {
        $0.text = "Далее"
        $0.font = UIFont(name: "Ubuntu-Bold", size: 20)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .mainBlack
        return $0
    }(UILabel(frame: CGRect(x: titleButton.frame.width + 51, y: 20, width: 64, height: 23)))
    
    private lazy var arrowButton: UIButton = {
        $0.setImage(.arrow, for: .normal)
        $0.clipsToBounds = true
        return $0
    }(UIButton(frame: CGRect(x: nextTitle.frame.width + 231, y: 22, width: 20, height: 20)))
    
    private lazy var whiteButton: UIView = {
        .config(view: $0) { [weak self] view in
            guard let self = self else {return}
            view.backgroundColor = .mainWhite
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            view.addSubview(titleButton)
            view.addSubview(nextTitle)
            view.addSubview(arrowButton)
        }
    }(UIView())
    
//
//    private lazy var buttonWhite: UIButton = {
//        .config(view: $0) { [weak self] btn in
//            btn.setTitle("Lorem ipsum dolor sit amet", for: .normal)
//            btn.titleLabel?.font = UIFont(name: "Ubuntu-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
//            btn.tintColor = .black
//            btn.backgroundColor = .mainWhite
//            b
//        }
//    }(UIButton())
    
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: IconCollectionViewCell.reuseId)
        $0.register(NextCollectionViewCell.self, forCellWithReuseIdentifier: NextCollectionViewCell.reuseId)
        $0.backgroundColor = .black
        return $0
    }(UICollectionView(frame: CGRect(x: 30, y: 244, width: view.frame.width - 60, height: 600), collectionViewLayout: getLayout()))
    
    
    private func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            switch section {
            case 0: return self?.makeIconSection()
            default: return self?.makeNextSection()
            }
        }
    }
    
    private func makeIconSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(92))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
    
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func makeNextSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 130, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         let titleFont = UIFont(name: "Ubuntu-Bold", size: 30)
         let title = "О нас"
         let titleSize = title.size(withAttributes: [.font: titleFont!])

         let frame = CGRect(x: 0, y: 0, width: titleSize.width, height: 20.0)
         let titleLabel = UILabel(frame: frame)
         titleLabel.font = titleFont
         titleLabel.textColor = .white
         titleLabel.textAlignment = .center
         titleLabel.text = title
         navigationItem.titleView = titleLabel
         navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
//
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family \(family) Font names: \(names)")
//            
//        }
        
        [textLabel, vStack, whiteButton].forEach{
            view.addSubview($0)
        }
        
        makeConstraint()
        
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 154),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            vStack.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 45),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            vStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -285),
            
            whiteButton.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 190),
            whiteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            whiteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            whiteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ])
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        item.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item[section].model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let items = item[indexPath.section].model[indexPath.item]
        
        switch indexPath.section {
            
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCollectionViewCell.reuseId, for: indexPath) as? IconCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NextCollectionViewCell.reuseId, for: indexPath) as? NextCollectionViewCell else {return UICollectionViewCell()}
            cell.setupCell(item: items)
            return cell
        }
        
    }
    
    
}

