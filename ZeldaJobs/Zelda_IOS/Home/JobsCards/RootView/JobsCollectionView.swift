//
//  JobsCollectionView.swift
//  ZeldaJobs
//
//  Created by Hossam on 28/04/2021.
//

import UIKit
import SwiftUI
class JobsCollectionView : UIViewController , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        90
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    lazy var collectionView = view as! UICollectionView
    override func loadView() {
        let flow = JobsCollectionViewlayout()
        view = UICollectionView(frame: .zero, collectionViewLayout: flow)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        collectionView.register(JobCardCellView.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
    }
}


final class fakeViewControllerJobs : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> JobsCollectionView {
        return JobsCollectionView()
    }
    
    func updateUIViewController(_ uiViewController: JobsCollectionView, context: Context) {
        
        
    }
    
    typealias UIViewControllerType = JobsCollectionView
    
    
}
