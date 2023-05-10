//
//  ViewController.swift
//  Compositonal Layout with Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 3/5/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var isLoading = false
    private var isLastPage = false //
    
    private let itemsPerPage = 10 // loads 10 data per page cycle
    private var currentPage = 0
    
    private var sectionHeadersFooters: [SupplementaryDataType] = [SupplementaryDataType(header: "Cards", footer: ""),
                                                                  SupplementaryDataType(header: "Categories header", footer: "Categories footer"),
                                                                  SupplementaryDataType(header: "Latest header", footer: "Latest footer"),
                                                                  SupplementaryDataType(header: "", footer: ""),
                                                                  SupplementaryDataType(header: "Card header", footer: "")]
    
    
    private var sectionData: [CellDataType] = [CellDataType(image: "swarma s5", label: "Swarma 1"),
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
    
    // MARK: - properties
    
    enum Section: Int {
        case first
        case second
    }


    struct CellDataType: Hashable {
        let image: String
        let label: String
    }
    
    
    struct SupplementaryDataType {
        let header: String
        let footer: String
    }
    
    
    @Published private var celldata: [CellDataType] = []
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - diff datasources properties
    
    private var collectionDatasource: UICollectionViewDiffableDataSource<Section, CellDataType>!
    
    
    static let headerKind = "headerKind"
    static let footerKind = "footerKind"
    
    //bdfvx
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
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
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.headerKind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        collection.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.footerKind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier)
        
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observe()
        
        navigationItem.title = "FOOD DELIVERY"
        
        collectionViewDidLoad()
        
        configure()
        
        loadDatasource(page: currentPage)
        
    }
    
    
    func collectionViewDidLoad() {
        collectionView.delegate = self
        
//        collectionView.backgroundColor = .clear
        collectionView.backgroundColor = .darkGray
        
        view.addSubview(collectionView)
           
    }
    
    private func observe() {
        $celldata.filter { !$0.isEmpty }.receive(on: DispatchQueue.main).sink { [weak self] products in
            self?.updateSnapshot()
        }.store(in: &cancellables)
    }
    
    
//#warning("configure head test")
    
    func configure() {
        collectionDatasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
            cell.setup(img: itemIdentifier.image, lbl: itemIdentifier.label)
            print(itemIdentifier.image, itemIdentifier.label)
            return cell
        })
        
        collectionDatasource.supplementaryViewProvider = { [self] collectionView, kind, indexPath in
                //             print("collectionView",collectionView,"indexPath", indexPath, "kind", kind )
            switch kind {
                case ViewController.headerKind:
                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                    header.setup(head: sectionHeadersFooters[indexPath.section].header)
                    return header
                    
                case ViewController.footerKind:
                    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.footerIdentifier, for: indexPath) as! FooterCollectionReusableView
                    footer.setup(foot: sectionHeadersFooters[indexPath.section].footer, indicatorFlag: isLoading) // isLoading
                    return footer
                    
                default :
                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
                    header.setup(head: "Default header")
                    return header
            }
        }
    }
    
    
    // MARK: - datasource management
    
    func loadDatasource(page: Int) {
        
        if sectionData.count > (currentPage*itemsPerPage) {
            
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.isLoading = false
                self?.currentPage += 1
                let newData = (page * (self?.itemsPerPage)!)..<((page + 1) * (self?.itemsPerPage)!)
                print("newData", newData)
                
                self?.celldata.append(contentsOf: newData.map{ (self?.sectionData[$0] ?? CellDataType(image: "photo.artframe", label: "loading")) })
                self?.isLastPage = newData.upperBound >= (self?.sectionData.count)! // Assumes 100 total items //sectionData.count
            }
        }
        else {
            isLoading = false
            isLastPage = true
        }
        
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, CellDataType>()
        initialSnapshot.appendSections([.first])
        initialSnapshot.appendItems(celldata, toSection: .first)

        collectionView.reloadData()

        print("celldata", celldata)

        collectionDatasource.apply(initialSnapshot, animatingDifferences: true)

    }
    
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellDataType>()
        snapshot.appendSections([.first])
        snapshot.appendItems(celldata, toSection: .first)

        collectionView.reloadData()

        print("celldata", celldata)

        collectionDatasource.apply(snapshot, animatingDifferences: true)

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
            loadDatasource(page: currentPage)
        }
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        
        controller.view.backgroundColor = indexPath.item == 0 ? .yellow : indexPath.item == 1 ? .blue : .red
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
