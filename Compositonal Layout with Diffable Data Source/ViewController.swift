//
//  ViewController.swift
//  Compositonal Layout with Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 3/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var isLoading = false
    private var isLastPage = false //
    
    private let itemsPerPage = 10 // loads 10 data per page cycle
    private var currentPage = 0
    
    private var sectionHeadersFooters: [SupplementaryDataType] = [SupplementaryDataType(header: "", footer: ""),
                                                                  SupplementaryDataType(header: "Categories header", footer: "Categories footer"),
                                                                  SupplementaryDataType(header: "Latest header", footer: "Latest footer"),
                                                                  SupplementaryDataType(header: "", footer: ""),
                                                                  SupplementaryDataType(header: "Card header", footer: "")]
    
    
    private var sectionData0: [CellDataType] = [CellDataType(image: "photo 1 s1", label: "Food"),
                                                CellDataType(image: "photo 4 s1", label: "Fresh"),
                                                CellDataType(image: "photo 2 s1", label: "Food"),
                                                CellDataType(image: "photo 4 s1", label: "Fresh")]
    
    private var sectionData1: [CellDataType] = [CellDataType(image: "burger 1 s2", label: "Burger 1"),
                                                CellDataType(image: "burger 2 s2", label: "Burger 2"),
                                                CellDataType(image: "burger 1 s2", label: "Burger 3"),
                                                CellDataType(image: "burger 2 s2", label: "Burger 4"),
                                                CellDataType(image: "burger 1 s2", label: "Burger 5"),
                                                CellDataType(image: "burger 2 s2", label: "Burger 6"),
                                                CellDataType(image: "burger 1 s2", label: "Burger 7"),
                                                CellDataType(image: "burger 2 s2", label: "Burger 8")]
    
    private var sectionData2: [CellDataType] = [CellDataType(image: "pasta 1 s3", label: "Pasta 1"),
                                                CellDataType(image: "spaghetti s3", label: "Spaghetti 2"),
                                                CellDataType(image: "pasta 2 s3", label: "Pasta 3"),
                                                CellDataType(image: "friedRice s3", label: "Fried Rice 4")]
    
    private var sectionData3: [CellDataType] = [CellDataType(image: "pizza s4", label: "Pizza 1"),
                                                CellDataType(image: "spaghetti s3", label: "Spaghetti 2"),
                                                CellDataType(image: "pasta 2 s3", label: "Pasta 3"),
                                                CellDataType(image: "friedRice s3", label: "Fried Rice 4")]
    
    private var sectionData4: [CellDataType] = [CellDataType(image: "swarma s5", label: "Swarma 1"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 2"),
                                                CellDataType(image: "kabab s5", label: "Kabab 3"),
                                                CellDataType(image: "swarma s5", label: "Swarma 4"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 5"),
                                                CellDataType(image: "kabab s5", label: "Kabab 6"),
                                                CellDataType(image: "swarma s5", label: "Swarma 7"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 8"),
                                                CellDataType(image: "kabab s5", label: "Kabab 9"),
                                                CellDataType(image: "swarma s5", label: "Swarma 10"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 11"),
                                                CellDataType(image: "kabab s5", label: "Kabab 12"),
                                                CellDataType(image: "swarma s5", label: "Swarma 13"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 14"),
                                                CellDataType(image: "kabab s5", label: "Kabab 15"),
                                                CellDataType(image: "swarma s5", label: "Swarma 16"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 17"),
                                                CellDataType(image: "kabab s5", label: "Kabab 18"),
                                                CellDataType(image: "swarma s5", label: "Swarma 19"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 20"),
                                                CellDataType(image: "kabab s5", label: "Kabab 21"),
                                                CellDataType(image: "swarma s5", label: "Swarma 22"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 23"),
                                                CellDataType(image: "kabab s5", label: "Kabab 24"),
                                                CellDataType(image: "swarma s5", label: "Swarma 25"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 26"),
                                                CellDataType(image: "kabab s5", label: "Kabab 27"),
                                                CellDataType(image: "swarma s5", label: "Swarma 28"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 29"),
                                                CellDataType(image: "kabab s5", label: "Kabab 30"),
                                                CellDataType(image: "swarma s5", label: "Swarma 31"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 32"),
                                                CellDataType(image: "kabab s5", label: "Kabab 33"),
                                                CellDataType(image: "swarma s5", label: "Swarma 34"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 35"),
                                                CellDataType(image: "kabab s5", label: "Kabab 36"),
                                                CellDataType(image: "swarma s5", label: "Swarma 37"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 38"),
                                                CellDataType(image: "kabab s5", label: "Kabab 39"),
                                                CellDataType(image: "swarma s5", label: "Swarma 40"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 41"),
                                                CellDataType(image: "kabab s5", label: "Kabab 42"),
                                                CellDataType(image: "swarma s5", label: "Swarma 43"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 44"),
                                                CellDataType(image: "kabab s5", label: "Kabab 45"),
                                                CellDataType(image: "swarma s5", label: "Swarma 46"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 47"),
                                                CellDataType(image: "kabab s5", label: "Kabab 48"),
                                                CellDataType(image: "swarma s5", label: "Swarma 49"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 50"),
                                                CellDataType(image: "kabab s5", label: "Kabab 51"),
                                                CellDataType(image: "swarma s5", label: "Swarma 52"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 53"),
                                                CellDataType(image: "kabab s5", label: "Kabab 54"),
                                                CellDataType(image: "swarma s5", label: "Swarma 55"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 56"),
                                                CellDataType(image: "kabab s5", label: "Kabab 57"),
                                                CellDataType(image: "swarma s5", label: "Swarma 58"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 59"),
                                                CellDataType(image: "kabab s5", label: "Kabab 60"),
                                                CellDataType(image: "swarma s5", label: "Swarma 61"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 62"),
                                                CellDataType(image: "kabab s5", label: "Kabab 63"),
                                                CellDataType(image: "swarma s5", label: "Swarma 64"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 65"),
                                                CellDataType(image: "kabab s5", label: "Kabab 66"),
                                                CellDataType(image: "swarma s5", label: "Swarma 67"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 68"),
                                                CellDataType(image: "kabab s5", label: "Kabab 69"),
                                                CellDataType(image: "swarma s5", label: "Swarma 70"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 71"),
                                                CellDataType(image: "kabab s5", label: "Kabab 72"),
                                                CellDataType(image: "swarma s5", label: "Swarma 73"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 74"),
                                                CellDataType(image: "kabab s5", label: "Kabab 75"),
                                                CellDataType(image: "swarma s5", label: "Swarma 76"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 77"),
                                                CellDataType(image: "kabab s5", label: "Kabab 78"),
                                                CellDataType(image: "swarma s5", label: "Swarma 79"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 80"),
                                                CellDataType(image: "kabab s5", label: "Kabab 81"),
                                                CellDataType(image: "swarma s5", label: "Swarma 82"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 83"),
                                                CellDataType(image: "kabab s5", label: "Kabab 84"),
                                                CellDataType(image: "swarma s5", label: "Swarma 85"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 86"),
                                                CellDataType(image: "kabab s5", label: "Kabab 87"),
                                                CellDataType(image: "swarma s5", label: "Swarma 88"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 89"),
                                                CellDataType(image: "kabab s5", label: "Kabab 90"),
                                                CellDataType(image: "swarma s5", label: "Swarma 91"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 92"),
                                                CellDataType(image: "kabab s5", label: "Kabab 93"),
                                                CellDataType(image: "swarma s5", label: "Swarma 94"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 95"),
                                                CellDataType(image: "kabab s5", label: "Kabab 96"),
                                                CellDataType(image: "swarma s5", label: "Swarma 97"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 98"),
                                                CellDataType(image: "kabab s5", label: "Kabab 99"),
                                                CellDataType(image: "swarma s5", label: "Swarma 100"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 101"),
                                                CellDataType(image: "kabab s5", label: "Kabab 102"),
                                                CellDataType(image: "swarma s5", label: "Swarma 103"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 104"),
                                                CellDataType(image: "kabab s5", label: "Kabab 105"),
                                                CellDataType(image: "swarma s5", label: "Swarma 106"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 107"),
                                                CellDataType(image: "kabab s5", label: "Kabab 108"),
                                                CellDataType(image: "swarma s5", label: "Swarma 109"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 110"),
                                                CellDataType(image: "kabab s5", label: "Kabab 111"),
                                                CellDataType(image: "swarma s5", label: "Swarma 112"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 113"),
                                                CellDataType(image: "kabab s5", label: "Kabab 114"),
                                                CellDataType(image: "swarma s5", label: "Swarma 115"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 116"),
                                                CellDataType(image: "kabab s5", label: "Kabab 117"),
                                                CellDataType(image: "swarma s5", label: "Swarma 118"),
                                                CellDataType(image: "chickenFries s5", label: "Chicken Fry 119"),
                                                CellDataType(image: "kabab s5", label: "Kabab 120")]
    
    
    var celldata: [CellDataType] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    struct CellDataType: Hashable {
        let image: String
        let label: String
    }
    
    
    struct SupplementaryDataType {
        let header: String
        let footer: String
    }
    
        // MARK: - diff datasources properties
    #warning("fjshshfbvhs")
    
        // MARK: - properties
    
    enum Section {
        case first
        case second
    }
    
    var collecttionDatasource: UICollectionViewDiffableDataSource<Section, CellDataType>!
//    var tableDatasource: UITableViewDiffableDataSource<Section, Fruit>!
    
    
    static let cellIdentifier = "cell"
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
        //    static let headerIdentifier = "header"
    
    private let collectionView: UICollectionView = {
            //        let layout = UICollectionViewFlowLayout()
            //        layout.scrollDirection = .vertical
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            if (sectionNumber == 0) {
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                    //            (layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
            }
            
            else if (sectionNumber == 1) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                    //                group.contentInsets.leading = 16
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                    //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottom)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
            
            else if (sectionNumber == 2) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 32
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.80), heightDimension: .absolute(120)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topLeading)
                    //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header] //, footer
                
                return section
            }
            
            else if (sectionNumber == 3) {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                    //                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                
                    //                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                    //                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .top)
                    //                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottom)
                    //
                    //                section.boundarySupplementaryItems = [header, footer]
                
                return section
            }
            
            else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 16, bottom: -8, trailing: 0)
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: headerKind, alignment: .topTrailing)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: footerKind, alignment: .bottomTrailing)
                
                section.boundarySupplementaryItems = [header, footer]
                
                return section
            }
        }
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ViewController.cellIdentifier)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
            //        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: ViewController.headerKind, withReuseIdentifier: ViewController.headerIdentifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
//        collectionView.dataSource = self
        
        
        collectionView.backgroundColor = .clear
            //        collectionView.backgroundColor = .darkGray
        navigationItem.title = "FOOD DELIVERY"
        
        view.addSubview(collectionView)
        
        loadData(page: currentPage)
    }
    
    private func loadData(page: Int) {
        isLoading = true
        
        if sectionData4.isEmpty {
                //            fatalError("Null data error!")
            print("Null data error!")
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.isLoading = false
                self?.currentPage += 1
                let newData = (page * (self?.itemsPerPage)!)..<((page + 1) * (self?.itemsPerPage)!)
                print("newData", newData)
                
                self?.celldata.append(contentsOf: newData.map{ (self?.sectionData4[$0])! })
                self?.isLastPage = newData.upperBound >= (self?.sectionData4.count)! // Assumes 100 total items //sectionData4.count
                
                    //                self?.collectionView.reloadSections(IndexSet(integer: 4))
                    //                self?.collectionView.reloadData()
            }
        }
            //        collectionView.reloadSections(IndexSet(integer: 4))
        collectionView.reloadData()
        
        print("celldata", celldata)
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            checkForLoadMoreData()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        checkForLoadMoreData()
    }
    
    private func checkForLoadMoreData() {
        guard !isLoading && !isLastPage else { return }
        
        let offsetY = collectionView.contentOffset.y
        let contentHeight = collectionView.contentSize.height
        let height = collectionView.frame.size.height
        
        print(offsetY, contentHeight, height)
        if offsetY > contentHeight - height {
            loadData(page: currentPage)
        }
    }
}



extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionHeadersFooters.count
            //        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return sectionData0.count
                //            return 3
        }
        else if section == 1 {
            return sectionData1.count
                //            return 8
        }
        else if section == 2 {
            return sectionData2.count
                //            return 6
        }
        else if section == 3 {
            return sectionData3.count
                //            return 4
        }
        else {
            return celldata.count
                //            return sectionData4.count
                //            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            //        print("supp indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        switch kind {
            case ViewController.headerKind:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: sectionHeadersFooters[indexPath.section].header)
                    //                print(indexPath.section)
                return header
                
                    //                if indexPath.section == 1 {
                    //                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                    //                    header.setup(head: "Categories header")
                    //                    return header
                    //                }
                
            case ViewController.footerKind:
                if indexPath.section == 4 {
                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: isLoading) // isLoading
                    return footer
                }
                else {
                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: false)
                    return footer
                }
                
                
                    //                if indexPath.section == 1 {
                    //                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    //                    footer.setup(foot: "Categories footer", indicatorFlag: false)
                    //                    return footer
                    //                }
                    
                
            default :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                header.setup(head: "Default header")
                return header
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            //        print("Cell indexPath row, section, item", indexPath.row, indexPath.section, indexPath.item)
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData0[indexPath.item].image, and: sectionData0[indexPath.item].label)
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData1[indexPath.item].image, and: sectionData1[indexPath.item].label)
            return cell
        }
        
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData2[indexPath.item].image, and: sectionData2[indexPath.item].label)
            return cell
        }
        
        if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: sectionData3[indexPath.item].image, and: sectionData3[indexPath.item].label)
            return cell
        }
        
        if indexPath.section == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(with: celldata[indexPath.item].image, and: celldata[indexPath.item].label) //dynamic
            return cell
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellIdentifier, for: indexPath)
            cell.backgroundColor = .orange
            return cell
        }
        
        
            //        if indexPath.section == 0 && indexPath.item == 0 {
            //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            //            cell.setup(with: "photo 1 s1", and: "Food")
            //            return cell
            //        }
            
        
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        
        controller.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : .red
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
