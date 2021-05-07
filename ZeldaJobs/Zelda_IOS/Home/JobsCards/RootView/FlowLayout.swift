//
//  FlowLayout.swift
//  ZeldaJobs
//
//  Created by Hossam on 07/05/2021.
//


import UIKit
class Flowlayout : UICollectionViewFlowLayout {
    private var attributes : [UICollectionViewLayoutAttributes] = []
    private var contentSize : CGSize = .zero
    private let itemWidth : CGFloat = 231
    private let itemHeight : CGFloat = 309
    private let spacing: CGFloat = 0
    private let leadingSafeArea : CGFloat = 0
    private var isFirstLoad = true
   
    override var collectionViewContentSize: CGSize {
        return .init(
            width: (itemWidth + spacing) * CGFloat(collectionView!.numberOfItems(inSection: 0)) + leadingSafeArea*2  ,
            height: itemHeight)
    }
    
    
    override func prepare() {
        super.prepare()
        attributes.removeAll()
        
        var xValue : CGFloat = 0
        for item in 0..<collectionView!.numberOfItems(inSection: 0) {
            let attribute = createAttributeForIndex(item: item)
            let scaleValue = getScaleValue( index: item)
            let frame = CGRect.init(x: xValue, y: 0, width: itemWidth, height: itemHeight)
            attribute.setAttributesValues(scaleValue: scaleValue, frame: frame)
            xValue += spacing + itemWidth
            attributes.append(attribute)
        }
        
        if isFirstLoad {
            configCollectionViewForFirstLoad()
            isFirstLoad = false
        }
    }
    
   private  func createAttributeForIndex(item : Int)->UICollectionViewLayoutAttributes {
        let indexPath = IndexPath(item: item, section: 0)
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        return attribute
    }
     func configCollectionViewForFirstLoad(){
        collectionView!.decelerationRate = .fast
        
        collectionView!.isPagingEnabled = true
//        collectionView!.setContentOffset(.init(x:attributes[1].center.x , y:0), animated: false )
    }
    
   private  func getScaleValue( index : Int)->CGFloat{
        let offestPerItem = itemWidth
        let currentItemOffset =  CGFloat(index) * offestPerItem
    let centerOfViewOffset = collectionView!.contentOffset.x + (collectionView!.bounds.width/2) - (itemWidth / 2)
        let currentRatio =  abs(centerOfViewOffset - currentItemOffset) / 1000
    if index == 1 {
        print(currentRatio)
    }
         return 1 - currentRatio
    }
    
     override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        attributes[indexPath.row]
    }
    
    
   
}
